{ config, pkgs, ... }:{
   wayland.windowManager.sway = {
       enable = true;
       package = pkgs.sway;
       config = rec {
        modifier = "Mod4";
        terminal = "kitty";
	startup = [
  		{ command = "swaybg -i /home/ecuasv/Pictures/catppuccin-wallpapers/landscapes/evening-sky.png"; }
  		{ command = "waybar &"; }
	];
	keybindings = {
	"XF86MonBrightnessDown" = "exec light -U 10";
	"XF86MonBrightnessUp" = "exec light -A 10";
	"XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";  
	"XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";    
        "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
	"${modifier}+Return" = "exec ${terminal}";
 	"${modifier}+Shift+q" = "kill";
 	"${modifier}+d" = "exec rofi -show drun -show icon";
	"${modifier}+1" = "workspace number 1";
	"${modifier}+2" = "workspace number 2";
	"${modifier}+3" = "workspace number 3";
	"${modifier}+4" = "workspace number 4";
	"${modifier}+5" = "workspace number 5";
	"${modifier}+6" = "workspace number 6";
	"${modifier}+7" = "workspace number 7";
	"${modifier}+8" = "workspace number 8";
	"${modifier}+9" = "workspace number 9";
	"${modifier}+0" = "workspace number 10";
	"${modifier}+Shift+1" = "move container to workspace number 1";
	"${modifier}+Shift+2" = "move container to workspace number 2";
	"${modifier}+Shift+3" = "move container to workspace number 3";
	"${modifier}+Shift+4" = "move container to workspace number 4";
	"${modifier}+Shift+5" = "move container to workspace number 5";
	"${modifier}+Shift+6" = "move container to workspace number 6";
	"${modifier}+Shift+7" = "move container to workspace number 7";
	"${modifier}+Shift+8" = "move container to workspace number 8";
	"${modifier}+Shift+9" = "move container to workspace number 9";
	"${modifier}+Shift+0" = "move container to workspace number 0";

	
	

	
	
	};
     };
    };
}