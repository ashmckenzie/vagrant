class redis {

  case $::operatingsystem {
    ubuntu, debian: {
      $ppa_repo = "ppa:rwky/redis"
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }

  apt::ppa { $ppa_repo: }

  package { "redis-server":
    ensure => latest,
    subscribe => Apt::Ppa[$ppa_repo]
  }
}