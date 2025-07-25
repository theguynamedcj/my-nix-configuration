{ pkgs, ... }: {
  home = {
    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
      gtk.enable = true;
      x11 = {
        enable = true;
        defaultCursor = true;
      };
    };
  };
}