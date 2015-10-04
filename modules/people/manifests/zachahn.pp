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

  include seil
  include seil::login_item

  include karabiner
  include karabiner::login_item

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

  seil::map { 'capslock':
    value => 110
  }

  karabiner::private_xml { 'private.xml':
    content => '<?xml version="1.0"?>
<root>
  <item>
    <name>Tap CapsLock for CapsLock, Hold for CTRL.</name>
    <identifier>private.custom_long_capslock</identifier>
    
    <autogen>
        __HoldingKeyToKey__ KeyCode::PC_APPLICATION,
        KeyCode::CAPSLOCK,
        KeyCode::VK_NONE,
        KeyCode::CONTROL_L
    </autogen>
  </item>
</root>
'

  }
}
