{ config, pkgs, ... }:{
  wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;
      plugins = [pkgs.hyprlandPlugins.hyprbars];
extraConfig = ''
    monitor=,preferred,auto,auto

    $terminal = ${pkgs.kitty}/bin/kitty
    $fileManager = ${pkgs.kdePackages.dolphin}/bin/dolphin
    $menu = ${pkgs.rofi}/bin/rofi -show drun -show-icons
    $browser = ${pkgs.firefox}/bin/firefox
    $chat = ${pkgs.discord}/bin/discord
    

    env = XCURSOR_SIZE,24
    env = HYPRCURSOR_SIZE,24

    general {
    gaps_in = 10
    gaps_out = 14
    border_size = 3
    layout = dwindle
    resize_on_border = true
    }

decoration {
    rounding = 10
    active_opacity = 0.8
    inactive_opacity = 0.7
    fullscreen_opacity = 0.9

    blur {
        enabled = true
        size = 6
        passes = 4
        new_optimizations = on
        ignore_opacity = true
        xray = true
        blurls = waybar
    }

    shadow {
        enabled = true
        range = 30
        render_power = 3
        color = 0x66000000
    }
}

    animations {
        enabled = yes
    bezier = linear, 0, 0, 1, 1
    bezier = md3_standard, 0.2, 0, 0, 1
    bezier = md3_decel, 0.05, 0.7, 0.1, 1
    bezier = md3_accel, 0.3, 0, 0.8, 0.15
    bezier = overshot, 0.05, 0.9, 0.1, 1.1
    bezier = crazyshot, 0.1, 1.5, 0.76, 0.92 
    bezier = hyprnostretch, 0.05, 0.9, 0.1, 1.0
    bezier = menu_decel, 0.1, 1, 0, 1
    bezier = menu_accel, 0.38, 0.04, 1, 0.07
    bezier = easeInOutCirc, 0.85, 0, 0.15, 1
    bezier = easeOutCirc, 0, 0.55, 0.45, 1
    bezier = easeOutExpo, 0.16, 1, 0.3, 1
    bezier = softAcDecel, 0.26, 0.26, 0.15, 1
    bezier = md2, 0.4, 0, 0.2, 1 # use with .2s duration
    animation = windows, 1, 3, md3_decel
    animation = windowsIn, 1, 3, md3_decel
    animation = windowsOut, 1, 3, md3_accel
    animation = border, 1, 10, default
    animation = fade, 1, 3, md3_decel
    animation = layers, 1, 2, md3_decel, slide
    animation = layersIn, 1, 3, menu_decel, slide
    animation = layersOut, 1, 1.6, menu_accel
    animation = fadeLayersIn, 1, 2, menu_decel
    animation = fadeLayersOut, 1, 4.5, menu_accel
    animation = workspaces, 1, 7, menu_decel, slide
    animation = workspaces, 1, 2.5, softAcDecel, slide
    animation = workspaces, 1, 7, menu_decel, slidefade 15%
    animation = specialWorkspace, 1, 3, md3_decel, slidefadevert 15%
    animation = specialWorkspace, 1, 3, md3_decel, slidevert
    }

    dwindle {
        pseudotile = true
        preserve_split = true
    }

    master {
        new_status = master
    }

    misc {
        force_default_wallpaper = -1
        disable_hyprland_logo = false
    }

    input {
        kb_layout = ng
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =
        follow_mouse = 1
        sensitivity = 0
        touchpad {
            natural_scroll = true
        }
    }

    gestures {
        workspace_swipe = true
    }

    device {
        name = epic-mouse-v1
        sensitivity = -0.5
    }
    plugin {
     hyprbars {
        bar_color = rgb(242424)
    bar_height = 30
    bar_title_enabled = true
    bar_text_align = center
    bar_buttons_alignment = right
    bar_padding = 7
    bar_button_padding = 10

    
    hyprbars-button = rgb(fe5e56), 15, , hyprctl dispatch killactive
    hyprbars-button = rgb(fdba2d), 15, , hyprctl dispatch fullscreen 1
    hyprbars-button = rgb(28c640), 15, , hyprctl dispatch movetoworkspacesilent special:magic
}
    }

    $mainMod = SUPER
    $alt = ALT
    bind = $mainMod, T, exec, $terminal
    bind = $mainMod, Q, killactive,
    bind = $mainMod, E, exec, $fileManager
    bind = $mainMod, M, togglefloating,
    bind = $mainMod, L, exec, hyprlock
    bind = $mainMod, F, fullscreen, 0
    bind = $mainMod SHIFT, F, fullscreen, 1
    bind = bind = SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy
    bind = $mainMod, R, exec, $menu
    bind = $mainMod, P, pseudo,
    bind = $mainMod, J, togglesplit,
    bind = $mainMod, B, exec, $browser
    bind = $mainMod, D, exec, $chat
    bind = , Print, exec, ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp -d)"
    bind = $alt, TAB, exec, ${pkgs.rofi}/bin/rofi -show window
    bind = $mainMod, delete, exec, wlogout
    bind = $mainMod, C, exec, hyprpicker
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10
    bind = $mainMod, S, togglespecialworkspace, magic
    bind = $mainMod SHIFT, S, movetoworkspace, special:magic
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow
bindel = ,XF86AudioRaiseVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
    bindel = ,XF86AudioLowerVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    bindel = ,XF86AudioMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    bindel = ,XF86AudioMicMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
    bindel = ,XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl -e4 -n2 set 5%+
    bindel = ,XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl -e4 -n2 set 5%-
    bindl = , XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next
    bindl = , XF86AudioPause, exec, ${pkgs.playerctl}/bin/playerctl play-pause
    bindl = , XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause
    bindl = , XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous

    windowrule = suppressevent maximize, class:.*
    windowrule = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0
    windowrule = float,class:(.*org.pulseaudio.pavucontrol.*)
    windowrule = size 700 600,class:(.*org.pulseaudio.pavucontrol.*)
    windowrule = center,class:(.*org.pulseaudio.pavucontrol.*)
    windowrule = pin,class:(.*org.pulseaudio.pavucontrol.*)
    layerrule = blur, swaync-control-center
    layerrule = blur, swaync-notification-window
    layerrule = ignorezero, swaync-control-center
    layerrule = ignorezero, swaync-notification-window
    layerrule = ignorealpha 0.5, swaync-control-center
    layerrule = ignorealpha 0.5, swaync-notification-window
    env = MOZ_ENABLE_WAYLAND,1
    env = QT_QPA_PLATFORM,wayland;xcb
    env = QT_QPA_PLATFORMTHEME,qt6ct
    env = QT_QPA_PLATFORMTHEME,qt5ct
    env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
    env = QT_AUTO_SCREEN_SCALE_FACTOR,1

    windowrule = tile, title:^(Microsoft-edge)$ 
    windowrule = tile, title:^(Brave-browser)$
    windowrule = tile, title:^(Chromium)$
    windowrule = float, title:^(pavucontrol)$
    windowrule = float, title:^(blueman-manager)$
    windowrule = float, title:^(nm-connection-editor)$
    windowrule = float, title:^(qalculate-gtk)$
    windowrule = float, title:^(Picture-in-Picture)$
    windowrule = pin, title:^(Picture-in-Picture)$
    windowrule = move 69.5% 4%, title:^(Picture-in-Picture)$
    windowrule = idleinhibit fullscreen,class:([focus])

    exec-once = bash ~/.config/hypr/start.sh
    exec-once = systemctl --user start hyprpolkitagent
    exec-once = wl-paste --type text --watch cliphist store
    exec-once = wl-paste --type image --watch cliphist store 
    exec-once = systemctl --user enable --now hypridle.service 
    exec-once = waybar &
    exec-once = swaync
    exec-once = hyprctl setcursor Bibata-Modern-Ice 24
    exec-once = hypridle
    exec-once = nm-applet
    exec-once = blueman-adapters
  '';


  };
}