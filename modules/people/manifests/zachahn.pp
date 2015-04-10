class people::zachahn {
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
  include mongodb
  include heroku
  include java
  include zsh

  package { "ImageMagick": }
  package { "icu4c": }
  package { "tree": }
  package { "the_silver_searcher": }

  include osx::disable_app_quarantine
  include osx::global::disable_key_press_and_hold
  include osx::dock::autohide
  include osx::dock::position
  include osx::dock::icon_size

  $home = "/Users/${::boxen_user}"

  git::config::global { "push.default":
    value  => "simple"
  }
}
