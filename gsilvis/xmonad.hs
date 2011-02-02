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
 

myTerminal      = "gnome-terminal"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myBorderWidth   = 1

myModMask       = mod4Mask

myWorkspaces    = ["1","2","3","4","5","6","7","8","9","SP"]

myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#ff0000"

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm,               xK_p     ), spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")
    , ((modm,               xK_x     ), spawn "gnome-screensaver-command --lock")
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")
    , ((modm .|. shiftMask, xK_c     ), kill)
    , ((modm,               xK_space ), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    , ((modm,               xK_n     ), refresh)
    , ((modm,               xK_Tab   ), windows W.focusDown)
    , ((modm,               xK_j     ), windows W.focusDown)
    , ((modm,               xK_k     ), windows W.focusUp)
    , ((modm,               xK_m     ), windows W.focusMaster)
    , ((modm,               xK_Return), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown)
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp)
    , ((modm,               xK_h     ), sendMessage Shrink)
    , ((modm,               xK_l     ), sendMessage Expand)
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
--  , ((modm              , xK_b     ), sendMessage ToggleStruts)
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
--  , ((modm .|. shiftMask, xK_z     ), spawn "sudo shutdown -h")
--  , ((modm              , xK_z     ), spawn "sudo reboot")
    , ((0                 , xK_Print ), spawn "scrot -e 'mv $f ~/Pictures/Captures/'")
    , ((modm              , xK_Print ), spawn "scrot -u -e 'mv $f ~/Pictures/Captures/'")
    , ((modm              , xK_z     ), scratchpadSpawnActionCustom "gnome-terminal --disable-factory --name scratchpad")
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]

myLayout = Full ||| tiled
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100

myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore 
    , (className =? "google-chrome" <&&> resource =? "Dialog") --> doFloat
    , title     =? "Dwarf Fortress" --> doFloat
    , scratchpadManageHookDefault
    ]

myEventHook = mempty

myStartupHook = return ()


main = do 
  xmproc <- spawnPipe "xmobar /home/george/.xmobarrc"
  xmonad $ defaultConfig {
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
        keys               = myKeys,
        mouseBindings      = myMouseBindings,
        layoutHook         = avoidStruts $ myLayout,
        logHook            = dynamicLogWithPP $ xmobarPP
                               { ppOutput = hPutStrLn xmproc
                               , ppTitle = xmobarColor "green" "" . shorten 50
                               },
        manageHook         = manageDocks <+> myManageHook,
        handleEventHook    = myEventHook,
        startupHook        = myStartupHook
    }
