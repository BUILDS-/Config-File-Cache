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
  xmproc <- spawnPipe "xmobar /home/george/.xmobarrc"
  xmonad $ defaultConfig
    { terminal          = "terminal"
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
-- the following are for manipulating mpd, the music player daemon, my music player of choice
      , ((mod4Mask    , xK_equal       ), spawn "ncmpcpp volume +5")
      , ((mod4Mask    , xK_minus       ), spawn "ncmpcpp volume -5")
      , ((mod4Mask    , xK_backslash   ), spawn "mpc -h \"/var/lib/mpd/socket\" toggle")
      , ((mod4Mask    , xK_bracketleft ), spawn "ncmpcpp seek 0%")
      , ((mod4Mask    , xK_bracketright), spawn "ncmpcpp next")
-- the following are for common things that I want to do in a terminal
      , ((mod4Mask .|. shiftMask, xK_z ), spawn "terminal -e ncmpcpp")
      , ((mod4Mask .|. shiftMask, xK_l ), spawn "terminal -e alsamixer")
      , ((mod4Mask    , xK_F11         ), spawn "terminal -e 'vim /home/george/.xmonad/xmonad.hs'")
      ]
