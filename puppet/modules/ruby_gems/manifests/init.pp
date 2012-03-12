class ruby_gems {

  exec { "bundler":
    command => '/opt/ruby/bin/gem install bundler',
    creates => '/opt/ruby/bin/bundle'
  }
}