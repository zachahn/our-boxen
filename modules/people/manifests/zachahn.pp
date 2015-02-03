class people::zachahn {
  class { 'mysql::config': port => 3306, }
  class { 'mongodb': port => 27017, }
  class { 'elasticsearch': http_port => 9200, transport_port => 9300, }

  include chrome
  include skype
  include dropbox
  include appcleaner

  include vagrant
  include virtualbox
  include github_for_mac
  include sublime_text
  include mysql
  include redis
  include heroku
  include java
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

  # class { 'nodejs::global': version => 'v0.10' }

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
