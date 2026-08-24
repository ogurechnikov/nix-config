{ pkgs, ... }:
{
  home.username = "so";
  home.homeDirectory = "/home/so";
  home.stateVersion = "26.05";

  imports = [
    ./emacs.nix
    ./alacritty.nix
    ./neovim.nix
    ./niri.nix
    ./quickshell.nix
    ./git.nix
    ./firefox.nix
    ./vpn
  ];

  programs.home-manager.enable = true;
}
