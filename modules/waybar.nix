# ~/.config/home-manager/home.nix or a module
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "4 7 -5 9";

        modules-left = ["clock" "custom/swaync" ];
        modules-center = ["hyprland/workspaces" ];
        modules-right = ["pulseaudio" "custom/mem" "cpu" "backlight" "battery" "tray"];

        "hyprland/workspaces" = {
          disable-scroll = false;
        };



        "clock" = {
            # timezone = "America/New_York";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format = "{:%a; %d %b, %I:%M %p}";
        };

        "custom/swaync" = {
          format = "{} ";
          format-dnd = "DND ";
          format-notifications = "{} ";
          return-type = "json";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -C -sw";
          on-click-middle = "swaync-client -d -sw";
          escape = true;
          tooltip = false;
        };

        "pulseaudio" = {
            # scroll-step = 1; # %, can be a float
            reverse-scrolling = 1;
            format = "{volume}% {icon} {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = "{volume}% ";
            format-source-muted = "";
            format-icons = {
                headphone = "";
                hands-free = "";
                headset = "";
                phone = "";
                portable = "";
                car = "";
                default = ["" "" ""];
            };
            on-click = "pavucontrol";
            min-length = 13;
        };

        "custom/mem" = {
            format = "{} ";
            interval = 3;
            exec = "free -h | awk '/Mem:/{printf $3}'";
            tooltip = false;
        };

        "cpu" = {
          interval = 2;
          format = "{usage}% ";
          min-length = 6;
        };

        "temperature" = {
            # thermal-zone = 2;
            # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
            critical-threshold = 80;
            # format-critical = "{temperatureC}°C {icon}";
            format = "{temperatureC}°C {icon}";
            format-icons = ["" "" "" "" ""];
            tooltip = false;
        };

        "backlight" = {
            device = "intel_backlight";
            format = "{percent}% {icon}";
            format-icons = [""];
            min-length = 7;
        };

        battery = {
            states = {
                warning = 30;
                critical = 15;
            };
            format = "{capacity}% {icon}";
            format-charging = "{capacity}% 󰂄";
            format-plugged = "{capacity}% ";
            format-alt = "{time} {icon}";
            format-icons = {
              default = ["" "" "" "" "" ];
            };

        };

        tray = {
            icon-size = 16;
            spacing = 0;
        };

      };
    };

    style =
      ''
/* General styles, already fine */
* {
    border: none;
    border-radius: 0;
    font-family: JetBrains Mono;
    font-weight: bold;
    min-height: 20px;
}

/* Main Waybar window - this is already set to fully transparent */
window#waybar {
    background: transparent;
    background-color: rgba(0, 0, 0, 0.0);
}

window#waybar.hidden {
    opacity: 0.2;
}

/* --- Modules - Apply Transparency Here --- */

#workspaces {
    margin-right: 8px;
    border-radius: 10px;
    transition: none;
    /* Use rgba() for transparency */
    background: rgba(56, 60, 74, 0.7); /* Original color #383c4a with 70% opacity */
}

#workspaces button {
    transition: none;
    color: #7c818c;
    background: transparent; /* Buttons inside workspaces should be transparent */
    padding: 5px;
    font-size: 18px;
}

#workspaces button.persistent {
    color: #7c818c;
    font-size: 12px;
}

#workspaces button:hover {
    transition: none;
    box-shadow: inherit;
    text-shadow: inherit;
    border-radius: inherit;
    color: #383c4a;
    background: rgba(124, 129, 140, 0.7); /* Original hover color #7c818c with 70% opacity */
}

#workspaces button.active {
    background: rgba(78, 82, 99, 0.9); /* Original active color #4e5263 with 90% opacity */
    color: white;
    border-radius: inherit;
}

/* Assuming #language, #custom-rofi, #custom-pacman, #custom-mail, #submap exist but are not in your current modules list.
   I'll apply the same transparency logic to them for completeness, you can remove if not used. */

#language {
    padding-left: 16px;
    padding-right: 8px;
    border-radius: 10px 0px 0px 10px;
    transition: none;
    color: #ffffff;
    background: rgba(56, 60, 74, 0.7); /* Original color #383c4a with 70% opacity */
}

#custom-rofi {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: rgba(56, 60, 74, 0.7); /* Original color #383c4a with 70% opacity */
}

#hyprland-window {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: rgba(56, 60, 74, 0.7); /* Original color #383c4a with 70% opacity */
}

#custom-pacman {
    padding-left: 16px;
    padding-right: 8px;
    border-radius: 10px 0px 0px 10px;
    transition: none;
    color: #ffffff;
    background: rgba(56, 60, 74, 0.7); /* Original color #383c4a with 70% opacity */
}

#custom-mail {
    margin-right: 8px;
    padding-right: 16px;
    border-radius: 0px 10px 10px 0px;
    transition: none;
    color: #ffffff;
    background: rgba(56, 60, 74, 0.7); /* Original color #383c4a with 70% opacity */
}

#submap {
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: rgba(56, 60, 74, 0.7); /* Original color #383c4a with 70% opacity */
}

#clock {
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px 0px 0px 10px;
    transition: none;
    color: #ffffff;
    background: rgba(56, 60, 74, 0.7); /* Original color #383c4a with 70% opacity */
}

#custom-swaync {
    padding-right: 16px;
    border-radius: 0px 10px 10px 0px;
    transition: none;
    color: #ffffff;
    background: rgba(56, 60, 74, 0.7); /* Original color #383c4a with 70% opacity */
}

#pulseaudio {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: rgba(56, 60, 74, 0.7); /* Original color #383c4a with 70% opacity */
}

#pulseaudio.muted {
    /* Keep this as is if you want it opaque when muted, or adjust rgba() here too */
    background-color: #90b1b1;
    color: #2a5c45;
}

#custom-mem {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: rgba(56, 60, 74, 0.7); /* Original color #383c4a with 70% opacity */
}

#cpu {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: rgba(56, 60, 74, 0.7); /* Original color #383c4a with 70% opacity */
}

#temperature {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: rgba(56, 60, 74, 0.7); /* Original color #383c4a with 70% opacity */
}

#temperature.critical {
    background-color: #eb4d4b; /* Keep this opaque if you want a strong visual warning */
}

#backlight {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: rgba(56, 60, 74, 0.7); /* Original color #383c4a with 70% opacity */
}

#battery {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: rgba(56, 60, 74, 0.7); /* Original color #383c4a with 70% opacity */
}

#battery.charging {
    color: #ffffff;
    background-color: rgba(38, 166, 91, 0.8); /* Original #26A65B with 80% opacity */
}

#battery.warning:not(.charging) {
    background-color: rgba(255, 190, 97, 0.8); /* Original #ffbe61 with 80% opacity */
    color: black;
}

#battery.critical:not(.charging) {
    background-color: rgba(245, 60, 59, 0.8); /* Original #f53c3c with 80% opacity */
    color: #ffffff;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

#tray {
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: rgba(56, 60, 74, 0.7); /* Original color #383c4a with 70% opacity */
}

@keyframes blink {
    to {
        background-color: #ffffff;
        color: #000000;
    }
}
      '';
  };
}