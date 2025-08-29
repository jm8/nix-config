#!/bin/sh
cd ~/nix-config || exit 1
if [ -n "$(git status --porcelain)" ]; then
  git add -A && git commit -m "temp"
  git pull --ff-only || exit 1
  git push
fi
nix flake update
if home-manager switch --flake ~/nix-config; then
  git add -A && git commit -m "update"
  git pull --ff-only || exit 1
  git push
else
  git stash
  home-manager switch --flake ~/nix-config 
fi
