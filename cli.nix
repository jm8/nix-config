{pkgs, ...}: {
	home.packages = with pkgs; [
		exa
		wl-clipboard
    neofetch
    zip
    unzip
    file
    bat
		grim
		slurp
	];
}
