class varnish {

  case $::operatingsystem {
    ubuntu, debian: {
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }

  package { "varnish":
    ensure => present
  }
}
