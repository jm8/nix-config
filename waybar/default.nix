{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 37;
        modules-right = [ "network" "battery" ];
        network = {
          format = "{ifname}";
          format-wifi = "{essid}";
          format-ethernet = "ethernet";
          format-disconnected = "disconnected";
        };
      };
    };
    style = ./style.css;
  };
}
