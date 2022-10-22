{ pkgs, ... }:
{
  home.packages = with pkgs; [
    xdg-utils
  ];

  xdg.userDirs = {
    enable = true;
    desktop = /home/josh/data/desktop;
    documents = /home/josh/data/documents;
    download = /home/josh/downloads;
    music = /home/josh/data/music;
    pictures = /home/josh/data/pictures;
    videos = /home/josh/data/videos;
  };
  
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      
    };
  };
}
