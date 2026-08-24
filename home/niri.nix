{ pkgs, config, ... }:
let
  homeDir = config.home.homeDirectory;
in
{
  home.file.".config/niri/config.kdl".text = ''
    spawn-at-startup "quickshell" "-c" "${homeDir}/.config/quickshell/shell.qml"

    input {
        keyboard {
            xkb {
                layout "us,ru"
                options "grp:alt_shift_toggle"
            }
        }
    }

    binds {
        Mod+Return { spawn "alacritty"; }
        Mod+Q { close-window; }
    }
  '';
}
