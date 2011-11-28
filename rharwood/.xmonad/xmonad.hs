import XMonad
import Data.Monoid
import System.Exit
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO 

--

import XMonad.Layout.NoBorders
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import XMonad.Layout.Grid
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.ResizableTile
import XMonad.Hooks.UrgencyHook

spawnterm :: String -> X ()
spawnterm = spawn . ("xfce4-terminal -x sh -c 'sleep .05; " ++) . (++ "'")

mpc :: String -> X ()
mpc = spawn . ("MPD_HOST=/home/frozencemetery/.mpd/socket mpc " ++)

main = do 
  xmproc <- spawnPipe "xmobar"
  xmonad $ withUrgencyHook NoUrgencyHook defaultConfig {
    terminal = "xfce4-terminal",
    focusFollowsMouse = False,
    borderWidth = 1,
    modMask = mod4Mask,
    workspaces = ["1","2","3","4","5","6","7","8","9","0"],
    normalBorderColor = "#000000",
    focusedBorderColor = "#00ff00",
    keys =           
      \conf@(XConfig {XMonad.modMask = modm}) -> 
      M.fromList $
      [ ((modm, xK_Return), spawnterm "emacsclient -nw -e \"(eshell)\"")
      , ((modm .|. shiftMask, xK_Return), spawnterm "bash")
      , ((modm, xK_space), spawn $ 
                            "exe=`dmenu_path | dmenu -fn Terminus`" 
                            ++ " && " ++ 
                            "eval \"exec $exe\""
        )
      , ((modm, xK_x), spawn "xscreensaver-command --lock")
      , ((modm .|. shiftMask, xK_x), spawn "killall vlock-main")
      , ((modm .|. shiftMask, xK_z), spawnterm "su -c reboot")
      , ((modm              , xK_z), spawnterm "su -c poweroff")
      , ((modm .|. shiftMask, xK_space), spawn "gmrun")
        
      , ((modm .|. shiftMask, 0x1008ff16), mpc "prev")
      , ((modm .|. shiftMask, 0x1008ff17), mpc "clear")
      , ((modm .|. shiftMask, 0x1008ff14), spawnterm "ncmpcpp")
      , ((modm , 0x1008ff16), mpc "pause")
      , ((modm , 0x1008ff17), mpc "play")
      , ((modm , 0x1008ff14), spawnterm "alsamixer")
        
      , ((modm , xK_i), spawn "xcalib -i -a")
        
      , ((modm .|. shiftMask, xK_c), kill)
      , ((modm, xK_s), sendMessage NextLayout)
      , ((modm .|. shiftMask, xK_s), setLayout $ XMonad.layoutHook conf)
      , ((modm, xK_n), refresh)
      , ((modm, xK_Tab), windows W.focusDown)
      , ((modm .|. shiftMask, xK_Tab), windows W.swapDown)
      , ((modm, xK_quoteleft), windows W.focusUp)
      , ((modm .|. shiftMask, xK_quoteleft), windows W.swapUp)
      , ((modm, xK_m), windows W.focusMaster)
      , ((modm .|. shiftMask, xK_f), windows W.swapMaster)
      , ((modm, xK_h), sendMessage Shrink)
      , ((modm, xK_l), sendMessage Expand)
      , ((modm, xK_j), sendMessage MirrorShrink)
      , ((modm, xK_k), sendMessage MirrorExpand)
      , ((modm, xK_t), withFocused $ windows . W.sink)
      , ((modm, xK_comma), sendMessage (IncMasterN 1))
      , ((modm , xK_period), sendMessage (IncMasterN (-1)))
      , ((modm , xK_b), sendMessage ToggleStruts)
      , ((modm .|. shiftMask, xK_q), do
            spawn "killall -g .mpdmonitor.sh"
            io (exitWith ExitSuccess)
        )
      , ((modm, xK_q), spawn $ 
                       "killall -g .mpdmonitor.sh" 
                       ++ "; " ++ 
                       "xmonad --recompile" 
                       ++ " && " ++ 
                       "xmonad --restart"
        )
      , ((modm, xK_a), sendMessage $ Toggle MIRROR)
      , ((modm, xK_f), sendMessage $ Toggle FULL)
      , ((modm .|. shiftMask, xK_slash), 
         spawnterm "less /usr/share/X11/locale/en_US.UTF-8/Compose"
        )
        -- , ((0 , xK_Print ), spawn "scrot -e 'mv $f ~/Pictures/Captures/'")
        -- , ((modm , xK_Print ), 
        --    spawn "scrot -u -e 'mv $f ~/Pictures/Captures/'")
      ]
      ++
      [((m .|. modm, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_9] ++ [xK_0])
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
      ]
    ,
    --              ++
    -- todo: I had a very nice screen configuration bound to m4-C-<numbers> 
    -- that I would like back
    -- [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
    --               | (key, sc) <- zip [xK_y, xK_u, xK_i] [0..]
    --               , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]],
    mouseBindings = 
      \XConfig {XMonad.modMask = modm} -> 
      M.fromList $
      [ ((modm, button1), (\w -> focus w
                                 >> mouseMoveWindow w
                                 >> windows W.shiftMaster
                          )
        )
      , ((modm, button2), (\w -> focus w
                                 >> mouseResizeWindow w
                                 >> windows W.shiftMaster
                          )
        )
      , ((modm, button3), (\w -> focus w 
                                 >> windows W.shiftMaster
                          )
        )
      ]
    ,
    layoutHook = avoidStruts $ 
                 smartBorders $ 
                 mkToggle (single FULL) . mkToggle (single MIRROR) $ 
                 ResizableTall 1 (3/100) (1/2) [] ||| Grid,
      logHook = dynamicLogWithPP $ xmobarPP {
        ppOutput = hPutStrLn xmproc, 
        ppTitle = \a -> "", 
        ppSep = " ", 
        ppUrgent = xmobarColor "orange" "black" . xmobarStrip, 
        ppLayout  = \a -> 
          case a of
            "Full" -> "ƒ"
            "Grid" -> "g"
            "Mirror Grid" -> "G"
            "ResizableTall" -> "t"
            "Mirror ResizableTall" -> "T"
            _ -> a
        }
    ,
    manageHook = manageDocks <+> (
      composeAll
      [ className =? "MPlayer" --> doFloat
      , resource =? "desktop_window" --> doIgnore
      , resource =? "Dialog" --> doFloat
      , title =? "Pidgin" --> doFloat
      ]
      )
    ,
    handleEventHook = mempty,
    startupHook = do
      spawnterm "fortune -a | cowsay -n && bash"
    }
