{ config, lib, ... }:
let
  colors = config.lib.stylix.colors.withHashtag;
  template = builtins.readFile ../../dotfiles/emacs/themes/dynamic-base16-theme.el;
  placeholders = map (name: "{{${name}}}") (builtins.attrNames colors);
  values = builtins.attrValues colors;
  rendered = lib.strings.replaceStrings placeholders values template;
in
{
  home.file.".emacs.d/themes/dynamic-base16-theme.el".text = rendered;
}
