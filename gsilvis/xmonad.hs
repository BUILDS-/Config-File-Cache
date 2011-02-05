import XMonad
import Data.Monoid
import System.Exit
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Scratchpad
import System.IO 

import qualified XMonad.StackSet as W
import qualified Data.Map        as M
 
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore 
    , (className =? "google-chrome" <&&> resource =? "Dialog") --> doFloat
    , title     =? "Dwarf Fortress" --> doFloat
    , scratchpadManageHookDefault
    ]

main = do 
  xmproc <- spawnPipe "xmobar /home/george/.xmobarrc"
  xmonad $ defaultConfig {
        terminal           = "gnome-terminal",
        modMask            = mod4Mask,
        layoutHook         = avoidStruts $ Full ||| (Tall 1 (1/2) (3/100)),
        logHook            = dynamicLogWithPP $ xmobarPP
                               { ppOutput = hPutStrLn xmproc
                               , ppTitle = xmobarColor "green" "" . shorten 50
                               },
        manageHook         = manageDocks <+> myManageHook
    } `additionalKeys` [
        ((mod4Mask    , xK_x    ), spawn "gnome-screensaver-command --lock"),
        ((0           , xK_Print), spawn "scrot -e 'mv $f ~/Pictures/Captures/'"),
        ((controlMask , xK_Print), spawn "scrot -u -e 'mv $f ~/Pictures/Captures/'"),
        ((mod4Mask    , xK_z    ), scratchpadSpawnActionCustom "gnome-terminal --disable-factory --name scratchpad")
    ]
