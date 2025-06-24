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
  };
  outputs = { self, nixpkgs, spicetify-nix, trmt, home-manager, nur,   ... }@inputs: 
   
  {
       nixosConfigurations.za-warudo = nixpkgs.lib.nixosSystem {
         modules = [
          ({ pkgs, ... }: {
          environment.systemPackages = [ trmt.packages.${pkgs.system}.default ];
         
        })
          
          ./configuration.nix
          spicetify-nix.nixosModules.default
          nur.modules.nixos.default
          
         
         
        
          ];     
          specialArgs = {
          inherit inputs;
          };
       };
     
  };
}
