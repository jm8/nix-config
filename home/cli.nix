{
  pkgs,
  canvas-cli,
  config,
  ...
}: {
  home.packages = with pkgs; let
    pythonWithPackages = python3.withPackages (ps:
      with ps; [
        requests
        pwntools
      ]);
    nixGL = config.nixGL.packages.x86_64-linux.nixGLIntel;
  in [
    awscli2
    bat
    bear
    binutils
    bun
    cachix
    canvas-cli.packages.x86_64-linux.default
    comma
    dconf2nix
    deno
    eza
    ffmpeg
    file
    flyctl
    gdb
    ghidra
    jq
    just
    neofetch
    netcat-openbsd
    nixGL
    nodePackages.pnpm
    nodejs
    octave
    onlyoffice-bin
    pandoc
    pdftk
    pwndbg
    pythonWithPackages
    ripgrep
    strace
    texlive.combined.scheme-full
    typst
    typst-lsp
    unzip
    uv
    wget
    wireshark
    wl-clipboard
    yt-dlp
    zathura
    zellij
    zip
  ];

  programs.zsh = {
    enable = true;
  };
}
