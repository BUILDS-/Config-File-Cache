import XMonad
import Data.Monoid
import System.Exit
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Scratchpad
import System.IO 
import XMonad.Layout.NoBorders
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import XMonad.Layout.Grid
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.ResizableTile


main = do 
  xmproc <- spawnPipe "xmobar"
  xmonad $ defaultConfig {
        terminal           = "xfce4-terminal",
        focusFollowsMouse  = False,
        borderWidth        = 1,
        modMask            = mod4Mask,
        workspaces         = ["1","2","3","4","5","6","7","8","9","0"],
        normalBorderColor  = "#000000",
        focusedBorderColor = "#00ff00",
        keys               = \conf@(XConfig {XMonad.modMask = modm}) -> M.fromList $
                                                                        [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
                                                                        , ((modm,               xK_p     ), spawn "exe=`dmenu_path | dmenu -fn Terminus` && eval \"exec $exe\"")
                                                                        , ((modm,               xK_x     ), spawn "gnome-screensaver-command --lock")
                                                                        , ((modm .|. shiftMask, xK_x     ), spawn "gksudo sleep 0; gnome-screensaver-command --lock; sudo pm-suspend") -- I need to have root for the pm-suspend command, and I can't call the screensaver lock command as root.
                                                                        , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")
                                                                        , ((modm .|. shiftMask, xK_c     ), kill)
                                                                        , ((modm,               xK_space ), sendMessage NextLayout)
                                                                        , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
                                                                        , ((modm,               xK_n     ), refresh)
                                                                        , ((modm,               xK_Tab   ), windows W.focusDown)
                                                                        , ((modm .|. shiftMask, xK_Tab   ), windows W.swapDown)
                                                                        , ((modm,               xK_quoteleft     ), windows W.focusUp)
                                                                        , ((modm .|. shiftMask, xK_quoteleft     ), windows W.swapUp)
--                                                                        , ((modm,               xK_j     ), windows W.focusDown)
--                                                                        , ((modm,               xK_k     ), windows W.focusUp)
                                                                        , ((modm,               xK_m     ), windows W.focusMaster)
                                                                        , ((modm,               xK_Return), windows W.swapMaster)
--                                                                        , ((modm .|. shiftMask, xK_j     ), windows W.swapDown)
--                                                                        , ((modm .|. shiftMask, xK_k     ), windows W.swapUp)
                                                                        , ((modm,               xK_h     ), sendMessage Shrink)
                                                                        , ((modm,               xK_l     ), sendMessage Expand)
                                                                        , ((modm,               xK_j     ), sendMessage MirrorShrink)
                                                                        , ((modm,               xK_k     ), sendMessage MirrorExpand)
                                                                        , ((modm,               xK_t     ), withFocused $ windows . W.sink)
                                                                        , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
                                                                        , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
--                                                                        , ((modm              , xK_b     ), sendMessage ToggleStruts)
                                                                        , ((modm .|. shiftMask, xK_q     ), do
                                                                              spawn "killall -g .mpdmonitor.sh"
                                                                              io (exitWith ExitSuccess))
                                                                        , ((modm              , xK_q     ), spawn "killall -g .mpdmonitor.sh; xmonad --recompile && xmonad --restart")
                                                                        , ((modm .|. shiftMask, xK_z     ), spawn "gksu 'shutdown -h now'")
                                                                        , ((modm              , xK_z     ), spawn "gksu reboot")
                                                                        , ((modm              , xK_bracketleft ), spawn "ncmpcpp pause")
                                                                        , ((modm              , xK_bracketright), spawn "ncmpcpp play")
                                                                        , ((modm              , xK_backslash   ), spawn "ncmpcpp toggle")
                                                                        , ((modm .|. shiftMask, xK_backslash   ), spawn "xfce4-terminal -x ncmpcpp")
                                                                        , ((modm .|. shiftMask, xK_bracketright), spawn "ncmpcpp next")
                                                                        , ((modm .|. shiftMask, xK_bracketleft ), spawn "ncmpcpp prev")
                                                                        , ((modm              , xK_a           ), sendMessage $ Toggle MIRROR)
                                                                        , ((modm              , xK_f           ), sendMessage $ Toggle FULL)
--                                                                        , ((0                 , xK_Print ), spawn "scrot -e 'mv $f ~/Pictures/Captures/'")
--                                                                        , ((modm              , xK_Print ), spawn "scrot -u -e 'mv $f ~/Pictures/Captures/'")
--                                                                        , ((modm              , xK_z     ), scratchpadSpawnActionCustom "xfce4-terminal --disable-server --name scratchpad")
--                                                                        , ((modm .|. shiftMask, xK_d     ), spawn "xfce4-terminal -e ~robbie/.getmail/script.sh")
                                                                        ]
                                                                        ++
                                                                        [((m .|. modm, k), windows $ f i)
                                                                        | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_9] ++ [xK_0])
                                                                        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
                                                                        ++
                                                                        [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
                                                                        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
                                                                        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]],
        mouseBindings      = \XConfig {XMonad.modMask = modm} -> M.fromList $
                                                                 [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                                                                                    >> windows W.shiftMaster))
                                                                 , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
                                                                 , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                                                                                    >> windows W.shiftMaster))
                                                                 ],
        layoutHook         = id 
                             . avoidStruts 
                             $ smartBorders 
                             $ ( -- operator precedence?  Just one of many free services we offer.
                               mkToggle (single FULL)
                               . mkToggle (single MIRROR)           
                               $ ResizableTall 1 (3/100) (1/2) [] ||| Grid
                               ),
        logHook            = dynamicLogWithPP $ xmobarPP
                               { ppOutput = hPutStrLn xmproc
			       , ppTitle = \_ -> ""
			       , ppSep = " "
			       , ppLayout = \a -> (case a of
                                 "Full" -> "ƒ"
                                 "Grid" -> "g"
                                 "Mirror Grid" -> "G"
                                 "ResizableTall" -> "t"
                                 "Mirror ResizableTall" -> "T"
                                 _ -> a
                                 )
			       },
        manageHook         = manageDocks <+> (
          composeAll
          [ className =? "MPlayer"        --> doFloat
          , resource  =? "desktop_window" --> doIgnore
          , resource  =? "kdesktop"       --> doIgnore
          , resource  =? "Dialog"         --> doFloat
          , title     =? "Pidgin"         --> doFloat
          , title     =? "CS480/CS680"    --> doFloat
--        , (className =? "google-chrome" <&&> resource =? "Dialog") --> doFloat -- note: this is a relic of the config I pulled from; I refuse to use chrome and anything else made by google
--        , title     =? "Dwarf Fortress" --> doFloat
          , scratchpadManageHookDefault
          ]
          ),
        handleEventHook    = mempty,
        startupHook        = do
          spawn "xfce4-terminal"
    }
