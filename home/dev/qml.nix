{ pkgs, inputs, ... }:
let
  qmljsGrammar = inputs.nix-qml-support.packages.${pkgs.system}.tree-sitter-qmljs;
in
{
  home.packages = [
    qmljsGrammar
    inputs.nix-qml-support.packages.${pkgs.system}.qml-ts-mode
    pkgs.qt6.qtdeclarative
  ];

  home.file.".emacs.d/tree-sitter/libtree-sitter-qmljs.so".source = "${qmljsGrammar}/parser";
}
