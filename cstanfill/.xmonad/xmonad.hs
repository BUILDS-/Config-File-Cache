import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Util.Run(spawnPipe)
import XMonad.Actions.SpawnOn
import XMonad.Util.EZConfig(additionalKeys)
import Graphics.X11.ExtraTypes.XF86
import System.IO
import XMonad.Hooks.UrgencyHook

myTerminal :: String
myTerminal = "xfce4-terminal --hide-menubar"

terminalCommand :: String -> String
terminalCommand cmd = myTerminal ++ " -x " ++ cmd

myManageHook :: ManageHook
myManageHook = composeAll 
    [ className =? "Xfce4-notifyd" --> doIgnore
    , title     =? "__NCMPCPP"     --> doCenterFloat
    , title     =? "__ALSAMIXER"   --> doCenterFloat
    , title     =? "__XMONADHS"   --> doCenterFloat
    ]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ withUrgencyHook NoUrgencyHook defaultConfig
        { manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ smartBorders $ layoutHook defaultConfig
	, modMask = mod4Mask
        , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        , ppUrgent = xmobarColor "grey" "red" . xmobarStrip
                        }
	, terminal = myTerminal 
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z),        spawn "xscreensaver-command -lock")
        -- media keys
        , ((0, xF86XK_AudioLowerVolume),          spawn "soundkey down")
        , ((0, xF86XK_AudioRaiseVolume),          spawn "soundkey up")
        , ((0, xF86XK_AudioMute),                 spawn "soundkey mute")
        , ((0, xF86XK_AudioPlay),                 spawn "mpc toggle")
        , ((0, xF86XK_AudioNext),                 spawn "mpc next")
        , ((0, xF86XK_AudioPrev),                 spawn "mpc prev")
        , ((mod4Mask, xK_o),                      spawn $ myTerminal ++ 
                                                       " --title=__NCMPCPP -x ncmpcpp")
        , ((mod4Mask, xK_a),                      spawn $ myTerminal ++ " --title=__ALSAMIXER -x alsamixer")
        , ((mod4Mask .|. controlMask, xK_x),      spawn $ myTerminal ++ " --title=__XMONADHS -x vim ~/.xmonad/xmonad.hs")
        -- various utility scripts 
        , ((mod4Mask .|. shiftMask, xK_s),        spawn "set_background")
        , ((mod4Mask .|. controlMask, xK_k),      spawn "fix_keyboard")
        , ((mod4Mask .|. controlMask, xK_h),      spawn "fix_screens left")
        , ((mod4Mask .|. controlMask, xK_l),      spawn "fix_screens right")
        , ((mod4Mask .|. controlMask, xK_Return), spawn "fix_screens single")
        , ((mod4Mask .|. controlMask, xK_c),      spawn "fix_screens cycle")
        , ((mod4Mask .|. controlMask, xK_r),      spawn "fix_screens res")
        ]
