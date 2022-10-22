{ pkgs, hyprland, nix-godot, ... }: {
  imports = [
    ./cli.nix
    ./gui.nix
    ./helix/default.nix
    ./hyprland/default.nix
    ./kitty/default.nix
    ./waybar/default.nix
    ./cursor/default.nix
    ./rofi/default.nix
    ./xdg.nix
    hyprland.homeManagerModules.default
  ];

  home.username = "josh";
  home.homeDirectory = "/home/josh";

  home.keyboard = null;

  programs.vscode = {
    package = pkgs.vscodium;
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

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.gh = {
    enable = true;
    enableGitCredentialHelper = true;
  };
  
  programs.home-manager.enable = true;

  home.stateVersion = "22.11";
}
