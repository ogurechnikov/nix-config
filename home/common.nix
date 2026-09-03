{ pkgs, ... }:
{
  home.username = "so";
  home.homeDirectory = "/home/so";
  home.stateVersion = "26.05";

  imports = [
    ./apps/emacs.nix
    ./theme/emacs-theme.nix
    ./apps/alacritty.nix
    ./apps/neovim.nix
    ./shell/niri.nix
    ./quickshell.nix
    ./theme/quickshell-theme.nix
    ./shell/git.nix
    ./apps/firefox.nix
    ./apps/fuzzel.nix
    ./theme/stylix-targets.nix
    ./dev.nix
    ./shell/fish.nix
    ./apps/telegram.nix
    ./apps/mpv.nix
    ./apps/yazi.nix
    ./apps/wallpapers.nix
  ];

  programs.home-manager.enable = true;
}
