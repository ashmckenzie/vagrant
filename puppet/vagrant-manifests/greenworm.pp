group { "puppet":
    ensure => "present"
}

node 'oneiric64.local' {
  include apt
  include base
  include ruby_gems
  include vim
  include nginx
  include redis
  include varnish

  exec { "set timezone": 
    command => '/bin/echo "Australia/Melbourne" > /etc/timezone ; /usr/sbin/dpkg-reconfigure --frontend noninteractive tzdata'
  }
}
