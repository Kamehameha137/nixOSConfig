{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    steam
    chromium
    firefox
    ayugram-desktop
    foot
    kitty
    wofi
    mpv
    discord
    pcmanfm-qt

    # Coding stuff
    gcc
    python3
    vscode
    neovim

    # CLI utils
    curl
    fastfetch
    file
    tree
    wget
    git
    fastfetch
    btop
    nix-index
    unzip
    scrot
    ffmpeg
    mediainfo
    ranger
    cava
    zip
    yt-dlp
    lazygit
    bluez
    bluez-tools

    # GUI utils
    mako
    fcitx5
    qt6Packages.fcitx5-configtool

    # Wayland stuff
    wl-clipboard
    cliphist
    wayland

    # WMs and stuff
    hyprland
    hyprpaper
    waybar

    # Sound
    pipewire
    pulseaudio
    pamixer
    pavucontrol

    # GPU stuff 
    protonup-ng

    # Screenshotting
    grim
    grimblast
    slurp
    swappy

    # Other
    nftables
    home-manager
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    hack-font
    nerd-fonts.tinos
    fira-code
    nerd-fonts.droid-sans-mono
  ];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated S>
  };
}
