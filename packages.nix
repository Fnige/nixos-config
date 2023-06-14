{ config, pkgs, ... }:

let
  # Unstable Package Config
  baseconfig = { allowUnfree = true; };
  unstable = import <nixos-unstable> { config = baseconfig; };
in {
  # Stable Package Config
  nixpkgs.config.allowUnfree = true;

  # Packages
  environment.systemPackages = with pkgs; [
    firefox
    unstable.vscode
    unstable.spotify
    unstable.vivaldi
    unstable.jetbrains.idea-community
    unstable.obsidian
    unstable.git
    (unstable.discord.override { withVencord = true; withOpenASAR = true; })
    unstable.xdg-utils
    neofetch
    unstable.blockbench-electron
    flite
  ];
}

# NOTE: It is probably possible to combine the config of the stable and unstable packages, dont really feel like it though