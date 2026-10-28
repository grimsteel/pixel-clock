{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  ch554_sdcc_src = fetchFromGitHub {
    owner = "Blinkinlabs";
    repo = "ch554_sdcc";
    rev = "6d7aa8f351877eb709484b30cac5af3f7a375b2d";
    hash = "sha256-w1YdpEgaiNz85xc+88uz+ejUYLjdBqQIbvIOI29OCDQ=";
    # `include` is all that is needed to build
    sparseCheckout = ["include" "examples"];
  };
in
mkShell {
  CH554_SDCC_PATH = "${ch554_sdcc_src}/include";
  SDCC_INCLUDE_FLAGS = "-I${sdcc}/share/sdcc/include";
  buildInputs = [
    gnumake
    sdcc
    wchisp
  ];
}
