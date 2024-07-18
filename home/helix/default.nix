{
  lib,
  pkgs,
  # helix,
  ...
}: {
  imports = [
    ./langservers.nix
  ];

  home.packages = with pkgs; [
    # helix.packages.x86_64-linux.default
    helix
  ];

  home.sessionVariables = rec {
    EDITOR = "hx";
    VISUAL = EDITOR;
  };

  xdg.configFile."helix/config.toml".source = ./config.toml;
  xdg.configFile."helix/languages.toml".source = ./languages.toml;
}
