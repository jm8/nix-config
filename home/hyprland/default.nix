{ pkgs, hyprland, ... }:
{
  home.packages = with pkgs; [
    swaybg
  ];
  gtk = {
    enable = true;
    font = {
      name = "DejaVu Sans";
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
  wayland.windowManager.hyprland = {
    package = null; # because we have nixos module
    enable = true;
    extraConfig = ''
      exec-once=waybar
      exec-once=swaybg -o '*' -i /home/josh/data/wallpapers/wallpaper.jpg -m fill
      exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      monitor=DP-1,preferred,0x0,1
      monitor=DVI-D-1,preferred,1600x0,1
      monitor=HDMI-A-1,preferred,3200x0,1
      monitor=eDP-1,preferred,auto,1.5

      input {
          kb_file=
          kb_layout=
          kb_variant=
          kb_model=
          kb_options=
          kb_rules=

          follow_mouse=1

          touchpad {
              natural_scroll=yes
          }

          sensitivity=0 # -1.0 - 1.0, 0 means no modification.
      }

      general {
          main_mod=SUPER

          gaps_in=5
          gaps_out=20
          border_size=2
          col.active_border=0x66b7bdf8
          col.inactive_border=0x666e738d

          apply_sens_to_raw=0 # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)

          damage_tracking=full # leave it on full unless you hate your GPU and want to make it suffer
      }

      decoration {
          rounding=10
          blur=1
          blur_size=3 # minimum 1
          blur_passes=1 # minimum 1
          blur_new_optimizations=1
      }

      animations {
          enabled=1
          animation=windows,1,7,default
          animation=border,1,10,default
          animation=fade,1,10,default
          animation=workspaces,1,6,default
      }

      dwindle {
          pseudotile=0 # enable pseudotiling on dwindle
      }

      gestures {
          workspace_swipe=yes
      }

      # example window rules
      # for windows named/classed as abc and xyz
      #windowrule=move 69 420,abc
      #windowrule=size 420 69,abc
      #windowrule=tile,xyz
      #windowrule=pseudo,abc
      #windowrule=monitor 0,xyz

      bind=SUPER,RETURN,exec,kitty
      bind=SUPERSHIFT,F,exec,firefox
      bind=SUPERSHIFT,C,exec,code
      bind=SUPERSHIFT,S,exec,grim -g "$(slurp)" - | wl-copy
      bind=SUPERSHIFT,E,exit,
      bind=SUPER,SPACE,exec,rofi -show drun
      bind=SUPERSHIFT,Q,killactive,
      bind=SUPER,P,pseudo,
      
      bind=,XF86AudioRaiseVolume,exec,pamixer -i 10
      bind=,XF86AudioLowerVolume,exec,pamixer -d 10
      bind=,XF86MonBrightnessUp,exec,brightnessctl s +10% 
      bind=,XF86MonBrightnessDown,exec,brightnessctl s 10%-

      bind=SUPER,V,togglefloating,

      bind=SUPER,left,movefocus,l
      bind=SUPER,right,movefocus,r
      bind=SUPER,up,movefocus,u
      bind=SUPER,down,movefocus,d

      bind=SUPER,h,movefocus,l
      bind=SUPER,l,movefocus,r
      bind=SUPER,k,movefocus,u
      bind=SUPER,j,movefocus,d

      bind=SUPER,1,workspace,1
      bind=SUPER,2,workspace,2
      bind=SUPER,3,workspace,3
      bind=SUPER,4,workspace,4
      bind=SUPER,5,workspace,5
      bind=SUPER,6,workspace,6
      bind=SUPER,7,workspace,7
      bind=SUPER,8,workspace,8
      bind=SUPER,9,workspace,9
      bind=SUPER,0,workspace,10

      bind=ALT,1,movetoworkspace,1
      bind=ALT,2,movetoworkspace,2
      bind=ALT,3,movetoworkspace,3
      bind=ALT,4,movetoworkspace,4
      bind=ALT,5,movetoworkspace,5
      bind=ALT,6,movetoworkspace,6
      bind=ALT,7,movetoworkspace,7
      bind=ALT,8,movetoworkspace,8
      bind=ALT,9,movetoworkspace,9
      bind=ALT,0,movetoworkspace,10

      bind=SUPER,mouse_down,workspace,e+1
      bind=SUPER,mouse_up,workspace,e-1
    '';
  };
}
