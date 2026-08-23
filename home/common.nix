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
    ./stylix.nix
  ];

  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;
}
