import Data.Monoid
import System.Exit
import System.IO

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Layout.NoBorders
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.MultiColumns
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
mpc x = spawn("MPD_HOST=/home/frozencemetery/.mpd/socket mpc " ++ x)

asroot :: String -> X ()
asroot x = spawnterm("su -c '" ++ x ++ "'")

dmenu :: String -> String
dmenu prompt = 
  "dmenu -fn Terminus -nb black -nf grey -sb orange -sf black -p " ++ prompt

widthdelta :: Rational
widthdelta = 3/100
eightychars :: Rational
eightychars = 1/4

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ withUrgencyHook NoUrgencyHook defaultConfig 
           { terminal = "urxvtcd"
           , focusFollowsMouse = False
           , borderWidth = 1
           , modMask = mod4Mask
           , workspaces = map show $ [1..9] ++ [0]
           , normalBorderColor = "#000000"
           , focusedBorderColor = "#ff7228"
           , keys =          
             \conf@(XConfig {XMonad.modMask = modm}) ->
               (mkKeymap conf $
                [ ("M-S-<Return>", spawn $ terminal conf)
                , ("M-S-c", kill)
                , ("M-,", sendMessage $ IncMasterN 1)
                , ("M-.", sendMessage $ IncMasterN $ -1)
                , ("M-m", windows W.focusMaster)
                , ("M-t", withFocused $ windows . W.sink)
                , ("M-S-q", io $ exitWith ExitSuccess)
                , ("M-q", spawn $
                          "killall -g .mpdmonitor.sh ; killall -g .alsamonitor.sh;"
                          ++ "xmonad --restart"
                  )
                , ("M-h", sendMessage Shrink)
                , ("M-l", sendMessage Expand)

                , ("M-b", sendMessage ToggleStruts)

                , ("M-n", windows W.focusDown)
                , ("M-S-n", windows W.swapDown)
                , ("M-p", windows W.focusUp)
                , ("M-S-p", windows W.swapUp)

                , ("M-S-x", spawn "gmrun")
                , ("M-x", spawn $ 
                                "exec \"$(dmenu_path | " 
                                ++ dmenu "cmd:" ++ ")\"")

                , ("M-u", spawn "dmenu-pwman")
                , ("M-S-u", suckterm "emacsclient -nw -e \"(notmuch)\"")


                , ("M-<Space>", sendMessage NextLayout) -- tall <-> grid
                , ("M-S-<Space>", setLayout $ XMonad.layoutHook conf) -- reset
                , ("M-f", sendMessage $ Toggle FULL)
                , ("M-a", sendMessage $ Toggle MIRROR)
                , ("M-<Return>", windows W.swapMaster)

                , ("M-r", refresh)

                , ("M-i", spawn "xcalib -i -a")

                , ("M-v", spawn "echo \"\" | xsel -i && echo \"\" | xsel -ib")

                , ("M-S-/", spawnterm 
                            "less /usr/share/X11/locale/en_US.UTF-8/Compose")

                , ("M-w", suckterm "emacsclient -nw $(mktemp)")

                , ("M-S-a", spawnterm "htop")

                , ("<XF86AudioPrev>", mpc "pause")
                , ("<XF86AudioPlay>", spawnterm "alsamixer")
                , ("<XF86AudioNext>", mpc "play")
                , ("S-<XF86AudioPrev>", mpc "prev")
                , ("S-<XF86AudioPlay>", spawnterm "ncmpcpp")
                , ("S-<XF86AudioNext>", mpc "clear")

                , ("<XF86AudioLowerVolume>", spawn "amixer set Master 3%-")
                , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 3%+")

                , ("<XF86ScreenSaver>", spawn "xscreensaver-command --lock")
                , ("<XF86WebCam>", spawn "mplayer -vf mirror tv://")
                , ("<XF86Launch1>", spawn "qemu-launcher")
                ]
               )
             `M.union`
             (M.fromList $
              [ ((m .|. modm, k), windows $ f i) 
                  | (i, k) <- zip (XMonad.workspaces conf) $ [xK_1 .. xK_9] ++ [xK_0]
              , (f, m) <- [ (W.greedyView, 0)
                          , (W.shift, shiftMask)
                          ]
              ]
              ++
              [ ( (m .|. modm .|. mod1Mask, key)
                , screenWorkspace sc >>= flip whenJust (windows . f)) 
                | (key, sc) <- zip (xK_2:xK_1:[xK_3..xK_9] ++ [xK_0]) [0..]
              , (f, m) <- [ (W.view, 0)
                          , (W.shift, shiftMask)
                          ]
              ]
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
           , layoutHook = 
             avoidStruts $ smartBorders $
             mkToggle (single FULL) . mkToggle (single MIRROR) $
             onWorkspace "1" (multiCol [1, 1] 0 widthdelta (1/6)) $
             onWorkspace "2" (multiCol [1, 1] 0 widthdelta (1/3)) $
             onWorkspace "3" (multiCol [1, 1] 0 widthdelta (1/3)) $
             multiCol [1, 1, 1] 0 widthdelta eightychars ||| 
             multiCol [2, 2, 2] 0 widthdelta eightychars
           , logHook = dynamicLogWithPP $ xmobarPP 
                       { ppCurrent = xmobarColor "" "orange" . xmobarStrip
                       , ppVisible = xmobarColor "" "white" . xmobarStrip
                       , ppWsSep = ""
                       , ppHidden = xmobarColor "black" "grey" . xmobarStrip
                       , ppHiddenNoWindows = id
                       , ppUrgent = xmobarColor "orange" "black" . xmobarStrip
                       , ppSep = " "
                       , ppTitle = const ""
                       , ppLayout = \a -> case a of
                                            "MultiCol" -> "m"
                                            "Full" -> "ƒ"
                                            "ResizableTall" -> "t"
                                            "Mirror MultiCol" -> "M"
                                            "Mirror ResizableTall" -> "T"
                                            _ -> a
                       , ppExtras = [L.logCmd $
                                     "echo \"| `" ++ "notmuch count tag:inbox"
                                     ++ "`:`" ++ "notmuch count tag:unread" 
                                     ++ "`\""
                                    ]
                       , ppOrder = \([workspaces, layout, title, mail]) 
                                 -> [workspaces, layout, title, mail]
                       , ppOutput = hPutStrLn xmproc
                       }
           , manageHook = manageDocks <+> 
                          (composeAll $
                           [ title =? "MPlayer" --> doFloat
                           , resource =? "Dialog" --> doFloat
                           , title =? "Pidgin" --> doFloat
                           , title =? "Accounts" --> doFloat
                           , title =? "Dwarf Fortress" --> doFloat
                           , title =? "QEMU" --> doFloat -- above doesn't work
                           , className =? "Gimp" --> doFloat
                           , className =? "Pidgin" --> doShift "1"
                           , className =? "Iceweasel" --> doShift "2"
                           , className =? "Icedove" --> doShift "3"
                           , className =? "Qjackctl" --> doFloat
                           , className =? "Qjackctl.real" --> doFloat
                           ]
                          )
           , handleEventHook = mempty
           , startupHook = suckterm $ 
                           "fortune -a | cowsay -n; linuxlogo -F \"This is #H: Debian\n#O version #V\n#N #X #T #P\nwith #R#S RAM\n#B BogoMIPS\""
                           ++ " && " ++ "bash"
           }
