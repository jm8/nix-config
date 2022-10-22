{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = [ "memory" "disk" "cpu" ];
        modules-center = ["clock#date" "clock#time"];
        modules-right = [ "network" "battery" "backlight" "pulseaudio" ];
        memory = {
          format = " {used:.3} GiB";
        };
        disk = {
          format = " {used} GiB";
        };
        cpu = {
          format = " {usage}%";
        };
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
          format-notcharging = "⚠ {icon}  {capacity}% Not charging";
          format-plugged = " {icon}  {capacity}%";
          format-full = "  {icon}  Full";
          format-time = "{H}h{M}m";
          format-icons = [ "" "" "" "" "" ];
        };
        backlight = {
          format = " {percent}%";
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
