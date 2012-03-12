class nginx {

  case $::operatingsystem {
    ubuntu, debian: {
      $ppa_repo = 'ppa:nginx/stable'
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }

  apt::ppa { $ppa_repo: }

  package { "nginx":
    ensure => latest,
    subscribe => Apt::Ppa[$ppa_repo]
  }
}
