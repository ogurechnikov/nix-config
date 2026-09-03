{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };

  home.file.".emacs.d/init.el".source = ../../dotfiles/emacs/init.el;
}
