{ pkgs, ... }:
{
  home.packages = with pkgs; [
    sbcl
    # roswell  # опционально, если понадобится менеджер версий CL
  ];
}
