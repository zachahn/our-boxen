class people::zachahn {
  include chrome
  include skype
  include dropbox
  include appcleaner

  include vagrant
  include virtualbox
  include github_for_mac
  include sublime_text
  include nodejs::v0_10
  include nodejs::global
  include mongodb
  include redis

  include zsh

  include osx::disable_app_quarantine
  include osx::global::disable_key_press_and_hold
  include osx::dock::autohide
  include osx::dock::position
  include osx::dock::icon_size

  $home = "/Users/${::boxen_user}"

  vagrant::box { 'precise32/virtualbox':
    source => 'http://files.vagrantup.com/precise32.box',
  }

  vagrant::box { 'precise64/virtualbox':
    source => 'http://files.vagrantup.com/precise64.box',
  }

  git::config::global { 'push.default':
    value  => 'simple'
  }
}
