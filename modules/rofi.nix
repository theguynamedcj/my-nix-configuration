{pkgs, ...}:{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;


    theme = "gruvbox-dark-hard";
    extraConfig = {
      display-drun = "Apps";
      display-run = "Run";
      modi = "drun,run,ssh";
      show-icons = true;
      icon-theme = "Papirus";
      terminal = "kitty";
      font = "AnonymicePro Nerd Font";
      fullscreen = false;
      hide-scrollbar = true;
      sidebar-mode = true;
      location = 0;
};
};
}