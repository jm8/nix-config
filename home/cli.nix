{
  pkgs,
  canvas-cli,
  ...
}: {
  home.packages = with pkgs;
    [
      comma
      eza
      wl-clipboard
      neofetch
      zip
      unzip
      file
      bat
      pandoc
      (python3.withPackages (ps:
        with ps; [
          # black
          # python-lsp-server
          # requests
          # pwntools
          # pycryptodome
        ]))
      bun
      deno
      nodejs
      nodePackages.pnpm
      octave
      pdftk
      ghidra
      wireshark
      yt-dlp
      bear
      appimage-run
      onlyoffice-bin
      cachix
      ngrok
      wget
      ripgrep
      typst
      typst-lsp
      dconf2nix
      # terraform
      awscli2
      just
      anki-bin
      zellij
      zathura
      nodePackages.cspell
      texlive.combined.scheme-full
      litecli
      texlab
      jq
      libre-baskerville
      open-sans
      netcat-openbsd
      npins
      binutils
      flyctl
      supabase-cli
      strace
      gdb
      pwndbg
      uv
    ]
    ++ [
      canvas-cli.packages.x86_64-linux.default
    ];
}
