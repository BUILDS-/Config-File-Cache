import XMonad
import Data.Monoid
import System.Exit
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO 
 


myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , title     =? "Dwarf Fortress" --> doFloat
    , title     =? "Minecraft Launcher" --> doFloat
    ]

main = do 
  xmproc <- spawnPipe "xmobar /home/mixal/.xmobarrc"
  xmonad $ defaultConfig
    { terminal          = "xfce4-terminal --hide-menubar"
    , focusFollowsMouse = False
    , modMask           = mod4Mask
    , layoutHook        = avoidStruts $ layoutHook defaultConfig
    , manageHook        = manageDocks <+> myManageHook
    , logHook           = dynamicLogWithPP $ xmobarPP
        { ppOutput = hPutStrLn xmproc
        , ppTitle  = xmobarColor "green" "" . shorten 50
        }
    } `additionalKeys`
-- screen capture (full screen, and just active window. Save to ~/Pictures/Captures)
      [ ((0           , xK_Print), spawn "scrot -e 'mv $f ~/Pictures/Captures/'")
      , ((controlMask , xK_Print), spawn "scrot -u -e 'mv $f ~/Pictures/Captures/'")
-- the following are for common things that I want to do in a terminal
      , ((mod4Mask .|. shiftMask, xK_z ), spawn "xfce4-terminal -e ncmpcpp")
      , ((mod4Mask .|. shiftMask, xK_l ), spawn "xfce4-terminal -e alsamixer")
      , ((mod4Mask    , xK_F11         ), spawn "xfce4-terminal -e 'vim /home/mixal/.xmonad/xmonad.hs'")
-- Volume control
      , ((mod4Mask    , xK_F7 	       ), spawn "amixer set Master 10-+ > /dev/null")
      , ((mod4Mask    , xK_F8 	       ), spawn "amixer set Master 10%+ > /dev/null")
      , ((mod4Mask    , xK_F9 	       ), spawn "amixer set Master 0% > /dev/null")
-- lock screen
      , ((mod4Mask    , xK_x           ), spawn "xscreensaver-command --lock")
      ]
