{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
        nhs = "nh os switch /etc/nixos/ ";
        git add . = "doas git add .";
        git push = "doas git push";
        
    };
  };
}