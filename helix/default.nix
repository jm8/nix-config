{ lib, pkgs, ... }: {
  home.packages = with pkgs; [
    helix

    rnix-lsp
    nixpkgs-fmt

  ];

  home.sessionVariables = rec {
    EDITOR = "hx";
    VISUAL = EDITOR;
  };

  xdg.configFile."helix/config.toml".source = ./config.toml;
}
