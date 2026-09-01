{ pkgs, ... }:
{
  home.username = "so";
  home.homeDirectory = "/home/so";
  home.stateVersion = "26.05";

  imports = [
    ./emacs.nix
    ./emacs-theme.nix
    ./alacritty.nix
    ./neovim.nix
    ./niri.nix
    ./quickshell.nix
    ./quickshell-theme.nix
    ./git.nix
    ./firefox.nix
    ./fuzzel.nix
    ./stylix-targets.nix
    ./dev.nix
    ./fish.nix
    ./telegram.nix
    ./mpv.nix
  ];

  programs.home-manager.enable = true;
}
