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
        keys               =           
          \conf@(XConfig {XMonad.modMask = modm}) -> 
            M.fromList $
              [ ((modm .|. shiftMask, xK_Return), spawn "xfce4-terminal")
              , ((modm,               xK_Return), spawn "xfce4-terminal -x emacsclient -nw")
              , ((modm,               xK_space     ), spawn "exe=`dmenu_path | dmenu -fn Terminus` && eval \"exec $exe\"")
              , ((modm,               xK_x     ), spawn "xscreensaver-command --lock")
              , ((modm .|. shiftMask, xK_x     ), spawn "xfce4-terminal -x bash -c \"su -c /home/frozencemetery/script.sh\" ")
--              , ((modm .|. shiftMask, xK_x     ), spawn "xfce4-terminal -x bash -c \"sudo -k sleep 0 && xscreensaver-command --lock && sudo pm-suspend\"") -- 
              , ((modm .|. shiftMask, xK_z     ), spawn "xfce4-terminal -x bash -c \"su -c reboot\"") --
              , ((modm              , xK_z     ), spawn "xfce4-terminal -x bash -c \"su -c poweroff\"")
              , ((modm .|. shiftMask, xK_space     ), spawn "gmrun")                
              , ((0,                  0x1008ff16   ), spawn "ncmpcpp prev")
              , ((0,                  0x1008ff17   ), spawn "ncmpcpp next")
              , ((0,                  0x1008ff14   ), spawn "ncmpcpp toggle")
              , ((modm              , 0x1008ff16 ), spawn "ncmpcpp pause")
              , ((modm              , 0x1008ff17), spawn "ncmpcpp play")
              , ((modm              , 0x1008ff14), spawn "xfce4-terminal -x alsamixer")
              , ((modm .|. shiftMask, 0x1008ff16 ), spawn "ncmpcpp prev")
              , ((modm .|. shiftMask, 0x1008ff17), spawn "ncmpcpp next")
              , ((modm .|. shiftMask, 0x1008ff14), spawn "xfce4-terminal -x ncmpcpp")
              
              , ((modm .|. shiftMask, xK_c     ), kill)
              , ((modm,               xK_s     ), sendMessage NextLayout)
              , ((modm .|. shiftMask, xK_s     ), setLayout $ XMonad.layoutHook conf)                
              , ((modm,               xK_n     ), refresh)
              , ((modm,               xK_Tab   ), windows W.focusDown)
              , ((modm .|. shiftMask, xK_Tab   ), windows W.swapDown)
              , ((modm,               xK_quoteleft     ), windows W.focusUp)
              , ((modm .|. shiftMask, xK_quoteleft     ), windows W.swapUp)
              , ((modm,               xK_m     ), windows W.focusMaster)
              , ((modm .|. shiftMask, xK_f), windows W.swapMaster)
              , ((modm,               xK_h     ), sendMessage Shrink)
              , ((modm,               xK_l     ), sendMessage Expand)
              , ((modm,               xK_j     ), sendMessage MirrorShrink)
              , ((modm,               xK_k     ), sendMessage MirrorExpand)
              , ((modm,               xK_t     ), withFocused $ windows . W.sink)
              , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
              , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
              , ((modm              , xK_b     ), sendMessage ToggleStruts)
              , ((modm .|. shiftMask, xK_q     ), do
                    spawn "killall -g .mpdmonitor.sh"
                    io (exitWith ExitSuccess))
              , ((modm              , xK_q     ), spawn "killall -g .mpdmonitor.sh; xmonad --recompile && xmonad --restart")
              , ((modm              , xK_a           ), sendMessage $ Toggle MIRROR)
              , ((modm              , xK_f           ), sendMessage $ Toggle FULL)
              , ((modm .|. shiftMask, xK_slash       ), spawn "xfce4-terminal -x less /usr/share/X11/locale/en_US.UTF-8/Compose")
--              , ((0                 , xK_Print ), spawn "scrot -e 'mv $f ~/Pictures/Captures/'")
--              , ((modm              , xK_Print ), spawn "scrot -u -e 'mv $f ~/Pictures/Captures/'")
              ]
              ++
              [((m .|. modm, k), windows $ f i)
              | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_9] ++ [xK_0])
              , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
              ++
              [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
              | (key, sc) <- zip [xK_y, xK_u, xK_i] [0..]
              , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]],
        mouseBindings      = 
          \XConfig {XMonad.modMask = modm} -> 
            M.fromList $
              [ ((modm, button1), (\w -> focus w 
                                         >> mouseMoveWindow w
                                         >> windows W.shiftMaster))
              , ((modm, button2), (\w -> focus w 
                                         >> windows W.shiftMaster))
              , ((modm, button3), (\w -> focus w 
                                         >> mouseResizeWindow w
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
			       , ppLayout  = \a -> ( 
                                   case a of
                                     "Full" -> "ƒ"
                                     "Grid" -> "g"
                                     "Mirror Grid" -> "G"
                                     "ResizableTall" -> "t"
                                     "Mirror ResizableTall" -> "T"
                                     _ -> a)
                               },
        manageHook         = manageDocks <+> (
          composeAll
          [ className =? "MPlayer"        --> doFloat
          , resource  =? "desktop_window" --> doIgnore
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
          spawn "xfce4-terminal -x bash -c \"fortune -a | cowsay && bash\""
    }
