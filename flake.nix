{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
      yt-x = {
        url = "github:Benexl/yt-x";
        inputs.nixpkgs.follows = "nixpkgs";
      };  
  };
  outputs = { self, nixpkgs, spicetify-nix, ... }@inputs: 
   
  {
       nixosConfigurations.za-warudo = nixpkgs.lib.nixosSystem {
         modules = [
          ./configuration.nix
          spicetify-nix.nixosModules.default
          ];     
          specialArgs = {
          inherit inputs;
          };
       };
     
  };
}