{ config, pkgs, lib, inputs, ... }:

{
  home.stateVersion = "25.05";

  home.username = "ecuasv";
  home.homeDirectory = "/home/ecuasv";


  home.packages = with pkgs; [
    htop
    neofetch
  ];

 programs.fastfetch = {
   enable = true;
  settings = {
    logo = {
    type = "kitty-icat";
    source = "/home/ecuasv/Videos/linux-tux.gif";
    height = 15;
    width = 30;
    padding = {
      top = 5;
      left = 3;
    };
  };

  modules = [
    "break"
    {
      type = "custom";
      format = "\x1b[90m┌──────────────────────Hardware──────────────────────┐";
    }
    {
      type = "host";
      key = " PC";
      keyColor = "green";
    }
    {
      type = "cpu";
      key = "│ ├";
      keyColor = "green";
    }
    {
      type = "gpu";
      key = "│ ├󰍛"; # These are often Nerd Font glyphs
      keyColor = "green";
    }
    {
      type = "memory";
      key = "│ ├󰍛";
      keyColor = "green";
    }
    {
      type = "disk";
      key = "└ └";
      keyColor = "green";
    }
    {
      type = "custom";
      format = "\x1b[90m└────────────────────────────────────────────────────┘";
    }
    "break"
    {
      type = "custom";
      format = "\x1b[90m┌──────────────────────Software──────────────────────┐";
    }
    {
      type = "os";
      key = " OS";
      keyColor = "yellow";
    }
    {
      type = "kernel";
      key = "│ ├";
      keyColor = "yellow";
    }
    {
      type = "bios";
      key = "│ ├";
      keyColor = "yellow";
    }
    {
      type = "packages";
      key = "│ ├󰏖";
      keyColor = "yellow";
    }
    {
      type = "shell";
      key = "└ └";
      keyColor = "yellow";
    }
    "break"
    {
      type = "de";
      key = " DE";
      keyColor = "blue";
    }
    {
      type = "lm";
      key = "│ ├";
      keyColor = "blue";
    }
    {
      type = "wm";
      key = "│ ├";
      keyColor = "blue";
    }
    {
      type = "wmtheme";
      key = "│ ├󰉼";
      keyColor = "blue";
    }
    {
      type = "terminal";
      key = "└ └";
      keyColor = "blue";
    }
    {
      type = "custom";
      format = "\x1b[90m└────────────────────────────────────────────────────┘";
    }
    "break"
    {
      type = "custom";
      format = "\x1b[90m┌────────────────────Uptime / Age / DT────────────────────┐";
    }
    {
      type = "command";
      key = "  OS Age ";
      keyColor = "magenta";
      text = ''
        birth_install=$(stat -c %W /);
        current=$(date +%s);
        time_progression=$((current - birth_install));
        days_difference=$((time_progression / 86400));
        echo "$days_difference days"
      ''; # Using Nix's multi-line string for clarity
    }
    {
      type = "uptime";
      key = "  Uptime ";
      keyColor = "magenta";
    }
    {
      type = "datetime";
      key = "  DateTime ";
      keyColor = "magenta";
    }
    {
      type = "custom";
      format = "\x1b[90m└─────────────────────────────────────────────────────────┘";
    }
    {
      type = "colors";
      paddingLeft = 2;
      symbol = "circle";
    }
  ];
   };
};

  

  programs.fish = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
  };

  programs.starship = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "theguynamedcj";
    userEmail = "osuyaclemson1977@gmail.com";
   
  };
  

  programs.kitty = {
    enable = true;
    font = {
      name = "AnonymicePro Nerd Font";
      style = "Bold"
    }
  };
}