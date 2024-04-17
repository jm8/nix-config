{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    settings = {
      window_padding_width = 4;
      confirm_os_window_close = 0;
      background_opacity = "0.9";
      shell = "fish";
    };
    font = {
      name = "JetBrainsMonoNL NF Regular";
    };
    extraConfig = ''
      # vim:ft=kitty

      ## name:     Catppuccin Kitty Diff Mocha
      ## author:   Catppuccin Org
      ## license:  MIT
      ## upstream: https://github.com/catppuccin/kitty/blob/main/macchiato.conf
      ## blurb:    Soothing pastel theme for the high-spirited!



      # The basic colors
      foreground              #CAD3F5
      background              #24273A
      selection_foreground    #24273A
      selection_background    #F4DBD6

      # Cursor colors
      cursor                  #F4DBD6
      cursor_text_color       #24273A

      # URL underline color when hovering with mouse
      url_color               #F4DBD6

      # Kitty window border colors
      active_border_color     #B7BDF8
      inactive_border_color   #6E738D
      bell_border_color       #EED49F

      # OS Window titlebar colors
      wayland_titlebar_color system
      macos_titlebar_color system

      # Tab bar colors
      active_tab_foreground   #181926
      active_tab_background   #C6A0F6
      inactive_tab_foreground #CAD3F5
      inactive_tab_background #1E2030
      tab_bar_background      #181926

      # Colors for marks (marked text in the terminal)
      mark1_foreground #24273A
      mark1_background #B7BDF8
      mark2_foreground #24273A
      mark2_background #C6A0F6
      mark3_foreground #24273A
      mark3_background #7DC4E4

      # The 16 terminal colors

      # black
      color0 #494D64
      color8 #5B6078

      # red
      color1 #ED8796
      color9 #ED8796

      # green
      color2  #A6DA95
      color10 #A6DA95

      # yellow
      color3  #EED49F
      color11 #EED49F

      # blue
      color4  #8AADF4
      color12 #8AADF4

      # magenta
      color5  #F5BDE6
      color13 #F5BDE6

      # cyan
      color6  #8BD5CA
      color14 #8BD5CA

      # white
      color7  #B8C0E0
      color15 #A5ADCB
    '';
  };
}
