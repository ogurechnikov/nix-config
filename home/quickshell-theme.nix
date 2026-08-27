{ config, lib, ... }:
let
  colors = config.lib.stylix.colors.withHashtag;
  template = builtins.readFile ../dotfiles/quickshell/Colors.qml.template;
  placeholders = map (name: "{{${name}}}") (builtins.attrNames colors);
  values = builtins.attrValues colors;
  rendered = lib.strings.replaceStrings placeholders values template;
in
{
  home.file.".config/quickshell/Colors.qml" = {
    text = rendered;
    force = true;
  };
}
