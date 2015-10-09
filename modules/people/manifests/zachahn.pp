class people::zachahn {
  include chrome
  include dropbox
  include appcleaner

  include vagrant
  include virtualbox
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
  include osx::no_network_dsstores
  include osx::global::disable_key_press_and_hold
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::tap_to_click
  include osx::finder::show_external_hard_drives_on_desktop
  include osx::finder::show_mounted_servers_on_desktop
  include osx::finder::show_removable_media_on_desktop
  include osx::finder::empty_trash_securely
  include osx::finder::enable_quicklook_text_selection
  include osx::finder::show_all_filename_extensions
  include osx::dock::autohide
  include osx::dock::position
  include osx::dock::icon_size
  include osx::safari::enable_developer_mode

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
