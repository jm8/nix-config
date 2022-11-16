{ pkgs, hyprland, nix-godot, nix-analyzer, ... }: {
  imports = [
    ./cli.nix
    ./gui.nix
    ./helix
    ./hyprland
    ./kitty
    ./waybar
    ./cursor
    ./rofi
    ./xdg.nix
    hyprland.homeManagerModules.default
  ];

  home.username = "josh";
  home.homeDirectory = "/home/josh";

  home.keyboard = null;

  programs.vscode = {
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      jnoortheen.nix-ide
      ms-python.python
    ] ++ [
      #nix-analyzer.packages.x86_64-linux.vscode-extension
    ];
    enable = true;
  };
  
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    nix-godot.packages.x86_64-linux.godot
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
  };

  programs.gh = {
    enable = true;
    enableGitCredentialHelper = true;
  };
  
  home.file.".xonshrc".text = ''
    execx($(starship init xonsh))
  ''; 
  
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
  };
  
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  
  programs.home-manager.enable = true;

  home.stateVersion = "22.11";
}
