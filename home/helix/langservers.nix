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
      bash-language-server
      dockerfile-language-server-nodejs
      svelte-language-server
      typescript-language-server
      # vls
      vscode-langservers-extracted
      yaml-language-server
      # ocamlPackages.ocaml-lsp
      basedpyright
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
