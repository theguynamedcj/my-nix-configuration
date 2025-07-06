# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in

{
  imports =
    [ 
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];
    
  services.blueman.enable = true;
 boot = {
  kernelParams = [ "resume_offset=23564288" ];
  resumeDevice = "/dev/disk/by-uuid/af477bf1-82f0-4e93-bb9b-a263e6b24b1b";
  loader = {
    systemd-boot.enable = false; # disable systemd-boot
    grub = {
      enable = true; # enable grub
      device = "nodev"; # use no device for grub
      efiSupport = true; # uefi devices
      timeoutStyle = "hidden"; # hide timeout
    };
    efi.canTouchEfiVariables = true; # allow edit efi variables
    timeout = 0; # set timeout
  };
  plymouth = {
    enable = true; # theming the boot screen
    theme = "rings"; # theme repo
    themePackages = with pkgs; [
       (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        }) # theme package
    ];
  };
};

 networking.hostName = "za-warudo"; # 
  # networking.wireless.enable = true;  # you dont need this
   networking.networkmanager.enable = true;  # use this instead
   
  # Set your time zone.
   time.timeZone = "Africa/Lagos";

  # Dont touch this, it is not needed
  # networking.proxy.default = "http://user:password@proxy:port/"; 
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # # dont touch this, it is not needed
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };


  services = {
  xserver = {
    enable = true;
  };
   displayManager.gdm.enable = true;
}; 


xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    wlr.enable = true;
    config = {
      common.default = ["gtk"];
      hyprland.default = ["gtk" "hyprland"];
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
};
  
   services.xserver.xkb.layout = "ng"; # leave the way it is
   services.flatpak.enable = true; #flatpak support
   services.hypridle.enable = true; # hypridle support
  # services.xserver.xkb.options = "eurosign:e,caps:escape"; # dont touch


   services.printing.enable = true; # printing but idk why i enabled this but just leave it like this

  # services.pulseaudio.enable = true; # dont use this
  services.pipewire = { # use this
     enable = true;
     pulse.enable = true;
   };

    services.dbus.enable = true; # dbus
     security.polkit.enable = true; # polkit
	services.gnome.gnome-keyring.enable = true; # key ring
  security.sudo.enable = false; # disable sudo, use doas instead
  security.doas.enable = true; # eable doas
  security.doas.extraRules = [{
    users = [ "ecuasv" ];
    keepEnv = true;
    persist = true;
  }]; # doas rules for user ecuasv

  # services.libinput.enable = true; # not needed


   users.users.ecuasv = {
     isNormalUser = true;
     extraGroups = [ "wheel" "video" ]; 
     packages = with pkgs; [
       tree
     ];
   };
  home-manager = {
  extraSpecialArgs = {inherit inputs;};
  users = {
    "ecuasv" = import ./home.nix;
  };
  };
  
  
 services.playerctld.enable = true; # playerctl support for media controls

  programs.firefox.enable = true; # keep firefox no matter what
  programs.fish.enable = true; # fish shell
  programs.steam={
        enable = true; # enable steam
        gamescopeSession.enable = true; # for optmized gaming
  };
  programs.gamemode.enable = true; # enable gamemode for better gaming performance
  programs.kdeconnect.enable = true; # phone integration
  programs.spicetify = { 
    enable = true; # enable spicetify theming
    theme = spicePkgs.themes.comfy; # theme repository
      colorScheme = "Yami"; # specific color scheme
    enabledExtensions = with spicePkgs.extensions; [
          adblock # adblocker
	    ];
      enabledSnippets = with spicePkgs.snippets; [
          rotatingCoverart # cover art rotation
          pointer # pointer for cover art 
      ];
  };
  programs.chromium.enablePlasmaBrowserIntegration = true; # plasma integration for vivaldi
  programs.starship.enable = true; # starship prompt
  programs.java.enable = true; # java support for applications
  virtualisation.docker.enable = true; # docker and distrobox support
  programs.appimage.enable = true; # install app image run
  programs.appimage.binfmt = true; # binfmt support for app images
  virtualisation.waydroid.enable = true; # waydroid support
  programs.openvpn3.enable = true; # vpn support
  programs.zsh.enable =  true; # zsh shell
  hardware.graphics = {
    enable = true; # for graphics support
    enable32Bit = true; # 32 bit support
  };


 programs.hyprland = {
    enable = true; # hyprland wm
    xwayland.enable = true; # xwayland bridge
  };
 xdg.mime.enable = true;
  xdg.menus.enable = true;


  
  programs.light.enable = true;  # brightness control
  environment.systemPackages = with pkgs; [
     vim 
     wget
     kitty
     gedit
     btop
     kdePackages.dolphin
     fastfetch
     fortune
     pipes
     spotify
     cmatrix
     cava
     libreoffice-qt6-fresh
     pipx
     lolcat
     sl
     xsnow
     figlet
     asciiquarium
     vencord
     waydroid
     vscode
     (discord.override {
      withVencord = true;
     }
     )
     winetricks
     kdePackages.kolourpaint
     kdePackages.sddm-kcm
     wayland-utils
     kdePackages.discover
     kdePackages.kcalc
     kdePackages.kcolorchooser
     kdePackages.ksystemlog
     kdiff3
     kdePackages.isoimagewriter
     hardinfo2
     haruna
     kdePackages.kcharselect
     kdePackages.partitionmanager
     vesktop
     kdePackages.filelight
     kdePackages.kate
     aria2
     wineWowPackages.stable
     ffmpeg
     nodejs
     unzip
     inetutils
     tldr
     rofi-wayland
     ddgr    
     mpv
     cartridges
     cool-retro-term
     inputs.yt-x.packages."${system}".default
     yt-dlp
     jp2a
     (python312.withPackages (ps: with ps; [
      pygame
      pip
      tqdm
      numpy
      pillow
      cython
     ]))
     kando
     gnumake
     mangohud
     protonup
     tt
     kdePackages.plasma-browser-integration
     cmake
     brave
     lavat
     powershell
     starship
     kdePackages.ghostwriter    
     jdk24
     docker
     distrobox
     gcc
     pkg-config
     ninja
     extra-cmake-modules
     kdePackages.qtbase
     obsidian
     inputs.nur.legacyPackages.${pkgs.system}.repos.shadowrz.klassy-qt6
     neovim
     youtube-music
     kdePackages.audiotube
     file    
     appimage-run
     asciinema_3 
     arduino
     element
     element-desktop
     sddm-astronaut
     osu-lazer
     kdePackages.kdenlive
     krita
     inkscape
     gimp3
     jq
     hyprshade
     qalculate-gtk
     git
     wlogout
     playerctl
     kdePackages.kservice
     kdePackages.dolphin
     kdePackages.kio
     kdePackages.kdf
     kdePackages.kio-fuse
     kdePackages.kio-extras
     kdePackages.kio-admin
     kdePackages.qtwayland
     kdePackages.plasma-integration
     kdePackages.kdegraphics-thumbnailers
     kdePackages.breeze-icons
     kdePackages.qtsvg
     shared-mime-info
     nautilus
    inputs.nh.packages.${pkgs.system}.default
    kdePackages.qt6ct
    efibootmgr 
    ];


    fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fantasque-sans-mono

];
    environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
    }; # path for proton GE
     environment.etc."/xdg/menus/applications.menu".text = builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

    environment.etc."chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json".source =
    "${pkgs.kdePackages.plasma-browser-integration}/etc/chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json"; # specify path for plasma integration for vivaldi

  nixpkgs.config = {
    allowUnfree = true; # allow unfree liscensed software
    allowBroken = true; # allow broken packages
  };

  users.defaultUserShell = pkgs.zsh; # set default shell

  nix.settings = { 
  experimental-features = [ "nix-command" "flakes" ]; 
  }; # enable flakes


  hardware.bluetooth.enable = true; # bluetooth
  hardware.bluetooth.powerOnBoot = true; # bluetooth on startup

  nix.gc = {
                automatic = true; # enable garbage collection for saving space
                dates = "weekly"; # run it weekly
                options = "--delete-older-than 7d"; # delete old gens after 7 days
  };


  system.autoUpgrade = {
      enable = true; # enable auto update for software
      dates = "weekly"; # do it weekly
  };
swapDevices = [
  {
    device = "/swapfile";
    size = 8192; 
  }
];

  boot.kernel.sysctl = { "vm.swappiness" = 10;}; # set swappiness for better performance


nixpkgs.config.allowUnsupportedSystem = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;


  # system.copySystemConfiguration = true;
  system.stateVersion = "25.05"; # DONT CHANGE AT ALL

}
