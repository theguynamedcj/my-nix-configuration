{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "adwaita-dark";
      package = pkgs.gnome.adwaita-theme;
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme; 
      name = "Papirus"; 
    };
    gtk3.extraConfig = {
    "gtk-application-prefer-dark-theme" = true;
  };
  gtk4.extraConfig = {
    "gtk-application-prefer-dark-theme" = true;
  };

    
  };
  
    
   dconf = {
    enable = true;
    settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark"; 
      gtk-theme = "adwaita-dark"; 
      icon-theme = "Papirus";
    };
    };
     };
}