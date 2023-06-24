{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "duckdns-script";
  src = ./src;

  # buildInputs = [ pkgs.bash pkgs.curl ];

  installPhase = ''
    mkdir -p $out/bin

    substitute ${./src/duckdns-script} $out/bin/duckdns-script \
      --replace "#!/usr/bin/env bash" "#!${pkgs.bash}/bin/bash" \
      --replace "curl_cmd=curl" "curl_cmd=${pkgs.curl}/bin/curl"

    chmod +x $out/bin/duckdns-script
  '';
}
