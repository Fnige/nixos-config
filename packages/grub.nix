{ config, pkgs, ... }:
{
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.grub.useOSProber = true;

  # Looks
  boot.loader.grub.theme = pkgs.stdenv.mkDerivation {
  pname = "distro-grub-themes";
  version = "3.1";
  src = pkgs.fetchFromGitHub {
    owner = "AdisonCavani";
    repo = "distro-grub-themes";
    rev = "v3.1";
    hash = "sha256-ZcoGbbOMDDwjLhsvs77C7G7vINQnprdfI37a9ccrmPs=";
  };
  installPhase = "cp -r customize/nixos $out";
};
}