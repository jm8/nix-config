{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 37;
        modules-right = [ "network" "battery" "pulseaudio" "clock#date" "clock#time" ];
        network = {
          format = "{icon}";
          format-wifi = "  {essid}";
          format-ethernet = "  {ifname}";
          format-disconnected = "⚠ disconnected";
        };
        pulseaudio = {
          format = "{icon}  {volume}%";
          format-icons = [ "" "" ];
        };
        battery = {
          format = "{icon}  {capacity}% {time}";
          format-charging = " {icon}  {capacity}% {time}";
          format-plugged = " {icon}  {capacity}%";
          format-full = "  {icon}  Full";
          format-time = "{H}h{M}m";
          format-icons = [ "" "" "" "" "" ];
        };
        "clock#date" = {
          format = "{:%a %b %d}";
        };
        "clock#time" = {
          format = "{:%I:%M %p}";
        };
      };
    };
    style = ./style.css;
  };
}
