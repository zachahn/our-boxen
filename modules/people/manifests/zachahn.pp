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

  karabiner::exec { 'set private.custom_single_pc_to_ctrl_double_pc_to_caps 1':
    command => 'set private.custom_single_pc_to_ctrl_double_pc_to_caps 1',
    unless  => 'private.custom_single_pc_to_ctrl_double_pc_to_caps=1'
  }

  karabiner::private_xml { 'private.xml':
    content => '<?xml version="1.0"?>
<root>
    <item>
        <identifier>private.custom_single_pc_to_ctrl_double_pc_to_caps</identifier>
        <name>Single CAPS for CTRL, Double CAPS for CAPS</name>
        <autogen>
            __DoublePressModifier__ KeyCode::PC_APPLICATION,
            KeyCode::CONTROL_L,
            KeyCode::CAPSLOCK
        </autogen>
    </item>
</root>
'

  }
}
