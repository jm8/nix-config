{ pkgs, ... }: {
  home.username = "josh";
  home.homeDirectory = "/home/josh";

  home.keyboard = null;

  home.packages = with pkgs; [
    eclipses.eclipse-java
    neofetch
    zip
    unzip
    file
    bat
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
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
