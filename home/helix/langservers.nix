{
  pkgs,
  nix-analyzer,
  ...
}: {
  home.packages = with pkgs;
    [
      clang-tools
      alejandra
      rust-analyzer
      rustfmt
      zls
      zig
    ]
    ++ [
      nix-analyzer.packages.x86_64-linux.default
    ];
}
