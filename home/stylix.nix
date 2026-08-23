{ pkgs, ... }:
{
  stylix.enable = true;
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/default-dark.yaml";

  stylix.targets = {
    alacritty.enable = true;
    neovim.enable = true;
    emacs.enable = true;
  };
}
