# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/Ptyxis" = {
      default-profile-uuid = "05217fa5b2451c9bfb8c71be69d0851a";
      profile-uuids = [ "05217fa5b2451c9bfb8c71be69d0851a" ];
      window-size = mkTuple [ (mkUint32 255) (mkUint32 55) ];
    };

    "org/gnome/control-center" = {
      last-panel = "keyboard";
      window-state = mkTuple [ 1773 1150 true ];
    };

    "org/gnome/desktop/a11y" = {
      always-show-universal-access-status = true;
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "System" "Utilities" "YaST" "Pardus" ];
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = [ "X-Pardus-Apps" ];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/System" = {
      apps = [ "org.gnome.baobab.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Logs.desktop" "org.freedesktop.MalcontentControl.desktop" "org.gnome.SystemMonitor.desktop" ];
      name = "X-GNOME-Shell-System.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "org.gnome.Connections.desktop" "org.gnome.Papers.desktop" "org.gnome.font-viewer.desktop" "org.gnome.Loupe.desktop" ];
      name = "X-GNOME-Shell-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      picture-options = "zoom";
      picture-uri = "file:///var/home/josh/.config/background";
      picture-uri-dark = "file:///var/home/josh/.config/background";
      primary-color = "#02023c3c8888";
    };

    "org/gnome/desktop/input-sources" = {
      current = mkUint32 0;
      mru-sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "gr+polytonic" ]) ];
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "gr+polytonic" ]) ];
      xkb-options = [ "caps:escape" "lv3:menu_switch" "compose:ralt" ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-size = 24;
      document-font-name = "Iosevka Nerd Font 11";
      enable-animations = true;
      enable-hot-corners = false;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      font-name = "Iosevka Nerd Font 11";
      monospace-font-name = "Iosevka Nerd Font 11";
      show-battery-percentage = true;
      toolbar-style = "text";
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "org-mozilla-firefox" "org-gnome-ptyxis" "org-gnome-software" "gnome-power-panel" "gimp" "org-gnome-settings" "calibre-gui" "alacritty" ];
    };

    "org/gnome/desktop/notifications/application/alacritty" = {
      application-id = "Alacritty.desktop";
    };

    "org/gnome/desktop/notifications/application/calibre-gui" = {
      application-id = "calibre-gui.desktop";
    };

    "org/gnome/desktop/notifications/application/gimp" = {
      application-id = "gimp.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-ptyxis" = {
      application-id = "org.gnome.Ptyxis.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-software" = {
      application-id = "org.gnome.Software.desktop";
    };

    "org/gnome/desktop/notifications/application/org-mozilla-firefox" = {
      application-id = "org.mozilla.firefox.desktop";
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/privacy" = {
      report-technical-problems = false;
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Alt>q" ];
      cycle-panels = [];
      cycle-panels-backward = [];
      maximize = [];
      minimize = [];
      move-to-monitor-down = [];
      move-to-monitor-left = [];
      move-to-monitor-right = [];
      move-to-monitor-up = [];
      move-to-workspace-1 = [];
      move-to-workspace-2 = [];
      move-to-workspace-3 = [];
      move-to-workspace-4 = [];
      move-to-workspace-down = [];
      move-to-workspace-last = [];
      move-to-workspace-left = [];
      move-to-workspace-right = [];
      move-to-workspace-up = [];
      switch-applications = [];
      switch-applications-backward = [];
      switch-group = [];
      switch-group-backward = [];
      switch-input-source = [ "<Super>space" ];
      switch-input-source-backward = [ "<Shift><Super>space" ];
      switch-panels = [];
      switch-panels-backward = [];
      switch-to-workspace-1 = [];
      switch-to-workspace-last = [];
      switch-to-workspace-left = [];
      switch-to-workspace-right = [];
      switch-windows = [];
      switch-windows-backward = [];
      unmaximize = [];
    };

    "org/gnome/desktop/wm/preferences" = {
      auto-raise = false;
      button-layout = "appmenu:close";
      focus-mode = "sloppy";
      num-workspaces = 10;
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/login-screen" = {
      enable-fingerprint-authentication = true;
      enable-smartcard-authentication = false;
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = false;
      dynamic-workspaces = true;
      edge-tiling = false;
      experimental-features = [ "scale-monitor-framebuffer" ];
      workspaces-only-on-primary = false;
    };

    "org/gnome/mutter/keybindings" = {
      cancel-input-capture = [];
      toggle-tiled-left = [];
      toggle-tiled-right = [];
    };

    "org/gnome/mutter/wayland/keybindings" = {
      restore-shortcuts = [];
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 890 550 ];
    };

    "org/gnome/nm-applet/eap/278b9c94-0483-48ec-8b37-76882ab2a157" = {
      ignore-ca-cert = true;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-schedule-automatic = false;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
      rotate-video-lock-static = [];
      www = [ "<Shift><Alt>f" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Alt>Return";
      command = "alacritty";
      name = "terminal";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      ambient-enabled = false;
      idle-dim = true;
      power-button-action = "interactive";
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/shell" = {
      disabled-extensions = [ "forge@jmmaranan.com" ];
      enabled-extensions = [ "background-logo@fedorahosted.org" "paperwm@paperwm.github.com" ];
      last-selected-power-profile = "power-saver";
      welcome-dialog-last-shown-version = "49.1";
    };

    "org/gnome/shell/extensions/forge" = {
      css-last-update = mkUint32 37;
    };

    "org/gnome/shell/extensions/paperwm" = {
      gesture-horizontal-fingers = 3;
      horizontal-margin = 10;
      last-used-display-server = "Wayland";
      open-window-position = 0;
      restore-attach-modal-dialogs = "true";
      restore-edge-tiling = "false";
      restore-keybinds = ''
        {"cancel-input-capture":{"bind":"[\\"<Super><Shift>Escape\\"]","schema_id":"org.gnome.mutter.keybindings"},"toggle-tiled-left":{"bind":"[\\"<Alt>z\\"]","schema_id":"org.gnome.mutter.keybindings"},"toggle-tiled-right":{"bind":"[\\"<Alt>c\\"]","schema_id":"org.gnome.mutter.keybindings"},"restore-shortcuts":{"bind":"[\\"<Super>Escape\\"]","schema_id":"org.gnome.mutter.wayland.keybindings"},"switch-to-workspace-left":{"bind":"[\\"<Alt>a\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-to-workspace-right":{"bind":"[\\"<Alt>d\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-group-backward":{"bind":"[\\"<Shift><Super>Above_Tab\\",\\"<Shift><Alt>Above_Tab\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-to-workspace-1":{"bind":"[\\"<Super>Home\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"maximize":{"bind":"[\\"<Alt>w\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-group":{"bind":"[\\"<Super>Above_Tab\\",\\"<Alt>Above_Tab\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-workspace-left":{"bind":"[\\"<Shift><Alt>a\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-workspace-up":{"bind":"[\\"<Control><Shift><Alt>Up\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-workspace-down":{"bind":"[\\"<Control><Shift><Alt>Down\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-workspace-right":{"bind":"[\\"<Shift><Alt>d\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-windows":{"bind":"[\\"<Alt>Tab\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-windows-backward":{"bind":"[\\"<Shift><Alt>Tab\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"shift-overview-up":{"bind":"[\\"<Super><Alt>Up\\"]","schema_id":"org.gnome.shell.keybindings"},"shift-overview-down":{"bind":"[\\"<Super><Alt>Down\\"]","schema_id":"org.gnome.shell.keybindings"},"focus-active-notification":{"bind":"[\\"<Super>n\\"]","schema_id":"org.gnome.shell.keybindings"},"toggle-message-tray":{"bind":"[\\"<Super>v\\",\\"<Super>m\\"]","schema_id":"org.gnome.shell.keybindings"},"rotate-video-lock-static":{"bind":"[\\"<Super>o\\",\\"XF86RotationLockToggle\\"]","schema_id":"org.gnome.settings-daemon.plugins.media-keys"}}
      '';
      restore-workspaces-only-on-primary = "true";
      selection-border-radius-bottom = 15;
      selection-border-radius-top = 15;
      selection-border-size = 5;
      use-default-background = false;
      vertical-margin = 10;
      vertical-margin-bottom = 10;
      window-gap = 15;
      winprops = [ ''
        {"wm_class":"","title":"PaperWM"}
      '' ];
    };

    "org/gnome/shell/extensions/paperwm/keybindings" = {
      cycle-width = [ "<Alt>r" ];
      drift-left = [ "<Alt>bracketleft" ];
      drift-right = [ "<Alt>bracketright" ];
      move-down-workspace = [ "<Shift><Alt>c" "<Shift><Alt>z" ];
      move-left = [ "<Shift><Alt>a" ];
      move-right = [ "<Control><Super>period" "<Shift><Super>period" "<Control><Super>Right" "<Shift><Alt>d" ];
      move-up-workspace = [ "<Shift><Alt>z" ];
      switch-down-workspace = [ "<Alt>c" ];
      switch-left = [ "<Alt>a" ];
      switch-right = [ "<Alt>d" ];
      switch-up-workspace = [ "<Alt>z" ];
      toggle-maximize-width = [ "<Alt>w" ];
    };

    "org/gnome/shell/extensions/paperwm/workspaces" = {
      list = [ "455cc56e-281c-4b94-8ba2-ae5ebd96f539" "26cba678-542a-43b7-885c-7c79d24af4d7" "c62b8f4b-d487-403b-a94a-eb70b24772b5" "9d128eb6-6a03-48a2-9bf0-fb983a9749bd" "b4eed425-5ead-4001-b1d0-5ff553bd2815" ];
    };

    "org/gnome/shell/extensions/paperwm/workspaces/26cba678-542a-43b7-885c-7c79d24af4d7" = {
      index = 1;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/455cc56e-281c-4b94-8ba2-ae5ebd96f539" = {
      background = "";
      color = "rgb(49,78,108)";
      index = 0;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/9d128eb6-6a03-48a2-9bf0-fb983a9749bd" = {
      index = 3;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/b4eed425-5ead-4001-b1d0-5ff553bd2815" = {
      index = 4;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/c62b8f4b-d487-403b-a94a-eb70b24772b5" = {
      index = 2;
    };

    "org/gnome/shell/keybindings" = {
      focus-active-notification = [];
      screenshot-window = [];
      shift-overview-down = [];
      shift-overview-up = [];
      show-screen-recording-ui = [];
      show-screenshot-ui = [ "<Shift><Alt>s" ];
      switch-to-application-1 = [ "" ];
      switch-to-application-2 = [ "" ];
      switch-to-application-3 = [ "" ];
      switch-to-application-4 = [ "" ];
      switch-to-application-5 = [ "" ];
      switch-to-application-6 = [ "" ];
      switch-to-application-7 = [ "" ];
      switch-to-application-8 = [ "" ];
      switch-to-application-9 = [ "" ];
      toggle-application-view = [ "" ];
      toggle-message-tray = [];
      toggle-overview = [ "" ];
    };

    "org/gnome/software" = {
      check-timestamp = mkInt64 1777134513;
      first-run = false;
      flatpak-purge-timestamp = mkInt64 1777135004;
      update-notification-timestamp = mkInt64 1777035472;
      upgrade-notification-timestamp = mkInt64 1776642054;
    };

    "org/gnome/system/location" = {
      enabled = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors = [ (mkTuple [ 0.33725491166114807 0.32156863808631897 0.2823529541492462 1.0 ]) (mkTuple [ 0.1921568661928177 0.30588236451148987 0.42352941632270813 1.0 ]) ];
      selected-color = mkTuple [ true 0.1921568661928177 0.30588236451148987 0.42352941632270813 1.0 ];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden = false;
      sort-directories-first = false;
    };

    "org/gtk/settings/color-chooser" = {
      custom-colors = [ (mkTuple [ 0.0 1.0 0.0 1.0 ]) (mkTuple [ 1.0 1.0 0.0 1.0 ]) (mkTuple [ 1.0 0.0 0.0 1.0 ]) ];
      selected-color = mkTuple [ true 0.0 0.0 0.0 1.0 ];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 163;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 26 23 ];
      window-size = mkTuple [ 1231 902 ];
    };

  };
}
