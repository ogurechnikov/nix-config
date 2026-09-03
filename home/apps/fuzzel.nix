{ pkgs, lib, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "alacritty";
        layer = "overlay";
        width = 60;
        lines = 8;
        horizontal-pad = 24;
        vertical-pad = 16;
        inner-pad = 12;
        font = lib.mkForce "JetBrainsMono Nerd Font:size=16";
        icon-theme = "Adwaita";
        icons-enabled = true;
        dpi-aware = "auto";
      };
      border = {
        width = 0;
        radius = 16;
      };
    };
  };
}
