class people::zachahn {
  class { 'mysql::config':
    port => 3306,
  }

  include chrome
  include skype
  include dropbox
  include appcleaner

  include vagrant
  include virtualbox
  include github_for_mac
  include sublime_text
  # include nodejs::v0_10
  include nodejs::global
  # include mongodb
  include mysql
  include heroku
  include java

  class { 'redis': port => 6379, }

  class { 'elasticsearch': http_port => 9200, transport_port => 9300, }

  class { 'mongodb': port => 27017, }

  include zsh

  package { "ImageMagick": }

  package { "icu4c": }

  package { "tree": }

  package { 'the_silver_searcher': }

  include osx::disable_app_quarantine
  include osx::global::disable_key_press_and_hold
  include osx::dock::autohide
  include osx::dock::position
  include osx::dock::icon_size

  $home = "/Users/${::boxen_user}"

  # vagrant::box { 'precise32/virtualbox':
  #   source => 'http://files.vagrantup.com/precise32.box',
  # }

  # vagrant::box { 'precise64/virtualbox':
  #   source => 'http://files.vagrantup.com/precise64.box',
  # }

  git::config::global { 'push.default':
    value  => 'simple'
  }
}
