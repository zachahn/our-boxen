class people::zachahn {
  include chrome

  include zsh

  include seil
  include seil::login_item

  include karabiner
  include karabiner::login_item

  package { "ImageMagick": }
  package { "icu4c": }
  package { "legit": }
  package { "the_silver_searcher": }
  package { "tree": }

  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::global::disable_key_press_and_hold
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::tap_to_click
  include osx::finder::show_external_hard_drives_on_desktop
  include osx::finder::show_mounted_servers_on_desktop
  include osx::finder::show_removable_media_on_desktop
  # include osx::finder::empty_trash_securely
  include osx::finder::enable_quicklook_text_selection
  include osx::finder::show_all_filename_extensions
  include osx::dock::autohide
  include osx::dock::position
  include osx::dock::icon_size
  include osx::safari::enable_developer_mode

  class { 'osx::global::key_repeat_delay': delay => 15 }
  class { 'osx::global::key_repeat_rate': rate => 2 }

  $home = "/Users/${::boxen_user}"

  git::config::global { "push.default":
    value  => "simple"
  }

  seil::map { 'capslock':
    value => 110
  }

  karabiner::exec { 'set private.custom_long_capslock 1':
    command => 'set private.custom_long_capslock 1',
    unless  => 'private.custom_long_capslock=1'
  }
  karabiner::exec { 'set repeat.wait 25':
    command => 'set repeat.wait 25',
    unless  => 'repeat.wait=25'
  }
  karabiner::exec { 'set repeat.initial_wait 250':
    command => 'set repeat.initial_wait 250',
    unless  => 'repeat.initial_wait=250'
  }
  karabiner::exec { 'set repeat.consumer_initial_wait 250':
    command => 'set repeat.consumer_initial_wait 250',
    unless  => 'repeat.consumer_initial_wait=250'
  }
  karabiner::exec { 'set repeat.consumer_wait 25':
    command => 'set repeat.consumer_wait 25',
    unless  => 'repeat.consumer_wait=25'
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
