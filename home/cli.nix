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
        pycryptodome
      ]);
    nixGL = config.nixGL.packages.x86_64-linux.nixGLIntel;
  in [
    awscli2
    bat
    bear
    binutils
    binwalk
    bun
    cachix
    canvas-cli.packages.x86_64-linux.default
    cmake
    comma
    dconf2nix
    deno
    eza
    ffmpeg
    file
    flyctl
    gcc
    gdb
    ghidra
    gnumake
    go-task
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
    patchelf
    pdftk
    pwndbg
    pythonWithPackages
    ripgrep
    ssm-session-manager-plugin
    strace
    texlive.combined.scheme-full
    typst
    typst-lsp
    unzip
    uv
    wget
    wireshark
    wl-clipboard
    xxd
    yt-dlp
    zathura
    zellij
    zip
  ];

  programs.zsh = {
    enable = true;
  };
}
