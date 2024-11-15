{
  pkgs,
  config,
  ...
}:
{
  programs.alacritty = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.alacritty;
    settings = {
  colors = {
    primary = {
      background = "#24273a";
      foreground = "#cad3f5";
      dim_foreground = "#8087a2";
      bright_foreground = "#cad3f5";
    };

    cursor = {
      text = "#24273a";
      cursor = "#f4dbd6";
    };

    vi_mode_cursor = {
      text = "#24273a";
      cursor = "#b7bdf8";
    };

    search = {
      matches = {
        foreground = "#24273a";
        background = "#a5adcb";
      };
      focused_match = {
        foreground = "#24273a";
        background = "#a6da95";
      };
    };

    footer_bar = {
      foreground = "#24273a";
      background = "#a5adcb";
    };

    hints = {
      start = {
        foreground = "#24273a";
        background = "#eed49f";
      };
      end = {
        foreground = "#24273a";
        background = "#a5adcb";
      };
    };

    selection = {
      text = "#24273a";
      background = "#f4dbd6";
    };

    normal = {
      black = "#494d64";
      red = "#ed8796";
      green = "#a6da95";
      yellow = "#eed49f";
      blue = "#8aadf4";
      magenta = "#f5bde6";
      cyan = "#8bd5ca";
      white = "#b8c0e0";
    };

    bright = {
      black = "#5b6078";
      red = "#ed8796";
      green = "#a6da95";
      yellow = "#eed49f";
      blue = "#8aadf4";
      magenta = "#f5bde6";
      cyan = "#8bd5ca";
      white = "#a5adcb";
    };

    indexed_colors = [
      { index = 16; color = "#f5a97f"; }
      { index = 17; color = "#f4dbd6"; }
    ];
  };
  terminal.shell = "fish";
};
  };
}
