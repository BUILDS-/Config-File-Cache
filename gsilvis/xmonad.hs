import XMonad
import Data.Monoid
import System.Exit
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Scratchpad
import XMonad.Hooks.UrgencyHook
import System.IO 
 


myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore 
    , (className =? "google-chrome" <&&> resource =? "Dialog") --> doFloat
    , title     =? "Dwarf Fortress" --> doFloat
    , scratchpadManageHookDefault
    ]

--myStatusBar = "dzen2 -ta l -h 15"

main = do 
  xmproc <- spawnPipe "xmobar /home/george/.xmobarrc"
--  xmproc <- spawnPipe myStatusBar
--  xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig
  xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig
    { terminal          = "gnome-terminal"
    , focusFollowsMouse = False
    , modMask           = mod4Mask
    , layoutHook        = avoidStruts $ Full ||| (Tall 1 (3/100) (1/2))
    , manageHook        = manageDocks <+> myManageHook
    , logHook           = dynamicLogWithPP $ xmobarPP
        { ppOutput = hPutStrLn xmproc
        , ppTitle  = xmobarColor "green" "" . shorten 50
        }
--    , logHook    = dynamicLogWithPP $ dzenPP
--        { ppCurrent = dzenColor "green" "black" 
--        , ppOutput  = hPutStrLn xmproc
--        }
    } `additionalKeys`
-- lock screen
      [ ((mod4Mask    , xK_x    ), spawn "gnome-screensaver-command --lock")
-- screen capture (full screen, and just active window. Save to ~/Pictures/Captures)
      , ((0           , xK_Print), spawn "scrot -e 'mv $f ~/Pictures/Captures/'")
      , ((controlMask , xK_Print), spawn "scrot -u -e 'mv $f ~/Pictures/Captures/'")
-- Scratchpad function. M-z hides or reveals it.
      , ((mod4Mask    , xK_z    ), scratchpadSpawnActionCustom "gnome-terminal --disable-factory --name scratchpad")
-- the following are for manipulating mpd, the music player daemon, my music player of choice.
      , ((mod4Mask    , xK_equal       ), spawn "mpc volume +5")
      , ((mod4Mask    , xK_minus       ), spawn "mpc volume -5")
      , ((mod4Mask    , xK_backslash   ), spawn "mpc toggle")
      , ((mod4Mask    , xK_bracketleft ), spawn "mpc seek 0%")
      , ((mod4Mask    , xK_bracketright), spawn "mpc next")
      , ((mod4Mask .|. shiftMask, xK_z ), spawn "gnome-terminal -e ncmpcpp") --most. untypable. name. ever.
      ]
