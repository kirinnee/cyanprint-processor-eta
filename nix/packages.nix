{ pkgs, atomi, atomi_classic, pkgs-2305, pkgs-nov-08-23 }:
let
  all = {
    atomipkgs_classic = (
      with atomi_classic;
      {
        inherit
          sg;
      }
    );
    atomipkgs = (
      with atomi;
      {
        inherit
          infisical
          pls;
      }
    );
    nix-2305 = (
      with pkgs-2305;
      {
        inherit
          hadolint;
      }
    );
    nov-08-23 = (
      with pkgs-nov-08-23;
      {
        inherit bun
          coreutils
          findutils
          sd
          bash
          git
          yq-go
          jq

          # lint
          treefmt
          gitlint
          shellcheck

          #infra
          docker;
      }
    );
  };
in
with all;
atomipkgs //
atomipkgs_classic //
nix-2305 //
nov-08-23
