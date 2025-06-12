{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
      yt-x = {
        url = "github:Benexl/yt-x";
        inputs.nixpkgs.follows = "nixpkgs";
      };  
    trmt.url = "github:cenonym/trmt";
  };
  outputs = { self, nixpkgs, spicetify-nix, trmt, ... }@inputs: 
   
  {
       nixosConfigurations.za-warudo = nixpkgs.lib.nixosSystem {
         modules = [
          ({ pkgs, ... }: {
          environment.systemPackages = [ trmt.packages.${pkgs.system}.default ];
        })
          ./configuration.nix
          spicetify-nix.nixosModules.default
          ];     
          specialArgs = {
          inherit inputs;
          };
       };
     
  };
}
