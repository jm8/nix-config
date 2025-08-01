{
  pkgs,
  lib,
  ...
}: {
  programs.fish = {
    enable = true;
    shellAliases = {
      "dl" = ''set dl_file (ls -t ~/downloads | head -n 1); mv ~/downloads/$dl_file .; echo "$dl_file"'';
      "g" = "git";
      "grt" = ''cd "$(git rev-parse --show-toplevel || echo .)"'';
      "ggpur" = ''ggu'';
      "ga" = ''git add'';
      "gaa" = ''git add --all'';
      "gapa" = ''git add --patch'';
      "gau" = ''git add --update'';
      "gav" = ''git add --verbose'';
      "gwip" = ''git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'';
      "gam" = ''git am'';
      "gama" = ''git am --abort'';
      "gamc" = ''git am --continue'';
      "gamscp" = ''git am --show-current-patch'';
      "gams" = ''git am --skip'';
      "gap" = ''git apply'';
      "gapt" = ''git apply --3way'';
      "gbs" = ''git bisect'';
      "gbsb" = ''git bisect bad'';
      "gbsg" = ''git bisect good'';
      "gbsn" = ''git bisect new'';
      "gbso" = ''git bisect old'';
      "gbsr" = ''git bisect reset'';
      "gbss" = ''git bisect start'';
      "gbl" = ''git blame -w'';
      "gb" = ''git branch'';
      "gba" = ''git branch --all'';
      "gbd" = ''git branch --delete'';
      "gbD" = ''git branch --delete --force'';
      "gbm" = ''git branch --move'';
      "gbnm" = ''git branch --no-merged'';
      "gbr" = ''git branch --remote'';
      "ggsup" = ''git branch --set-upstream-to=origin/$(git_current_branch)'';
      "gco" = ''git checkout'';
      "gcor" = ''git checkout --recurse-submodules'';
      "gcb" = ''git checkout -b'';
      "gcB" = ''git checkout -B'';
      "gcd" = ''git checkout $(git_develop_branch)'';
      "gcm" = ''git checkout $(git_main_branch)'';
      "gcp" = ''git cherry-pick'';
      "gcpa" = ''git cherry-pick --abort'';
      "gcpc" = ''git cherry-pick --continue'';
      "gclean" = ''git clean --interactive -d'';
      "gcl" = ''git clone --recurse-submodules'';
      "gcam" = ''git commit --all --message'';
      "gcas" = ''git commit --all --signoff'';
      "gcasm" = ''git commit --all --signoff --message'';
      "gcs" = ''git commit --gpg-sign'';
      "gcss" = ''git commit --gpg-sign --signoff'';
      "gcssm" = ''git commit --gpg-sign --signoff --message'';
      "gcmsg" = ''git commit --message'';
      "gcsm" = ''git commit --signoff --message'';
      "gc" = ''git commit --verbose'';
      "gca" = ''git commit --verbose --all'';
      "gcf" = ''git config --list'';
      "gdct" = ''git describe --tags $(git rev-list --tags --max-count=1)'';
      "gd" = ''git diff'';
      "gdca" = ''git diff --cached'';
      "gdcw" = ''git diff --cached --word-diff'';
      "gds" = ''git diff --staged'';
      "gdw" = ''git diff --word-diff'';
      "gdup" = ''git diff @{upstream}'';
      "gdt" = ''git diff-tree --no-commit-id --name-only -r'';
      "gf" = ''git fetch'';
      "gfa" = ''git fetch --all --prune --jobs=10'';
      "gfo" = ''git fetch origin'';
      "gg" = ''git gui citool'';
      "gga" = ''git gui citool --amend'';
      "ghh" = ''git help'';
      "glgg" = ''git log --graph'';
      "glgga" = ''git log --graph --decorate --all'';
      "glgm" = ''git log --graph --max-count=10'';
      "glods" = ''git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'';
      "glod" = ''git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'';
      "glola" = ''git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'';
      "glols" = ''git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'';
      "glol" = ''git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'';
      "glo" = ''git log --oneline --decorate'';
      "glog" = ''git log --oneline --decorate --graph'';
      "gloga" = ''git log --oneline --decorate --graph --all'';
      "glp" = ''_git_log_prettily'';
      "glg" = ''git log --stat'';
      "glgp" = ''git log --stat --patch'';
      "gignored" = ''git ls-files -v | grep "^[[:lower:]]"'';
      "gfg" = ''git ls-files | grep'';
      "gm" = ''git merge'';
      "gma" = ''git merge --abort'';
      "gms" = ''git merge --squash'';
      "gmom" = ''git merge origin/$(git_main_branch)'';
      "gmum" = ''git merge upstream/$(git_main_branch)'';
      "gmtl" = ''git mergetool --no-prompt'';
      "gmtlvim" = ''git mergetool --no-prompt --tool=vimdiff'';
      "gl" = ''git pull'';
      "gpr" = ''git pull --rebase'';
      "gprv" = ''git pull --rebase -v'';
      "gpra" = ''git pull --rebase --autostash'';
      "gprav" = ''git pull --rebase --autostash -v'';
      "gprom" = ''git pull --rebase origin $(git_main_branch)'';
      "gpromi" = ''git pull --rebase=interactive origin $(git_main_branch)'';
      "ggpull" = ''git pull origin "$(git_current_branch)"'';
      "gluc" = ''git pull upstream $(git_current_branch)'';
      "glum" = ''git pull upstream $(git_main_branch)'';
      "gp" = ''git push'';
      "gpd" = ''git push --dry-run'';
      "gpf" = ''git push --force-with-lease --force-if-includes'';
      "gpsup" = ''git push --set-upstream origin $(git_current_branch)'';
      "gpsupf" = ''git push --set-upstream origin $(git_current_branch) --force-with-lease --force-if-includes'';
      "gpv" = ''git push --verbose'';
      "gpoat" = ''git push origin --all && git push origin --tags'';
      "gpod" = ''git push origin --delete'';
      "ggpush" = ''git push origin "$(git_current_branch)"'';
      "gpu" = ''git push upstream'';
      "grb" = ''git rebase'';
      "grba" = ''git rebase --abort'';
      "grbc" = ''git rebase --continue'';
      "grbi" = ''git rebase --interactive'';
      "grbo" = ''git rebase --onto'';
      "grbs" = ''git rebase --skip'';
      "grbd" = ''git rebase $(git_develop_branch)'';
      "grbm" = ''git rebase $(git_main_branch)'';
      "grbom" = ''git rebase origin/$(git_main_branch)'';
      "grf" = ''git reflog'';
      "gr" = ''git remote'';
      "grv" = ''git remote --verbose'';
      "gra" = ''git remote add'';
      "grrm" = ''git remote remove'';
      "grmv" = ''git remote rename'';
      "grset" = ''git remote set-url'';
      "grup" = ''git remote update'';
      "grh" = ''git reset'';
      "gru" = ''git reset --'';
      "grhh" = ''git reset --hard'';
      "grhk" = ''git reset --keep'';
      "grhs" = ''git reset --soft'';
      "gpristine" = ''git reset --hard && git clean --force -dfx'';
      "groh" = ''git reset origin/$(git_current_branch) --hard'';
      "grs" = ''git restore'';
      "grss" = ''git restore --source'';
      "grst" = ''git restore --staged'';
      "gunwip" = ''git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'';
      "grev" = ''git revert'';
      "greva" = ''git revert --abort'';
      "grevc" = ''git revert --continue'';
      "grm" = ''git rm'';
      "grmc" = ''git rm --cached'';
      "gcount" = ''git shortlog --summary --numbered'';
      "gsh" = ''git show'';
      "gsps" = ''git show --pretty=short --show-signature'';
      "gstall" = ''git stash --all'';
      "gstaa" = ''git stash apply'';
      "gstc" = ''git stash clear'';
      "gstd" = ''git stash drop'';
      "gstl" = ''git stash list'';
      "gstp" = ''git stash pop'';
      "gsta" = ''git stash push'';
      "gsts" = ''git stash show --patch'';
      "gst" = ''git status'';
      "gss" = ''git status --short'';
      "gsb" = ''git status --short --branch'';
      "gsi" = ''git submodule init'';
      "gsu" = ''git submodule update'';
      "gsd" = ''git svn dcommit'';
      "gsr" = ''git svn rebase'';
      "gsw" = ''git switch'';
      "gswc" = ''git switch --create'';
      "gswd" = ''git switch $(git_develop_branch)'';
      "gswm" = ''git switch $(git_main_branch)'';
      "gta" = ''git tag --annotate'';
      "gts" = ''git tag --sign'';
      "gtv" = ''git tag | sort -V'';
      "gignore" = ''git update-index --assume-unchanged'';
      "gunignore" = ''git update-index --no-assume-unchanged'';
      "gwch" = ''git whatchanged -p --abbrev-commit --pretty=medium'';
      "gwt" = ''git worktree'';
      "gwta" = ''git worktree add'';
      "gwtls" = ''git worktree list'';
      "gwtmv" = ''git worktree move'';
      "gwtrm" = ''git worktree remove'';
      "gstu" = ''gsta --include-untracked'';
      "sudo" = ''sudo --preserve-env=PATH env'';
    };
    plugins = [
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
    ];
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  # home.activation.configure-tide = lib.hm.dag.entryAfter ["writeBoundary"] ''
  # ${pkgs.fish}/bin/fish -c "tide configure --auto --style=Lean --prompt_colors='True color' --show_time=No --lean_prompt_height='Two lines' --prompt_connection=Solid --prompt_connection_andor_frame_color=Dark --prompt_spacing=Sparse --icons='Many icons' --transient=No"
  # '';
}
