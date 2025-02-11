# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
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
      # document-font-name = "JetBrainsMonoNL Nerd Font Propo 11";
      # font-name = "JetBrainsMonoNL Nerd Font Propo 11";
      # monospace-font-name = "JetBrainsMonoNL Nerd Font Mono 11";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Alt>q"];
      cycle-panels = [];
      cycle-panels-backward = [];
      maximize = ["<Alt>w"];
      minimize = [];
      move-to-monitor-down = [];
      move-to-monitor-left = [];
      move-to-monitor-right = [];
      move-to-monitor-up = [];
      move-to-workspace-1 = [];
      move-to-workspace-2 = [];
      move-to-workspace-3 = [];
      move-to-workspace-4 = [];
      move-to-workspace-last = [];
      move-to-workspace-left = ["<Shift><Alt>a"];
      move-to-workspace-right = ["<Shift><Alt>d"];
      switch-applications = [];
      switch-applications-backward = [];
      switch-input-source = [];
      switch-input-source-backward = [];
      switch-panels = [];
      switch-panels-backward = [];
      switch-to-workspace-last = [];
      switch-to-workspace-left = ["<Alt>a"];
      switch-to-workspace-right = ["<Alt>d"];
      switch-windows = ["<Alt>Tab"];
      switch-windows-backward = ["<Shift><Alt>Tab"];
      unmaximize = [];
    };

    "org/gnome/desktop/wm/preferences" = {
      auto-raise = false;
      button-layout = "appmenu:close";
      focus-mode = "sloppy";
      num-workspaces = 10;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = false;
      experimental-features = ["scale-monitor-framebuffer"];
      workspaces-only-on-primary = true;
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = ["<Alt>z"];
      toggle-tiled-right = ["<Alt>c"];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"];
      www = ["<Shift><Alt>f"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Alt>Return";
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
      show-screenshot-ui = ["<Shift><Alt>s"];
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

    "org/gnome/desktop/a11y" = {
      always-show-universal-access-status = true;
    };
  };
}
