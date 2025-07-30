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
        tqdm
        sympy
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
    duckdb
    eza
    ffmpeg
    file
    flyctl
    fzf
    gcc
    musl.dev
    gdb
    ghidra
    gnumake
    go
    go-task
    jq
    just
    metasploit
    nasm
    ncdu
    neofetch
    netcat-openbsd
    nixGL
    nmap
    nodePackages.pnpm
    nodejs
    octave
    onlyoffice-bin
    pandoc
    patchelf
    pdftk
    pythonWithPackages
    ripgrep
    rlwrap
    rustscan
    ssm-session-manager-plugin
    strace
    tinymist
    tmux
    typst
    typstyle
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
    texlive.combined.scheme-full
  ];

  programs.zsh = {
    enable = true;
  };
}
