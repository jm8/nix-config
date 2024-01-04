{
  pkgs,
  hyprland,
  nix-analyzer,
  ...
}: {
  imports = [
    ./cli.nix
    ./gui.nix
    ./helix
    ./kitty
    ./waybar
    ./cursor
    ./xdg.nix
    ./dconf.nix
    ./neovim.nix
    hyprland.homeManagerModules.default
  ];

  home.username = "josh";
  home.homeDirectory = "/home/josh";

  home.keyboard = null;

  programs.vscode = {
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      jnoortheen.nix-ide
      ms-python.python
      redhat.java
      vscjava.vscode-java-debug
      vscjava.vscode-java-test
    ];
    enable = true;
  };

  home.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
    brightnessctl
    pamixer
    obs-studio
  ];

  fonts.fontconfig.enable = true;

  programs.firefox = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.gh = {
    enable = true;
    enableGitCredentialHelper = true;
  };

  home.file.".xonshrc".text = ''
    execx($(starship init xonsh))
  '';

  home.sessionVariables = {
    NIX_ANALYZER_HOME_MANAGER = "1";
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
      extraConfig = ''
        zstyle ':bracketed-paste-magic' active-widgets '.self-*'
      '';
    };
    shellAliases = {
      # code = "code --ozone-platform=wayland";
    };
  };

  programs.nix-index.enable = true;

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.home-manager.enable = true;

  manual.manpages.enable = false;

  home.stateVersion = "22.11";
}
