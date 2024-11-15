# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/Chess" = {
      height = 881;
      maximized = false;
      width = 800;
    };

    "org/gnome/Console" = {
      last-window-size = mkTuple [652 481];
    };

    "org/gnome/Geary" = {
      migrated-config = true;
    };

    "org/gnome/Podcasts" = {
      persist-window-geometry-height = 871;
      persist-window-geometry-left = 5;
      persist-window-geometry-maximized = false;
      persist-window-geometry-top = 5;
      persist-window-geometry-width = 1590;
    };

    "org/gnome/Totem" = {
      active-plugins = ["vimeo" "variable-rate" "skipto" "screenshot" "screensaver" "save-file" "rotation" "recent" "movie-properties" "open-directory" "mpris" "autoload-subtitles" "apple-trailers"];
      subtitle-encoding = "UTF-8";
    };

    "org/gnome/calendar" = {
      active-view = "month";
      window-maximized = true;
      window-size = mkTuple [768 600];
    };

    "org/gnome/control-center" = {
      last-panel = "keyboard";
      window-state = mkTuple [839 867];
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = ["Utilities" "YaST"];
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = ["gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.eog.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop"];
      categories = ["X-GNOME-Utilities"];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = ["X-SuSE-YaST"];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/input-sources" = {
      sources = [(mkTuple ["xkb" "us"]) (mkTuple ["xkb" "gr+polytonic"])];
      xkb-options = ["caps:escape"];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-size = 24;
      enable-animations = true;
      enable-hot-corners = false;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      toolbar-style = "text";
      document-font-name = "JetBrainsMonoNL Nerd Font Propo 11";
      font-name = "JetBrainsMonoNL Nerd Font Propo 10";
      monospace-font-name = "JetBrainsMonoNL Nerd Font Mono 10";
      show-battery-percentage=true;
      text-scaling-factor=1.25;
    };

    "org/gnome/desktop/notifications" = {
      application-children = ["firefox" "thunar" "org-gnome-geary" "gnome-power-panel" "calibre-gui" "org-gnome-nautilus" "org-gnome-fileroller" "org-prismlauncher-prismlauncher" "code"];
    };

    "org/gnome/desktop/notifications/application/calibre-gui" = {
      application-id = "calibre-gui.desktop";
    };

    "org/gnome/desktop/notifications/application/code" = {
      application-id = "code.desktop";
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

    "org/gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "org/gnome/desktop/notifications/application/org-prismlauncher-prismlauncher" = {
      application-id = "org.prismlauncher.PrismLauncher.desktop";
    };

    "org/gnome/desktop/notifications/application/thunar" = {
      application-id = "thunar.desktop";
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/search-providers" = {
      sort-order = ["org.gnome.Contacts.desktop" "org.gnome.Documents.desktop" "org.gnome.Nautilus.desktop"];
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 0;
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Super>q"];
      cycle-panels = [];
      cycle-panels-backward = [];
      maximize = ["<Super>w"];
      minimize = [];
      move-to-monitor-down = [];
      move-to-monitor-left = [];
      move-to-monitor-right = [];
      move-to-monitor-up = [];
      move-to-workspace-1 = [""];
      move-to-workspace-2 = [""];
      move-to-workspace-3 = [""];
      move-to-workspace-4 = [""];
      move-to-workspace-last = [];
      move-to-workspace-left = ["<Shift><Super>a"];
      move-to-workspace-right = ["<Shift><Super>d"];
      switch-applications = [];
      switch-applications-backward = [];
      switch-input-source = [""];
      switch-input-source-backward = [""];
      switch-panels = [];
      switch-panels-backward = [];
      switch-to-workspace-last = [];
      switch-to-workspace-left = ["<Super>a"];
      switch-to-workspace-right = ["<Super>d"];
      switch-windows = ["<Alt>Tab"];
      switch-windows-backward = ["<Shift><Alt>Tab"];
      unmaximize = [""];
    };

    "org/gnome/desktop/wm/preferences" = {
      auto-raise = false;
      button-layout = "appmenu:close";
      focus-mode = "sloppy";
      num-workspaces = 10;
    };

    "org/gnome/epiphany" = {
      ask-for-default = false;
    };

    "org/gnome/epiphany/state" = {
      is-maximized = true;
      window-size = mkTuple [1600 868];
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
      network-monitor-gio-name = "";
    };

    "org/gnome/file-roller/dialogs/extract" = {
      recreate-folders = true;
      skip-newer = false;
    };

    "org/gnome/file-roller/listing" = {
      list-mode = "as-folder";
      name-column-width = 250;
      show-path = false;
      sort-method = "name";
      sort-type = "ascending";
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = false;
      experimental-features = ["scale-monitor-framebuffer"];
      workspaces-only-on-primary = true;
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = ["<Super>z"];
      toggle-tiled-right = ["<Super>c"];
    };

    "org/gnome/portal/filechooser/org/prismlauncher/PrismLauncher" = {
      last-folder-path = "/home/josh/downloads";
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"];
      www = ["<Shift><Super>f"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      name = "terminal";
      command = "alacritty";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/shell/keybindings" = {
      screenshot-window = [];
      show-screen-recording-ui = [];
      show-screenshot-ui = ["<Shift><Super>s"];
      switch-to-application-1 = [""];
      switch-to-application-2 = [""];
      switch-to-application-3 = [""];
      switch-to-application-4 = [""];
      switch-to-application-5 = [""];
      switch-to-application-6 = [""];
      switch-to-application-7 = [""];
      switch-to-application-8 = [""];
      switch-to-application-9 = [""];
      toggle-application-view = [""];
      toggle-overview = [""];
    };

    "org/gnome/shell/world-clocks" = {
      locations = "@av []";
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = true;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 168;
      sort-column = "modified";
      sort-directories-first = false;
      sort-order = "descending";
      type-format = "category";
      view-type = "list";
      window-size = mkTuple [771 814];
    };

    "org/gtk/settings/color-chooser" = {
      selected-color = mkTuple [true 0.9764705882352941];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 156;
      sort-column = "modified";
      sort-directories-first = false;
      sort-order = "descending";
      type-format = "category";
      window-position = mkTuple [26 23];
      window-size = mkTuple [771 424];
    };

    "org/mate/terminal/profiles/default" = {
      background-color = "#FFFFFFFFDDDD";
      bold-color = "#000000000000";
      foreground-color = "#000000000000";
      palette = "#2E2E34343636:#CCCC00000000:#4E4E9A9A0606:#C4C4A0A00000:#34346565A4A4:#757550507B7B:#060698209A9A:#D3D3D7D7CFCF:#555557575353:#EFEF29292929:#8A8AE2E23434:#FCFCE9E94F4F:#72729F9FCFCF:#ADAD7F7FA8A8:#3434E2E2E2E2:#EEEEEEEEECEC";
      visible-name = "Default";
    };

    "org/gnome/terminal/legacy/profiles:" = {
      default = "5083e06b-024e-46be-9cd2-892b814f1fc8";
      list = [ "b1dcc9dd-5262-4d8d-a863-c897e6d979b9" "de8a9081-8352-4ce4-9519-5de655ad9361" "71a9971e-e829-43a9-9b2f-4565c855d664" "5083e06b-024e-46be-9cd2-892b814f1fc8" "95894cfd-82f7-430d-af6e-84d168bc34f5" ];
    };

    "org/gnome/terminal/legacy/profiles:/:5083e06b-024e-46be-9cd2-892b814f1fc8" = {
      background-color = "#24273a";
      cursor-background-color = "#f4dbd6";
      cursor-colors-set = true;
      cursor-foreground-color = "#24273a";
      custom-command = "fish";
      foreground-color = "#cad3f5";
      highlight-background-color = "#f4dbd6";
      highlight-colors-set = true;
      highlight-foreground-color = "#5b6078";
      palette = [ "#494d64" "#ed8796" "#a6da95" "#eed49f" "#8aadf4" "#f5bde6" "#8bd5ca" "#b8c0e0" "#5b6078" "#ed8796" "#a6da95" "#eed49f" "#8aadf4" "#f5bde6" "#8bd5ca" "#a5adcb" ];
      use-custom-command = true;
      use-theme-colors = false;
      visible-name = "Catppuccin Macchiato";
    };

    "org/gnome/terminal/legacy/profiles:/:71a9971e-e829-43a9-9b2f-4565c855d664" = {
      background-color = "#303446";
      cursor-background-color = "#f2d5cf";
      cursor-colors-set = true;
      cursor-foreground-color = "#303446";
      foreground-color = "#c6d0f5";
      highlight-background-color = "#f2d5cf";
      highlight-colors-set = true;
      highlight-foreground-color = "#626880";
      palette = [ "#51576d" "#e78284" "#a6d189" "#e5c890" "#8caaee" "#f4b8e4" "#81c8be" "#b5bfe2" "#626880" "#e78284" "#a6d189" "#e5c890" "#8caaee" "#f4b8e4" "#81c8be" "#a5adce" ];
      use-theme-colors = false;
      visible-name = "Catppuccin Frappe";
    };

    "org/gnome/terminal/legacy/profiles:/:95894cfd-82f7-430d-af6e-84d168bc34f5" = {
      background-color = "#1e1e2e";
      cursor-background-color = "#f5e0dc";
      cursor-colors-set = true;
      cursor-foreground-color = "#1e1e2e";
      foreground-color = "#cdd6f4";
      highlight-background-color = "#f5e0dc";
      highlight-colors-set = true;
      highlight-foreground-color = "#585b70";
      palette = [ "#45475a" "#f38ba8" "#a6e3a1" "#f9e2af" "#89b4fa" "#f5c2e7" "#94e2d5" "#bac2de" "#585b70" "#f38ba8" "#a6e3a1" "#f9e2af" "#89b4fa" "#f5c2e7" "#94e2d5" "#a6adc8" ];
      use-theme-colors = false;
      visible-name = "Catppuccin Mocha";
    };

    "org/gnome/terminal/legacy/profiles:/:de8a9081-8352-4ce4-9519-5de655ad9361" = {
      background-color = "#eff1f5";
      cursor-background-color = "#dc8a78";
      cursor-colors-set = true;
      cursor-foreground-color = "#eff1f5";
      foreground-color = "#4c4f69";
      highlight-background-color = "#dc8a78";
      highlight-colors-set = true;
      highlight-foreground-color = "#acb0be";
      palette = [ "#5c5f77" "#d20f39" "#40a02b" "#df8e1d" "#1e66f5" "#ea76cb" "#179299" "#acb0be" "#6c6f85" "#d20f39" "#40a02b" "#df8e1d" "#1e66f5" "#ea76cb" "#179299" "#bcc0cc" ];
      use-theme-colors = false;
      visible-name = "Catppuccin Latte";
    };
  };
}
