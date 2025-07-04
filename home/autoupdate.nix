{pkgs, ...}: {
  systemd.user.services.hm-update = {
    Service = {
      ExecStart = "/home/josh/nix-config/update.sh";
    };
    Install = {
      WantedBy = ["default.timer"];
    };
  };

  systemd.user.timers.hm-update = {
    Timer = {
      OnCalendar = "daily";
      Persistent = true;
    };
    Install = {
      WantedBy = ["timers.target"];
    };
  };
}
