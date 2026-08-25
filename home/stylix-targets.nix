{ pkgs, ... }:
{
  stylix.targets = {
    alacritty.enable = true;
    neovim.enable = true;
    fuzzel.enable = true;
    firefox = {
      enable = true;
      profileNames = [ "default" ];
    };
  };
}
