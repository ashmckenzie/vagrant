class vim {

  case $::operatingsystem {
    ubuntu, debian: {
      $package = 'vim-nox'
      $editor_name = 'vim.nox'
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }

  package { $package:
    ensure => 'present'
  }

  exec { "update-alternatives --set editor /usr/bin/${editor_name}":
    path => '/usr/bin:/usr/sbin',
    unless => "test /etc/alternatives/editor -ef /usr/bin/${editor_name}",
    require => Package[$package],
  }
}
