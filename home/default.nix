{
  nixpkgs,
  pkgs,
  nix-analyzer,
  nixGL,
  lib,
  config,
  ...
}: {
  imports = [
    ./cli.nix
    ./gui.nix
    ./helix
    ./xdg.nix
    ./dconf.nix
    ./fish.nix
  ];

  home.keyboard = null;

  # programs.firefox = {
  #   enable = true;
  # };

  programs.direnv = {
    enable = true;
    # enableFishIntegration = true;
    nix-direnv.enable = true;
  };

  manual.manpages.enable = true;

  programs.man = {
    enable = true;
    generateCaches = true;
  };

  programs.git = {
    enable = true;
    ignores = [
      ".direnv"
    ];
    userEmail = "jm8hjkl@gmail.com";
    userName = "Joshua Sims";
    extraConfig = {
      push.autoSetupRemote = true;
      pull.rebase = true;
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      theme = "catppuccin-mocha";
      default_layout = "compact";
      default_shell = "fish";
      pane_frames = false;
    };
  };

  programs.nix-index.enable = true;

  programs.home-manager.enable = true;

  nix.channels = {
    inherit nixpkgs;
  };

  nix.registry = {
    np = {
      from = {
        type = "indirect";
        id = "np";
      };
      flake = nixpkgs;
    };
    nixpkgs = {
      from = {
        type = "indirect";
        id = "nixpkgs";
      };
      flake = nixpkgs;
    };
  };
}
