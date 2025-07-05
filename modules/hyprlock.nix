{ config, lib, pkgs, ... }:

let

  colors = import ./colors.nix; 

  ml4wCacheFolder = "${config.home.homeDirectory}/.cache/ml4w/hyprland-dotfiles";

  # CHANGE THIS LINE:
  fontFamily = "JetBrainsMono Nerd Font"; 

in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        ignore_empty_input = true;
      };

      background = {
        monitor = "";
        path = "/home/ecuasv/Pictures/catppuccin-wallpapers/landscapes/evening-sky.png";
      };

      input-field = {
        monitor = "";
        size = "200, 50";
        outline_thickness = 3;
        dots_size = 0.33;
        dots_spacing = 0.15;
        dots_center = true;
        dots_rounding = -1;
        outer_color = colors.on_primary;
        inner_color = colors.on_surface;
        font_color = colors.surface;
        fade_on_empty = true;
        fade_timeout = 1000;
        placeholder_text = "<i>Input Password...</i>";
        hide_input = false;
        rounding = 40;
        check_color = colors.primary;
        fail_color = colors.error;
        fail_text = "<i>\$FAIL <b>(\$ATTEMPTS)</b></i>";
        fail_transition = 300;
        capslock_color = -1;
        numlock_color = -1;
        bothlock_color = -1;
        invert_numlock = false;
        swap_font_color = false;
        position = "0, -20";
        halign = "center";
        valign = "center";
        shadow_passes = 10;
        shadow_size = 20;
        shadow_color = colors.shadow;
        shadow_boost = 1.6;
      };

      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$TIME"'';
          color = colors.on_surface;
          font_size = 55;
          font_family = fontFamily; 
          position = "-100, 70";
          halign = "right";
          valign = "bottom";
          shadow_passes = 5;
          shadow_size = 10;
        }
        {
          monitor = "";
          text = "\$USER";
          color = colors.on_surface;
          font_size = 20;
          font_family = fontFamily; # This will now use "JetBrainsMono Nerd Font"
          position = "-100, 160";
          halign = "right";
          valign = "bottom";
          shadow_passes = 5;
          shadow_size = 10;
        }
      ];

      image = {
        monitor = "";
        path = "${ml4wCacheFolder}/square_wallpaper.png";
        size = 280;
        rounding = 40;
        border_size = 4;
        border_color = colors.primary;
        rotate = 0;
        reload_time = -1;
        position = "0, 200";
        halign = "center";
        valign = "center";
        shadow_passes = 10;
        shadow_size = 20;
        shadow_color = colors.shadow;
        shadow_boost = 1.6;
      };
    };
  };
}
