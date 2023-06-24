{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "duckdns-script";
  src = ./src;

  buildInputs = [ pkgs.bash ];

  installPhase = ''
    mkdir -p $out/bin

    substitute ${./src/duckdns-script} $out/bin/duckdns-script \
      --replace "#!/usr/bin/env bash" "#!${pkgs.bash}/bin/bash"

    chmod +x $out/bin/duckdns-script
  '';
}
