{ pkgs, ... }:
{
  home.packages = [
    pkgs.papirus-icon-theme
  ];
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = [ pkgs.rofi-calc pkgs.rofi-emoji ];
    theme = ./theme.rasi;
    extraConfig = {
      modi = "drun,filebrowser";
      icon-theme = "Papirus";
      show-icons = true;
      terminal = "kitty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "  Apps ";
      display-run = "   Run ";
      display-filebrowser = "   File Browser ";
      display-window = "﩯  Window";
      display-Network = "󰤨  Network";
      sidebar-mode = true;
    };
  };
}
