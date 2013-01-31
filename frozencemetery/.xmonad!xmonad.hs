import Data.Monoid
import System.Exit
import System.IO

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Layout.NoBorders
import XMonad.Layout.Grid
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.ResizableTile
import XMonad.Layout.PerWorkspace
import XMonad.Hooks.UrgencyHook
import XMonad.Util.EZConfig

import qualified Data.Map as M
import qualified XMonad.StackSet as W
import qualified XMonad.Util.Loggers as L

spawnterm :: String -> X ()
spawnterm x = spawn("urxvtcd -e " ++ x)

suckterm :: String -> X()
suckterm x = spawn("urxvt -e sh -c 'sleep .07; exec " ++ x ++ "'")

mpc :: String -> X ()
mpc = \x -> spawn("MPD_HOST=/home/frozencemetery/.mpd/socket mpc " ++ x)

asroot :: String -> X ()
asroot = \x -> spawnterm("su -c '" ++ x ++ "'")

widthdelta :: Rational
widthdelta = 3/100

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ withUrgencyHook NoUrgencyHook defaultConfig 
           { terminal = "urxvtcd"
           , focusFollowsMouse = False
           , borderWidth = 1
           , modMask = mod4Mask
           , workspaces = ["1","2","3","4","5","6","7","8","9","0"]
           , normalBorderColor = "#000000"
           , focusedBorderColor = "#ff7228"
           , keys =          
             \conf@(XConfig {XMonad.modMask = modm}) ->
               (mkKeymap conf $
                [ ("M-S-<Return>", spawn $ terminal conf)
                , ("M-S-c", kill)
                , ("M-S-<Space>", spawn "gmrun")
                , ("M-,", sendMessage $ IncMasterN 1)
                , ("M-.", sendMessage $ IncMasterN $ -1)
                , ("M-m", windows W.focusMaster)
                , ("M-t", withFocused $ windows . W.sink)
                , ("M-S-q", io $ exitWith ExitSuccess)
                , ("M-q", spawn "killall -g .mpdmonitor.sh ; killall -g .alsamonitor.sh; xmonad --recompile && xmonad --restart")

                , ("M-b", sendMessage ToggleStruts)

                , ("M-h", sendMessage Shrink)
                , ("M-l", sendMessage Expand)
                , ("M-j", sendMessage MirrorShrink)
                , ("M-k", sendMessage MirrorExpand)

                , ("M-<Space>", spawn "exec \"$(dmenu_path | dmenu -fn Terminus -nb black -nf grey -sb orange -sf black -p cmd:)\"")
                , ("M-u", spawn "pwman -l -x -s$(pwman -L | dmenu)")
                , ("M-S-u", suckterm "emacsclient -nw -e \"(notmuch\"")

                , ("M-<XF86AudioPrev>", mpc "pause")
                , ("M-<XF86AudioPlay>", spawnterm "alsamixer")
                , ("M-<XF86AudioNext>", mpc "play")
                , ("M-S-<XF86AudioPrev>", mpc "prev")
                , ("M-S-<XF86AudioPlay>", spawnterm "ncmpcpp")
                , ("M-S-<XF86AudioNext>", mpc "clear")

                , ("M-<Tab>", windows W.focusDown)
                , ("M-S-<Tab>", windows W.swapDown)
                , ("M-`", windows W.focusUp)
                , ("M-S-`", windows W.swapUp)

                , ("M-s", sendMessage NextLayout) -- switch between tall and grid
                , ("M-S-s", setLayout $ XMonad.layoutHook conf) -- hard reset layout
                , ("M-f", sendMessage $ Toggle FULL)
                , ("M-a", sendMessage $ Toggle MIRROR)
                , ("M-S-f", windows W.swapMaster)

                , ("M-r", refresh)

                , ("M-i", spawn "xcalib -i -a")

                , ("M-v", spawn "echo \"\" | xsel -i && echo \"\" | xsel -ib")

                , ("M-S-/", spawnterm "less /usr/share/X11/locale/en_US.UTF-8/Compose")

                , ("M-x", spawn "xscreensaver-command --lock")
                , ("M-S-x", spawn "killall vlock-main")

                , ("M-<Return>", spawnterm "emacsclient -nw -e \"(eshell\"")
                , ("M-w", suckterm "emacsclient -nw $(mktemp)")

                , ("M-S-a", spawnterm "htop")
                ]
               )
             `M.union`
             (M.fromList 
                 [((m .|. modm, k), windows $ f i)
                  | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_9] ++ [xK_0])
                 , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
                 ]
             )
             `M.union` 
             (M.fromList
              [((m .|. modm .|. mod1Mask, key), screenWorkspace sc >>= flip whenJust (windows . f))
               | (key, sc) <- zip [xK_2, xK_1, xK_3, xK_4, xK_5, xK_6, xK_7, xK_8, xK_9, xK_0] [0..]
              , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
             )
           , mouseBindings =
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
           , layoutHook = avoidStruts $
                          smartBorders $
                          mkToggle (single FULL) . mkToggle (single MIRROR) $
                          onWorkspace "0" (ResizableTall 1 (widthdelta) (4/5) [] ||| Grid) $
                          onWorkspace "1" (ResizableTall 1 (widthdelta) (1/5) [] ||| Grid) $
                          (ResizableTall 1 (widthdelta) (1/2) []) ||| Grid
           , logHook = dynamicLogWithPP $ xmobarPP 
                       { ppCurrent = xmobarColor "" "orange" . xmobarStrip
                       , ppVisible = xmobarColor "" "white" . xmobarStrip
                       , ppWsSep = ""
                       , ppHidden = xmobarColor "black" "grey" . xmobarStrip
                       , ppHiddenNoWindows = id
                       , ppUrgent = xmobarColor "orange" "black" . xmobarStrip
                       , ppSep = " "
                       , ppTitle = const ""
                       , ppLayout  = \a -> case a of
                                             "Full" -> "ƒ"
                                             "Grid" -> "g"
                                             "Mirror Grid" -> "G"
                                             "ResizableTall" -> "t"
                                             "Mirror ResizableTall" -> "T"
                                             _ -> a
                       , ppExtras = [L.logCmd "echo \"| $(notmuch count tag:inbox):$(notmuch count tag:unread)\""]
                       , ppOrder = \[workspaces, layout, title, mail] -> [workspaces, layout, title, mail]
           , ppOutput = hPutStrLn xmproc
           }
           , manageHook = manageDocks <+> (composeAll
                                           [ className =? "MPlayer" --> doFloat
                                           , resource =? "Dialog" --> doFloat
                                           , title =? "Pidgin" --> doFloat
                                           , title =? "Dwarf Fortress" --> doFloat
                                           , title =? "QEMU" --> doFloat -- this doesn't work
                                           , className =? "Pidgin" --> doShift "1"
                                           , className =? "Iceweasel" --> doShift "2"
                                           , className =? "Icedove" --> doShift "3"
                                           ]
                                          )
           , handleEventHook = mempty
           , startupHook = suckterm $ "fortune -a | cowsay -n; linuxlogo" ++ " && " ++ "bash"
}
