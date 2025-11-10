{ config, pkgs, ...}: {
    home = {
        username = "ruslan";
        homeDirectory = "/home/ruslan";
        stateVersion = "23.11";
    };

    programs.bash = {
        enable = true;
        shellAliases = {
            rebuild = "sudo nixos-rebuild switch";
        };
    };

    imports = [
        
        ./modules/waybar.nix
    ];
    
}
