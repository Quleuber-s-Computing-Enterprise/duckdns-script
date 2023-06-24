{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/23.05";

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      # pkgs = forAllSystems (system: nixpkgs.legacyPackages.${system});
      thePackage = import ./default.nix;
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        rec {
          duckdns-script = pkgs.callPackage thePackage { inherit pkgs; };
          default = duckdns-script;
        }
      );
    };
}
