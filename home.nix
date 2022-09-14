{pkgs, ...}: {
  home.username = "josh";
  home.homeDirectory = "/home/josh";
  
  home.keyboard = null;
  
  home.packages = with pkgs; [
    firefox
    helix
    rnix-lsp
  ];
}
