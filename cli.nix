{pkgs, ...}: {
	home.packages = with pkgs; [
		comma
		exa
		wl-clipboard
    neofetch
    zip
    unzip
    file
    bat
		grim
		slurp
		clang
		pandoc
		lldb
		python3
		octave
	];
}
