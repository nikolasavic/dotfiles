Config {
         font = "xft:Ubuntu Nerd Font:weight=bold:pixelsize=16:antialias=true:hinting=true"
       , additionalFonts = []
       , borderColor = "black"
       , border = TopB
       , bgColor = "#2f1e2e"
       , fgColor = "#a39e9b"
       , alpha = 255
       , position = Top
       , textOffset = -1
       , iconOffset = -1
       , lowerOnStart = True
       , pickBroadest = False
       , persistent = False
       , hideOnStart = False
       , iconRoot = "/home/nikola/.config/xpm/"
       , allDesktops = True
       , overrideRedirect = True
       , commands = [
                      Run Cpu [ "--template", "   <fn=0>\xe238</fn>    Cpu:<total>" ] 10

                    , Run Memory [ "--template","Mem: <usedratio>%" ] 10

                    , Run Date "<fn=0>\xf073</fn> %_W  %a %b %_d %Y   %I:%M:%S %p  <fn=0>\xfbae</fn>" "date" 10

                    , Run Com "/home/nikola/.local/bin/pacman/num-updates.sh" [] "pacupdate" 36000
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %cpu%   %memory% }\
                    \{ %date% : %pacupdate%   "
       }
