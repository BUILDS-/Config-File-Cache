import Data.List
import Data.Monoid

import GHC.IO.Handle

import Network

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
spawnterm x = spawn $ "urxvtcd -e " ++ x

suckterm :: String -> X()
suckterm x = spawn $ "urxvt -e sh -c 'sleep .07; exec " ++ x ++ "'"

mpc :: String -> X ()
mpc x = spawn $ "MPD_HOST=/run/mpd/socket mpc " ++ x

asroot :: String -> X ()
asroot x = spawnterm $ "su -c '" ++ x ++ "'"

dmenu :: String -> String -> String
dmenu c p =
  c ++ " -b -fn Terminus -nb black -nf grey -sb orange -sf black -p " ++ p

boinc_toggle :: X ()
boinc_toggle = liftIO $
  let
    magic :: String
    magic = "   <task_mode>"
    f :: Handle -> IO Char
    f h = do
      l <- hGetLine h
      if magic `isPrefixOf` l
      then return $ (drop (length magic) l) !! 0
      else f h
  in do
    s <- connectTo "localhost" (PortNumber 31416)
    hPutStr s "<boinc_gui_rpc_request>\n<get_cc_status/>\n</boinc_gui_rpc_request>\n\x03"
    l <- f s
    hPutStr s $ if l == '1'
      then "<boinc_gui_rpc_request>\n<set_run_mode><never/><duration>0</duration></set_run_mode>\n</boinc_gui_rpc_request>\n\x03"
      else "<boinc_gui_rpc_request>\n<set_run_mode><always/><duration>0</duration></set_run_mode>\n</boinc_gui_rpc_request>\n\x03"

-- some layout stuff
widthdelta = 3/100 :: Rational
eightychars = 1/4 :: Rational
tentwentyfour = 1/3 :: Rational
special = multiCol [1, 1] 0 widthdelta tentwentyfour :: MultiCol a
regular = multiCol [1, 1, 1] 0 widthdelta eightychars :: MultiCol a
regularLayout = regular ||| special :: Choose MultiCol MultiCol a
offLayout = special ||| regular :: Choose MultiCol MultiCol a
myLayouts = avoidStruts $ smartBorders $
            mkToggle (single FULL) . mkToggle (single MIRROR) $
            onWorkspace "1" offLayout $
            onWorkspace "2" offLayout $
            onWorkspace "3" offLayout $
            regularLayout

main :: IO ()
main = do
  xmproc0 <- spawnPipe "xmobar -x 0"
  xmproc1 <- spawnPipe "xmobar -x 1"
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
                , ("M-q", spawn $
                          "killall -g .mpdmonitor.sh" 
                          ++ " ; " ++ 
                          "killall -g .alsamonitor.sh"
                          ++ " ; " ++
                          "xmonad --restart"
                  )
                , ("M-h", sendMessage Shrink)
                , ("M-l", sendMessage Expand)

                , ("M-b", sendMessage ToggleStruts)

                , ("M-n", windows W.focusDown)
                , ("M-S-n", windows W.swapDown)
                , ("M-p", windows W.focusUp)
                , ("M-S-p", windows W.swapUp)

                , ("M-S-x", spawn "gmrun")
                , ("M-x", spawn $ dmenu "dmenu_run" "cmd: ")

                , ("M-u", spawn "dmenu-haskey")

                , ("M-y", spawn $ 
                          "youtube-dl -f best -o - -- $(xsel -o)" 
                          ++ " | " ++ 
                          "mplayer -softvol -softvol-max 1000 -nolirc -cache-min 0.01 - >/dev/null"
                  )
                , ("M-S-y", spawn $ 
                            "youtube-dl -f best -o - $(xsel -o)" 
                            ++ " | " ++
                            "mplayer -softvol -softvol-max 1000 -nolirc -novideo -cache-min 0.01 - >/dev/null"
                  )

                , ("M-<Space>", sendMessage NextLayout)
                , ("M-S-<Space>", setLayout $ XMonad.layoutHook conf)
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
                , ("<XF86Launch1>", boinc_toggle)
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
                | (key, sc) <- zip ([xK_1..xK_9] ++ [xK_0]) [0..]
              , (f, m) <- [ (W.view, 0)
                          , (W.shift, shiftMask)
                          ]
              ]
             )
           , mouseBindings = -- X assumes a 3+ button mouse
             \XConfig {XMonad.modMask = modm} -> M.fromList $
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
           , layoutHook = myLayouts
           , logHook = dynamicLogWithPP $ xmobarPP 
                       { ppCurrent = xmobarColor "" "orange" . xmobarStrip
                       , ppVisible = xmobarColor "" "white" . xmobarStrip
                       , ppWsSep = ""
                       , ppHidden = xmobarColor "black" "grey" . xmobarStrip
                       , ppHiddenNoWindows = id
                       , ppUrgent = xmobarColor "orange" "black" . xmobarStrip
                       , ppSep = " "
                       , ppTitle = xmobarColor "purple" "black" . xmobarStrip
                       , ppLayout = 
                         \a -> case a of
                           "MultiCol" -> "m"
                           "Full" -> "ƒ"
                           "ResizableTall" -> "t"
                           "Mirror MultiCol" -> "M"
                           "Mirror ResizableTall" -> "T"
                           _ -> a
                       , ppExtras = [L.logCmd $
                                     "echo \"│ `" ++ "notmuch count tag:inbox"
                                     ++ "`:`" ++ "notmuch count tag:unread" 
                                     ++ "` │\""
                                    ]
                       , ppOrder = \([workspaces, layout, title, mail]) 
                                 -> [workspaces, layout, mail, title]
                       , ppOutput = \s ->
                                    hPutStrLn xmproc0 s >> hPutStrLn xmproc1 s
                       }
           , manageHook = manageDocks <+> 
                          (composeAll $
                           [ title =? "MPlayer" --> doFloat
                           , resource =? "Dialog" --> doFloat
                           , title =? "QEMU" --> doFloat -- above doesn't work
                           , className =? "Gimp" --> doFloat
                           , className =? "Qjackctl" --> doFloat
                           , className =? "Qjackctl.real" --> doFloat
                           , className =? "Icedove" --> doShift "3"
                           ]
                          )
           , handleEventHook = mempty
           , startupHook = 
             suckterm $ 
             "fortune -a | cowsay -n"
             ++ " ; " ++ 
             "linuxlogo -F \"This is #H :: Debian\n#O version #V\n#N #X #T #P\nwith #R#S RAM\n#B BogoMIPS\""
             ++ " && " ++
             "bash"
           }
