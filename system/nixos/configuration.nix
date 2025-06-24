# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  #Bootloader
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };

  networking = {
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Moscow";

  i18n = {
    defaultLocale = "ru_RU.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "ru_RU.UTF-8";
      LC_IDENTIFICATION = "ru_RU.UTF-8";
      LC_MEASUREMENT = "ru_RU.UTF-8";
      LC_MONETARY = "ru_RU.UTF-8";
      LC_NAME = "ru_RU.UTF-8";
      LC_NUMERIC = "ru_RU.UTF-8";
      LC_PAPER = "ru_RU.UTF-8";
      LC_TELEPHONE = "ru_RU.UTF-8";
      LC_TIME = "ru_RU.UTF-8";
    };
  }; 
 
  services.xserver = {
    enable = true;
    xkb.layout = "us,ru";
    xkb.options = "grp:win_space_toggle";
    videoDrivers = [ "amdgpu" ];
  }; 

  environment.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "us,ru";
    XKB_DEFAUL_OPTIONS = "grp:win_space_toggle";
    NIXOS_OZONE_WL = "1";
    #STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/ruslan/.steam/root/compatibilitytools.d";
  };
  

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;


  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  users.users.ruslan = {
    isNormalUser = true;
    description = "ruslan";
    extraGroups = [ "networkmanager" "wheel" ];
  };


  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  programs.steam = {
     enable = true;
     remotePlay.openFirewall = true;
     dedicatedServer.openFirewall = true;
     localNetworkGameTransfers.openFirewall = true;
     gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;    

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
    nerd-fonts.droid-sans-mono
    fira-code
    nerd-fonts.tinos
  ];

  
  environment.systemPackages = with pkgs; [
   #Core
   neovim wget git curl

   #terminals
   foot

   #GUI
   wofi dunst libnotify

   #Monitoring
   fastfetch
   btop
   mangohud

   #Visuals
   hyprpaper
   waybar  
   cava  
   pulseaudio  
   fcitx5
   fcitx5-configtool  

   #FilesWork
   ranger
   nautilus
   nemo
   dbus   

   #DEV
   python3
   
   #Packages Controll
   nix-index

   #apps
   chromium firefox vscode discord ayugram-desktop protonup  
  ];

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "ruslan" ];


   nixpkgs.config.allowUnfree = true;
  
 # nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
 #   "steam"
 #   "steam-original"
 #   "steam-unwrapped"
 #   "steam-run"
 # ];  

  system.stateVersion = "25.05"; 
}
