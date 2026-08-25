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
    ./git.nix
    ./firefox.nix
    ./fuzzel.nix
    ./stylix-targets.nix
    ./dev.nix
  ];

  programs.home-manager.enable = true;
}
