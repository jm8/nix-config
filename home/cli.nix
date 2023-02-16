{
  pkgs,
  canvas-cli,
  ...
}: {
  home.packages = with pkgs;
    [
      comma
      exa
      wl-clipboard
      neofetch
      zip
      unzip
      file
      bat
      grim
      slurp
      clang
      pandoc
      lldb
      (python3.withPackages (ps: with ps; [black python-lsp-server]))
      octave
      pdftk
      ghidra
      wireshark
      yt-dlp
      bear
      appimage-run
      lilypond
      onlyoffice-bin
      cachix
      ngrok
      lazygit
      openconnect
      subversion
      wget
    ]
    ++ [
      canvas-cli.packages.x86_64-linux.default
    ];
}
