{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
     home-manager = {
     url = "github:nix-community/home-manager?ref=master"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
      yt-x = {
        url = "github:Benexl/yt-x";
        inputs.nixpkgs.follows = "nixpkgs";
      };  
    trmt.url = "github:cenonym/trmt";
     nur.url = "github:nix-community/NUR";
     nix-snapd.url = "github:nix-community/nix-snapd";
    nix-snapd.inputs.nixpkgs.follows = "nixpkgs";
      nh.url = "github:viperML/nh";
    nh.inputs.nixpkgs.follows = "nixpkgs";

  };
  outputs = { self, nixpkgs, spicetify-nix, trmt, home-manager, nur, nix-snapd, nh, ... }@inputs: 
   
  {
       nixosConfigurations.za-warudo = nixpkgs.lib.nixosSystem {
         modules = [
          ({ pkgs, ... }: {
          environment.systemPackages = [ trmt.packages.${pkgs.system}.default ];
         
        })
          
          ./configuration.nix
          spicetify-nix.nixosModules.default
          nur.modules.nixos.default
          inputs.home-manager.nixosModules.default
           nix-snapd.nixosModules.default
          
           {
          services.snap.enable = true;
           programs.nh = {
            enable = true;
            clean.enable = true;
            clean.extraArgs = "--keep-since 4d --keep 3";
            flake = "/etc/nixos/";
          };
           }
          
         ];     
          specialArgs = {
          inherit inputs;
          };
       };
     
  };
}
