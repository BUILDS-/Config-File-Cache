import XMonad
import Data.Monoid
import System.Exit
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Scratchpad
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders
import System.IO 
 

myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore 
    , (className =? "google-chrome" <&&> resource =? "Dialog") --> doFloat
    , title     =? "Dwarf Fortress" --> doFloat
    , title     =? "Minecraft Launcher" --> doFloat
    , scratchpadManageHookDefault
    ]

myStatusBar = "dzen2 -x 0 -w 400 -ta l"
myConkyBar = "sleep 1 && conky -c ~/.dzen/.conkydzenrc2 | dzen2 -x 400 -w 460  -ta r"
myOtherConkyBar = "conky -c ~/.dzen/.conkyhelperrc | gdbar -s o -fg red | dzen2 -x 860 -w 90 -ta c"

main = do
  xmproc <- spawnPipe myStatusBar
  bluh <- spawnPipe myConkyBar
  bluh2 <- spawnPipe myOtherConkyBar
  xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig
    { terminal          = "gnome-terminal"
    , focusFollowsMouse = False
    , modMask           = mod4Mask
    , layoutHook        = smartBorders $ avoidStruts $ Full ||| (Tall 1 (3/100) (1/2))
    , manageHook        = manageDocks <+> myManageHook
    , startupHook       = setWMName "LG3D"
    , logHook           = let
        shortenScratchpad x = case x of
          "NSP" -> "N"
          _     -> x
        in dynamicLogWithPP $ dzenPP
          { ppCurrent         = dzenColor "green"   "black" . shortenScratchpad
          , ppUrgent          = dzenColor "yellow"  "red"   . shortenScratchpad
          , ppHidden          = dzenColor "black"   "gray"  . shortenScratchpad
          , ppHiddenNoWindows = dzenColor "gray"    "gray"  . shortenScratchpad
          , ppVisible         = dzenColor "blue"    "black" . shortenScratchpad
          , ppOutput          = hPutStrLn xmproc
          }
    } `additionalKeys`
-- lock screen
      [ ((mod4Mask    , xK_x    ), spawn "gnome-screensaver-command --lock")
-- screen capture (full screen, and just active window. Save to ~/Pictures/Captures)
      , ((0           , xK_Print), spawn "scrot -e 'mv $f ~/Pictures/Captures/'")
      , ((controlMask , xK_Print), spawn "scrot -u -e 'mv $f ~/Pictures/Captures/'")
-- Scratchpad function. M-; hides or reveals it.
      , ((mod4Mask    , xK_semicolon   ), scratchpadSpawnActionCustom "gnome-terminal --disable-factory --name scratchpad")
-- the following are for manipulating mpd, the music player daemon, my music player of choice.
      , ((mod4Mask    , xK_equal       ), spawn "mpc volume +5")
      , ((mod4Mask    , xK_minus       ), spawn "mpc volume -5")
      , ((mod4Mask    , xK_backslash   ), spawn "mpc toggle")
      , ((mod4Mask    , xK_bracketleft ), spawn "mpc seek 0%")
      , ((mod4Mask    , xK_bracketright), spawn "mpc next")
-- the following are for common things that I want to do in a terminal
      , ((mod4Mask .|. shiftMask, xK_z ), spawn "gnome-terminal -e ncmpcpp")
      , ((mod4Mask .|. shiftMask, xK_l ), spawn "gnome-terminal -e alsamixer")
      , ((mod4Mask    , xK_F11         ), spawn "gnome-terminal -e 'vim /home/george/.xmonad/xmonad.hs'")
      ]
