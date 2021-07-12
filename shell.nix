{ pkgs ? import <nixpkgs> { } }:
let
  pythonPackages = pkgs.python27Packages;
  python = pkgs.python27;
  ristretto = pkgs.callPackage ./default-challenge-bypass-ristretto-ffi.nix { };
  challenge-bypass-ristretto = pythonPackages.callPackage ./python-challenge-bypass-ristretto.nix {
    inherit ristretto;
  };
in
  (python.withPackages (ps: [ challenge-bypass-ristretto ])).env
