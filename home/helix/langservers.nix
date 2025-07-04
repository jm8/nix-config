{
  pkgs,
  nix-analyzer,
  ...
}: {
  home.packages = with pkgs;
    [
      alejandra
      black
      clang-tools
      cmake-language-server
      dart
      deno
      # elixir_ls
      # elmPackages.elm-language-server
      gopls
      # haskell-language-server
      jdt-language-server
      # kotlin-language-server
      # metals
      # nim
      # nimlsp
      nodePackages.bash-language-server
      nodePackages.dockerfile-language-server-nodejs
      nodePackages.svelte-language-server
      nodePackages.typescript-language-server
      # nodePackages.vls
      nodePackages.vscode-langservers-extracted
      nodePackages.yaml-language-server
      # ocamlPackages.ocaml-lsp
      pyright
      ruff
      # rubyPackages.solargraph
      rust-analyzer
      rustfmt
      # sumneko-lua-language-server
      # taplo
      zig
      zls
      omnisharp-roslyn
      dotnet-sdk
    ]
    ++ [
      # nix-analyzer.packages.x86_64-linux.default
    ];
}
