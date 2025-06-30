{ pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "Gruvbox-Dark-B";
    };
  };
}