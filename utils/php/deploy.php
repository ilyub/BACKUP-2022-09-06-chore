<?php

use Skylib\Config\Assert;
use Skylib\Config\Unknown;

include_once __DIR__.'/api/init.php';

$dir = dirname(dirname(dirname(__DIR__)));
Util::rootDir($dir);
$deploy = new Deploy($argv[1], $dir);
$deploy->do($argv[2], $argv[3]);

class Deploy
{
  /**
   * Initializes class instance.
   */
  public function __construct(string $project, string $dir)
  {
    $this->keysDir = $dir.'/.ssh';
    $this->privateDir = $dir.'/.'.$project;

    $str = Assert::string(file_get_contents($this->privateDir.'/config.json'));

    $json = Unknown\Assert::array(json_decode($str));

    $host = Unknown\Assert::string($json['host']);
    $username = Unknown\Assert::string($json['username']);
    $password = Unknown\Assert::string($json['password']);

    $this->connection = $this->connect($host, $username, $password);
    $this->repo = Unknown\Assert::string($json['repo']);
    $this->laravelDir = Unknown\Assert::string($json['laravelDir']);
    $this->sshDir = Unknown\Assert::string($json['sshDir']);
    $this->wwwDir = Unknown\Assert::string($json['wwwDir']);
    $this->git = Unknown\Assert::string($json['git']);
    $this->php = Unknown\Assert::string($json['php']);
  }

  /**
   * Executes command.
   */
  public function do(string $command, string $arg): void
  {
    switch ($command) {
      case 'artisan-migrate':
        $this->doArtisanMigrate();

        break;

      case 'artisan-seed':
        $this->doArtisanSeed($arg);

        break;

      case 'checkout':
        $this->doCheckout($arg);

        break;

      case 'clone':
        $this->doClone(
        );

        break;

      case 'composer-install':
        $this->doInstallDependencies(
        );

        break;

      case 'copy-protected':
        $this->doInstallPublicFolder();

        break;

      case 'known-hosts':
        $this->doUpdateKnownHosts(
        );

        break;

      case 'pull':
        $this->doPull(
        );

        break;

      case 'reset':
        $this->doReset(
        );

        break;

      case 'upload-composer':
        $this->doUploadComposer(
        );

        break;

      case 'upload-env':
        $this->doUploadEnv();

        break;

      case 'upload-ssh-key':
        $this->doUploadSshKey();

        break;

      default:
        throw new Exception('Unknown command '.$command);
    }
  }

  /**
   * @var resource
   */
  protected $connection;

  /**
   * @var string
   */
  protected $git;

  /**
   * @var string
   */
  protected $keysDir;

  /**
   * @var string
   */
  protected $laravelDir;

  /**
   * @var string
   */
  protected $php;

  /**
   * @var string
   */
  protected $privateDir;

  /**
   * @var string
   */
  protected $repo;

  /**
   * @var string
   */
  protected $sshDir;

  /**
   * @var string
   */
  protected $wwwDir;

  /**
   * Establishes SSH connection.
   *
   * @return resource
   */
  protected function connect(string $host, string $username, string $password): mixed
  {
    $connection = Assert::resource(ssh2_connect($host));
    ssh2_auth_password($connection, $username, $password);

    return $connection;
  }

  /**
   * Migrates database.
   */
  protected function doArtisanMigrate(): void
  {
    $this->execute(
      'cd '.$this->laravelDir,
      $this->php.' artisan migrate'
    );
  }

  /**
   * Seeds class.
   */
  protected function doArtisanSeed(string $class): void
  {
    $this->execute(
      'cd '.$this->laravelDir,
      $this->php.' artisan db:seed --class='.$class,
    );
  }

  /**
   * Checkouts git branch.
   */
  protected function doCheckout(string $branch): void
  {
    $this->execute(
      'cd '.$this->laravelDir,
      $this->git.' checkout '.$branch,
    );
  }

  /**
   * Clones repository.
   */
  protected function doClone(): void
  {
    $this->execute($this->git.' clone '.$this->repo.' '.$this->laravelDir);
  }

  /**
   * Installs dependencies.
   */
  protected function doInstallDependencies(): void
  {
    $this->execute(
      'cd '.$this->laravelDir,
      $this->php.' composer.phar install --optimize-autoloader'
    );
  }

  /**
   * Installs public folder.
   */
  protected function doInstallPublicFolder(): void
  {
    $this->execute(
      'shopt -s dotglob',
      'cp -R -f '.$this->laravelDir.'/public/* '.$this->wwwDir,
    );

    $this->execute(
      'shopt -s dotglob',
      'cp -R -f '.$this->laravelDir.'/public-prod/* '.$this->wwwDir,
    );
  }

  /**
   * Pulls repository.
   */
  protected function doPull(): void
  {
    $this->execute(
      'cd '.$this->laravelDir,
      $this->git.' pull'
    );
  }

  /**
   * Resets.
   */
  protected function doReset(): void
  {
    $this->execute('rm -f -r '.$this->laravelDir);
  }

  /**
   * Updates known hosts.
   */
  protected function doUpdateKnownHosts(): void
  {
    $this->execute(
      'cd '.$this->sshDir,
      'ssh-keygen -R github.com',
      'ssh-keyscan -t rsa github.com >> known_hosts',
      'chmod 0600 known_hosts',
    );
  }

  /**
   * Uploads composer.
   */
  protected function doUploadComposer(): void
  {
    $this->upload(
      $this->privateDir.'/composer.phar',
      $this->laravelDir.'/composer.phar'
    );
  }

  /**
   * Uploads env.
   */
  protected function doUploadEnv(): void
  {
    $this->upload(
      $this->privateDir.'/.env',
      $this->laravelDir.'/.env'
    );
  }

  /**
   * Uploads SSH key.
   */
  protected function doUploadSshKey(): void
  {
    $this->upload(
      $this->keysDir.'/id_rsa',
      $this->sshDir.'/id_rsa'
    );
  }

  /**
   * Executes SSH command.
   *
   * @param string $commands
   */
  protected function execute(...$commands): void
  {
    $commands = implode('; ', $commands);

    echo '> '.$commands.PHP_EOL.PHP_EOL;

    $out = Assert::resource(ssh2_exec($this->connection, $commands));
    $err = Assert::resource(ssh2_fetch_stream($out, SSH2_STREAM_STDERR));

    stream_set_blocking($out, true);
    stream_set_blocking($err, true);

    $outStr = trim(Assert::string(stream_get_contents($out)));
    if (strlen($outStr) > 0)
    {
      echo 'Out'.PHP_EOL.$outStr.PHP_EOL.PHP_EOL;
    }

    $errStr = trim(Assert::string(stream_get_contents($err)));
    if (strlen($errStr) > 0)
    {
      echo 'Err'.PHP_EOL.$errStr.PHP_EOL.PHP_EOL;
    }
  }

  /**
   * Uploads file via SSH.
   */
  protected function upload(string $src, string $dst): void
  {
    echo '> upload '.$dst.PHP_EOL.PHP_EOL;

    $sftp = ssh2_sftp($this->connection);
    copy($src, 'ssh2.sftp://'.$sftp.$dst);

    $this->execute('chmod 600 '.$dst);
  }
}
