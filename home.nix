{ config, pkgs, lib, inputs, ... }:


{
  imports = [
    ./modules/fish.nix #fish config
    ./modules/fastfetch.nix # fastfetch config
    ./modules/git.nix # git config
    ./modules/waybar.nix # waybar config
    ./modules/kitty.nix # kitty config
    ./modules/starship.nix # starship config
    ./modules/zsh.nix # zsh config
    ./modules/btop.nix # btop config
    ./modules/qt.nix # qt config
    ./modules/gtk.nix # gtk config
    ./modules/mako.nix # mako config
    ./modules/rofi.nix # rofi config
    ./modules/cursor.nix # cursor
    ./modules/hyprlock.nix # locking app
    ./modules/hypridle.nix # hyprland idle management daemon
    ./modules/wlogout.nix # wlogout config
  ];

  home.stateVersion = "25.05"; # DONT TOUCH

  home.username = "ecuasv"; # username
  home.homeDirectory = "/home/ecuasv"; # home directory

nixpkgs.config.allowUnfree = true;


  home.packages = with pkgs; [
    htop
    neofetch
    grim
    slurp
    networkmanagerapplet
    wlr-randr
    wl-clipboard
    swaybg
    rofi
    waybar
    papirus-icon-theme
    pavucontrol  
    gruvbox-gtk-theme
    lxappearance
    mako
    hyprpaper
    hyprpicker
    hypridle
    hyprlock
    hyprsunset
    hyprpolkitagent
    cliphist
    blueman
    swaynotificationcenter
    networkmanagerapplet
    waypaper
 


  ];




}

 

