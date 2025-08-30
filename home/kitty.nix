{
  config,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;

    package = config.lib.nixGL.wrap pkgs.kitty;

    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 12;
    };

    theme = "Catppuccin-Macchiato";

    extraConfig = ''
      confirm_os_window_close 0
      shell fish
      enabled_layouts tall:bias=50;full_size=1;mirrored=false,stack
      allow_remote_control yes
    '';

    keybindings = {
      "alt+n" = "new_window_with_cwd";
      "alt+h" = "neighboring_window left";
      "alt+l" = "neighboring_window right";
      "alt+j" = "neighboring_window down";
      "alt+k" = "neighboring_window up";
      "ctrl+f" = "toggle_layout stack";
    };
  };
}
