{ lib, pkgs, ... }: {
  imports = [
    ./langservers.nix
  ];

  home.packages = with pkgs; [
    helix
  ];

  home.sessionVariables = rec {
    EDITOR = "hx";
    VISUAL = EDITOR;
  };

  xdg.configFile."helix/config.toml".source = ./config.toml;
  xdg.configFile."helix/languages.toml".source = ./languages.toml;
}
