class people::lyeon {
  include chrome
  include skype
  include dropbox

  include github_for_mac
  include sublime_text

  include osx::disable_app_quarantine
  include osx::global::disable_key_press_and_hold
  include osx::dock::autohide
  include osx::dock::position
  include osx::dock::icon_size

  $home = "/Users/${::boxen_user}"
}
