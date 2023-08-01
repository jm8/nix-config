# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "gr+polytonic" ]) ];
      xkb-options = [ "caps:escape" ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-size = 24;
      cursor-theme = "breeze_cursors";
      enable-animations = true;
      enable-hot-corners = false;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      font-name = "Noto Sans,  10";
      icon-theme = "breeze-dark";
      text-scaling-factor = 1.0;
      toolbar-style = "text";
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "firefox" "thunar" "org-gnome-geary" "gnome-power-panel" "calibre-gui" "org-gnome-nautilus" "org-gnome-fileroller" ];
    };

    "org/gnome/desktop/notifications/application/calibre-gui" = {
      application-id = "calibre-gui.desktop";
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-fileroller" = {
      application-id = "org.gnome.FileRoller.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-geary" = {
      application-id = "org.gnome.Geary.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/notifications/application/thunar" = {
      application-id = "thunar.desktop";
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 0;
    };

    "org/gnome/desktop/wm/keybindings" = {
      cycle-panels = [];
      cycle-panels-backward = [];
      maximize = [ "" ];
      minimize = [];
      move-to-monitor-down = [];
      move-to-monitor-left = [];
      move-to-monitor-right = [];
      move-to-monitor-up = [];
      move-to-workspace-1 = [ "" ];
      move-to-workspace-2 = [ "" ];
      move-to-workspace-3 = [ "" ];
      move-to-workspace-4 = [ "" ];
      move-to-workspace-last = [];
      move-to-workspace-left = [];
      move-to-workspace-right = [];
      switch-applications = [];
      switch-applications-backward = [];
      switch-input-source = [ "" ];
      switch-input-source-backward = [ "" ];
      switch-panels = [];
      switch-panels-backward = [];
      switch-to-workspace-last = [];
      switch-to-workspace-left = [];
      switch-to-workspace-right = [];
      unmaximize = [ "" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      auto-raise = false;
      button-layout = "appmenu:close";
      focus-mode = "sloppy";
      num-workspaces = 1;
    };

    "org/gnome/mutter" = {
      edge-tiling = false;
      workspaces-only-on-primary = true;
      experimental-features = ["scale-monitor-framebuffer"];
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [ "" ];
      toggle-tiled-right = [ "" ];
    };

    "org/gnome/mutter/wayland/keybindings" = {
      restore-shortcuts = [ "" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
      www = [ "<Shift><Super>f" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "kitty";
      name = "kitty";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/shell" = {
      command-history = [ "gnome-terminal" "kitty" "files" "thunar" "firefox" ];
      disabled-extensions = [];
      enabled-extensions = [ "material-shell@papyelgringo" "unite@hardpixel.eu" ];
      welcome-dialog-last-shown-version = "42.4";
    };

    "org/gnome/shell/extensions/materialshell/theme" = {
      clock-horizontal = true;
      panel-opacity = 1000;
      panel-size = 30;
      taskbar-item-style = "full";
    };

    "org/gnome/shell/keybindings" = {
      screenshot-window = [];
      show-screen-recording-ui = [];
      show-screenshot-ui = [ "<Shift><Super>s" ];
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
      toggle-overview = [ "" ];
    };
  };
}
