{pkgs}: let
  x = import (pkgs.path + "/nixos/lib/eval-config.nix") {
    system = builtins.currentSystem;
    modules = [];
  };
in
  null
