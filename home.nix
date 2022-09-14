{pkgs, ...}: {
  home.username = "josh";
  home.homeDirectory = "/home/josh";
  
  home.keyboard = null;
  
  home.packages = with pkgs; [
    firefox
  ];
  
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
