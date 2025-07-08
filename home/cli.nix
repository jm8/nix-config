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
    go
    go-task
    jq
    just
    nasm
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
    rustscan
    ssm-session-manager-plugin
    strace
    # texlive.combined.scheme-full
    typst
    typstyle
    tmux
    tinymist
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
    metasploit
    rlwrap
  ];

  programs.zsh = {
    enable = true;
  };
}
