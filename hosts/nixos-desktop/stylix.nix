{ pkgs, ... }:
{
  stylix.enable = true;
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/default-dark.yaml";
  # stylix.base16Scheme = "default-dark";
 
  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    };
    sizes.terminal = 11;
  };

  stylix.targets = {
    # alacritty.enable = true;
    # neovim.enable = true;
    # fuzzel.enable = true;
  };
}
