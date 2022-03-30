<?php

define('KEYS_DIR', dirname(dirname(dirname(__DIR__))).DIRECTORY_SEPARATOR.'.ssh');
define('PRIVATE_DIR', dirname(dirname(dirname(__DIR__))).DIRECTORY_SEPARATOR.'.'.$argv[1]);
define('PROJECT_DIR', dirname(dirname(dirname(__DIR__))).DIRECTORY_SEPARATOR.$argv[1]);

include_once __DIR__.DIRECTORY_SEPARATOR.'api.php';
include_once PRIVATE_DIR.DIRECTORY_SEPARATOR.'config.php';

echo PHP_EOL;

$connection = connect($host, $username, $password);

switch ($argv[2]) {
  case 'artisan-migrate':
    execute(
      $connection,
      [$php.' artisan migrate'],
      $laravelDir
    );
    break;

  case 'artisan-seed':
    execute(
      $connection,
      [$php.' artisan db:seed --class='.$argv[3]],
      $laravelDir
    );
    break;

  case 'checkout':
    execute(
      $connection,
      [$git.' checkout '.$argv[3]],
      $laravelDir
    );
    break;

  case 'clone':
    execute(
      $connection,
      [$git.' clone '.$repo.' '.$laravelDir]
    );
    break;

  case 'copy-public':
    execute(
      $connection,
      [
        'shopt -s dotglob',
        'cp -R -f '.$laravelDir.'/public/* '.$wwwDir,
      ]
    );
    execute(
      $connection,
      [
        'shopt -s dotglob',
        'cp -R -f '.$laravelDir.'/public-prod/* '.$wwwDir,
      ]
    );
    break;

  case 'composer-install':
    execute(
      $connection,
      [$php.' composer.phar install --optimize-autoloader'],
      $laravelDir
    );
    break;

  case 'known-hosts':
    execute(
      $connection,
      [
        'ssh-keygen -R github.com',
        'ssh-keyscan -t rsa github.com >> known_hosts',
        'chmod 0600 known_hosts',
      ],
      $sshDir
    );
    break;

  case 'pull':
    execute(
      $connection,
      [$git.' pull'],
      $laravelDir
    );
    break;

  case 'reset':
    execute(
      $connection,
      ['rm -f -r '.$laravelDir]
    );
    break;

  case 'upload-composer':
    upload(
      $connection,
      PRIVATE_DIR.DIRECTORY_SEPARATOR.'composer.phar',
      $laravelDir.'/composer.phar'
    );
    break;

  case 'upload-env':
    upload(
      $connection,
      PRIVATE_DIR.DIRECTORY_SEPARATOR.'.env',
      $laravelDir.'/.env');
    break;

  case 'upload-ssh-key':
    upload(
      $connection,
      KEYS_DIR.DIRECTORY_SEPARATOR.'id_rsa',
      $sshDir.'/id_rsa'
    );
    break;

  default:
    throw new Exception('Unknown command '.$argv[2]);
}

/**
 * Establishes SSH connection.
 */
function connect(string $host, string $username, string $password): mixed
{
  $connection = ssh2_connect($host);
  ssh2_auth_password($connection, $username, $password);

  return $connection;
}

/**
 * Executes SSH command.
 */
function execute($connection, array $commands, string $laravelDir = null): void
{
  if ($laravelDir !== null) {
    array_unshift($commands, 'cd '.$laravelDir);
  }
  $commands = implode('; ', $commands);

  echo '> '.$commands.PHP_EOL.PHP_EOL;

  $out = ssh2_exec($connection, $commands);
  $err = ssh2_fetch_stream($out, SSH2_STREAM_STDERR);

  stream_set_blocking($out, true);
  stream_set_blocking($err, true);

  $outStr = trim(stream_get_contents($out));
  if (strlen($outStr) > 0) {
    echo 'Out'.PHP_EOL.$outStr.PHP_EOL.PHP_EOL;
  }

  $errStr = trim(stream_get_contents($err));
  if (strlen($errStr) > 0) {
    echo 'Err'.PHP_EOL.$errStr.PHP_EOL.PHP_EOL;
  }
}

/**
 * Uploads file via SSH.
 */
function upload($connection, string $src, string $dst): void
{
  echo '> upload '.$dst.PHP_EOL.PHP_EOL;

  $sftp = ssh2_sftp($connection);
  copy($src, 'ssh2.sftp://'.$sftp.$dst);

  execute($connection, ['chmod 600 '.$dst]);
}
