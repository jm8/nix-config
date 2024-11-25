{
  pkgs,
  nix-vscode-extensions,
  lib,
  ...
}: {
  programs.vscode = {
    package = pkgs.vscode;
    extensions = with nix-vscode-extensions.extensions.x86_64-linux.vscode-marketplace; [
      rust-lang.rust-analyzer
      jnoortheen.nix-ide
      ms-python.python
      redhat.java
      vscjava.vscode-java-debug
      vscjava.vscode-java-test
      catppuccin.catppuccin-vsc
      gregoire.dance
    ];
    # mutableExtensionsDir = false;
    enable = true;
  };
  home.activation.vscodeSettings = lib.hm.dag.entryAfter ["writeBoundary"] ''
    rm -f ~/.config/Code/User/settings.json && ln -s ~/nix-config/home/vscode/settings.json ~/.config/Code/User/settings.json
    rm -f ~/.config/Code/User/keybindings.json && ln -s ~/nix-config/home/vscode/keybindings.json ~/.config/Code/User/keybindings.json
  '';
}
