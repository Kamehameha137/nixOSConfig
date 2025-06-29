# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


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

  i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [ fcitx5-mozc fcitx5-rime ];
  };


  environment.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "us,ru";
    XKB_DEFAUL_OPTIONS = "grp:win_space_toggle";
    NIXOS_OZONE_WL = "1";
    #STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/ruslan/.steam/root/compatibilitytools.d";
  };
  

  services.xserver.displayManager.sddm = {
    enable = true;
    wayland.enable = true;  # Для Wayland-сессий
  };

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
   kitty
   ghostty

   #GUI
   rofi mako libnotify

   #Monitoring
   fastfetch
   btop
   mangohud

   #Visuals
   hyprpaper
   waybar  
   cava  
   fcitx5
   fcitx5-configtool  

   #FilesWork
   ranger
   nemo
   dbus   

   #DEV
   python3
   
   #Packages Controll
   nix-index

   #apps
   chromium firefox vscode ayugram-desktop protonup  
  ];

   nixpkgs.config.allowUnfree = true;
  

  system.stateVersion = "25.05"; 
}
