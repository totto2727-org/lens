{
  description = "Standalone MoonBit Lens library";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";
    moonbit-overlay = {
      url = "github:totto2727/moonbit-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      moonbit-overlay,
      ...
    }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "x86_64-linux"
      ];
      forEachSystem = nixpkgs.lib.genAttrs supportedSystems;
      mkPkgs = system: import nixpkgs {
        inherit system;
        overlays = [ moonbit-overlay.overlays.default ];
      };
    in
    {
      devShells = forEachSystem (
        system:
        let
          pkgs = mkPkgs system;
        in
        {
          default = pkgs.mkShell {
            packages = [
              pkgs.clang
              pkgs.moonbit-bin.moonbit.latest
              pkgs.nodejs_24
            ];
          };
        }
      );

      checks = forEachSystem (
        system:
        let
          pkgs = mkPkgs system;
        in
        {
          moon = pkgs.runCommand "lens-moon-check" {
            nativeBuildInputs = [
              pkgs.clang
              pkgs.moonbit-bin.moonbit.latest
              pkgs.nodejs_24
            ];
          } ''
            export HOME="$TMPDIR/home"
            mkdir -p "$HOME"
            cp -R ${self} source
            chmod -R u+w source
            cd source
            moon check --target all
            moon test --target all
            moon package --list
            touch "$out"
          '';
        }
      );
    };
}
