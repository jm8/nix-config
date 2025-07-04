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
    ./autoupdate.nix
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
    settings = {
      theme = "catppuccin-mocha";
      default_layout = "compact";
      default_shell = "fish";
      pane_frames = false;
      show_startup_tips = false;
      on_force_close = "quit";
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

  nixGL.packages = nixGL.packages;
  nixGL.vulkan.enable = true;
  nixGL.defaultWrapper = "mesa";

  programs.ssh.extraConfig = ''
    Host darnay
    	Hostname darnay
    	RemoteCommand fish
    	RequestTty force
    Host stryver
    	Hostname stryver
    	RemoteCommand fish
    	RequestTty force
  '';

  home.sessionVariables = {
    # To install REAPER with SPITFIRE AUDIO
    # 1. install bottle in flatpak
    # 2. Make new bottle with data in /home/josh/data/music/bottle/spitfire
    # 3. Donwload SpitfireAudio-Win-3.4.13.exe and run it in the bottle.
    # 4. This installs Spitfire Audio, in which you now install login and download the plugin
    # 5. Download the release of yabridge
    # 6. ./yabridgectl add /home/josh/data/music/bottle/spitfire/drive_c/Program\ Files/Common\ Files/VST3/
    #    ./yabridgectl status
    #    ./yabridgectl sync
    WINEPREFIX = "/home/josh/data/music/bottle/spitfire";
    WINELOADER = "/home/josh/.var/app/com.usebottles.bottles/data/bottles/runners/soda-9.0-1/bin/wine";
  };
}
