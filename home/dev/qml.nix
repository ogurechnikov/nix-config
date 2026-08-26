{ pkgs, inputs, ... }:
{
  home.packages = [
    inputs.nix-qml-support.packages.${pkgs.system}.tree-sitter-qmljs
    inputs.nix-qml-support.packages.${pkgs.system}.qml-ts-mode
  ];
}
