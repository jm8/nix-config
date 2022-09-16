{pkgs, ...}: {
	home.packages = with pkgs; [
		exa
		wl-clipboard
	];
}
