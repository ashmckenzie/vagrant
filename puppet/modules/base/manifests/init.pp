class base {

  Package { ensure => "installed" }

  $packages = [
    'zsh',
    'htop',
    'git',
    'screen',
    'mysql-server',
    'postfix',
    'build-essential',
    'libxml2-dev',
    'libxslt-dev'
  ]

  package { $packages: }
}