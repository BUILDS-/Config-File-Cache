import XMonad
import Data.Monoid
import System.Exit
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import System.IO
import qualified XMonad.Util.Loggers as L
import XMonad.Layout.NoBorders
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import XMonad.Layout.Grid
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.ResizableTile
import XMonad.Layout.PerWorkspace
import XMonad.Hooks.UrgencyHook

spawnterm :: String -> X ()
spawnterm = \x -> spawn("xfce4-terminal -x sh -c 'sleep .05; exec " ++ x ++ "'")

mpc :: String -> X ()
mpc = \x -> spawn("MPD_HOST=/home/frozencemetery/.mpd/socket mpc " ++ x)

asroot :: String -> X ()
asroot = \x -> spawnterm("su -c '" ++ x ++ "'")

widthdelta :: Rational
widthdelta = 3/100

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ withUrgencyHook NoUrgencyHook defaultConfig {
    terminal = "xfce4-terminal",
    focusFollowsMouse = False,
    borderWidth = 1,
    modMask = mod4Mask,
    workspaces = ["1","2","3","4","5","6","7","8","9","0"],
    normalBorderColor = "#000000",
    focusedBorderColor = "#ff7228",
    keys =          
      \conf@(XConfig {XMonad.modMask = modm}) ->
      M.fromList $
      [ ((modm, xK_Return), spawnterm "emacsclient -nw -e \"(eshell)\"")
      , ((modm .|. shiftMask, xK_Return), spawnterm "bash")
      , ((modm, xK_space), 
         spawn "exec \"$(dmenu_path | dmenu -fn Terminus -nb black -nf grey -sb orange -sf black -p cmd:)\""
        )
      , ((modm .|. shiftMask, xK_space), spawn "gmrun")
        
      , ((modm, xK_x), spawn "xscreensaver-command --lock")
      , ((modm .|. shiftMask, xK_x), spawn "killall vlock-main")
      , ((modm .|. shiftMask, xK_z), asroot "reboot")
      , ((modm, xK_z), asroot "poweroff")
       
      , ((modm .|. shiftMask, 0x1008ff16), mpc "prev")
      , ((modm .|. shiftMask, 0x1008ff17), mpc "clear")
      , ((modm .|. shiftMask, 0x1008ff14), spawnterm "ncmpcpp")
      , ((modm, 0x1008ff16), mpc "pause")
      , ((modm, 0x1008ff17), mpc "play")
      , ((modm, 0x1008ff14), spawnterm "alsamixer")
        
      , ((modm .|. shiftMask, xK_u), spawnterm "emacsclient -nw -e \"(notmuch)\"")
      , ((modm              , xK_w), spawnterm "emacsclient -nw $(mktemp)")
      , ((modm .|. shiftMask, xK_a), spawnterm "htop")
      , ((modm              , xK_d), spawn "pgrep trayer && killall trayer || trayer &")
        
      , ((modm, xK_i), spawn "xcalib -i -a")
       
      , ((modm .|. shiftMask, xK_c), kill)
      , ((modm, xK_s), sendMessage NextLayout)
      , ((modm .|. shiftMask, xK_s), setLayout $ XMonad.layoutHook conf)
      , ((modm, xK_r), refresh)
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
      , ((modm, xK_period), sendMessage (IncMasterN (-1)))
      , ((modm, xK_b), sendMessage ToggleStruts)
      , ((modm, xK_v), spawn "echo \"\" | xsel -i && echo \"\" | xsel -ib")
      , ((modm, xK_q), do
         spawn "killall -g .mpdmonitor.sh"
         spawn "killall -g .alsamonitor.sh"
         spawn $
           "xmonad --recompile"
           ++ " && " ++
           "xmonad --restart"
        )
      , ((modm, xK_a), sendMessage $ Toggle MIRROR)
      , ((modm, xK_f), sendMessage $ Toggle FULL)
      , ((modm .|. shiftMask, xK_slash),
         spawnterm "less /usr/share/X11/locale/en_US.UTF-8/Compose"
        )
      ]
      ++
      [((m .|. modm, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_9] ++ [xK_0])
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
      ]
      ++
      [((m .|. modm .|. mod1Mask, key), screenWorkspace sc >>= flip whenJust (windows . f))
      | (key, sc) <- zip [xK_1, xK_2, xK_3, xK_4, xK_5, xK_6, xK_7, xK_8, xK_9, xK_0] [0..]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]],
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
                 onWorkspace "0" (ResizableTall 1 (widthdelta) (4/5) []) $
                 onWorkspace "1" (ResizableTall 1 (widthdelta) (1/5) []) $
                 (ResizableTall 1 (widthdelta) (1/2) []) ||| Grid,
    logHook = dynamicLogWithPP $ xmobarPP {
      ppCurrent = xmobarColor "" "orange" . xmobarStrip,
      ppVisible = xmobarColor "" "white" . xmobarStrip,
      ppWsSep = "",
      ppHidden = xmobarColor "black" "grey" . xmobarStrip,
      ppHiddenNoWindows = id,
      ppUrgent = xmobarColor "orange" "black" . xmobarStrip,
      ppSep = " ",
      ppTitle = const "",
      ppLayout  = \a -> case a of
        "Full" -> "ƒ"
        "Grid" -> "g"
        "Mirror Grid" -> "G"
        "ResizableTall" -> "t"
        "Mirror ResizableTall" -> "T"
        _ -> a,
      ppExtras = [L.loadAvg, L.logCmd "echo \"| $(notmuch count tag:inbox):$(notmuch count tag:unread)\""],
      ppOrder = \[workspaces, layout, title, average, mail] -> [average ++ " |", workspaces, layout, title, mail],
      ppOutput = hPutStrLn xmproc
      }
    ,
    manageHook = manageDocks <+> (
      composeAll
      [ className =? "MPlayer" --> doFloat
      , resource =? "Dialog" --> doFloat
      , title =? "Pidgin" --> doFloat
      , title =? "Dwarf Fortress" --> doFloat
      , title =? "QEMU" --> doFloat -- this doesn't work
      , className =? "Pidgin" --> doShift "1"
      , className =? "Iceweasel" --> doShift "2"
      ]
      )
    ,
    handleEventHook = mempty,
    startupHook = do
      spawnterm $
        "fortune -a | cowsay -n"
        ++ " && " ++
        "bash"
    }
