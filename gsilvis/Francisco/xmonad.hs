import XMonad
import Data.Monoid
import System.Exit
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO 
 

myManageHook = composeAll
    [ className =? "MPlayer"              --> doFloat
    , title     =? "xfce4-notifyd"        --> doIgnore
    , title     =? "Pidgin"               --> doFloat
    , resource  =? "Dialog"               --> doFloat
    ]


spawnterm :: String -> X ()
spawnterm s = spawn $ "xfce4-terminal -x sh -c 'sleep .1; " ++ s ++ "'"

main = do 
  xmproc <- spawnPipe "xmobar /home/george/.xmobarrc"
  xmonad $ defaultConfig
    { terminal          = "xfce4-terminal"
    , focusFollowsMouse = False
    , modMask           = mod4Mask
    , layoutHook        = avoidStruts $ layoutHook defaultConfig
    , manageHook        = manageDocks <+> myManageHook
    , logHook           = dynamicLogWithPP $ xmobarPP
        { ppOutput = hPutStrLn xmproc
        , ppTitle  = xmobarColor "green" "" . shorten 50
        }
    } `additionalKeys`
-- screen capture (full screen, and just active window. Save to ~/Pictures/Captures)
      [ ((0          , xK_Print), spawn "scrot -e 'mv $f ~/Pictures/Captures/'")
      , ((controlMask, xK_Print), spawn "scrot -u -e 'mv $f ~/Pictures/Captures/'")
-- the following are for manipulating mpd, the music player daemon, my music player of choice
      , ((mod4Mask, xK_equal       ), spawn "ncmpcpp volume +5")
      , ((mod4Mask, xK_minus       ), spawn "ncmpcpp volume -5")
      , ((mod4Mask, xK_backslash   ), spawn "mpc -h \"/var/run/mpd/socket\" toggle")
      , ((mod4Mask, xK_bracketleft ), spawn "ncmpcpp seek 0%")
      , ((mod4Mask, xK_bracketright), spawn "ncmpcpp next")
-- the following are for common things that I want to do in a terminal
      , ((mod4Mask .|. shiftMask, xK_z  ), spawnterm "ncmpcpp")
      , ((mod4Mask .|. shiftMask, xK_l  ), spawnterm "alsamixer")
      , ((mod4Mask .|. shiftMask, xK_m  ), spawnterm "evenless")
      , ((mod4Mask .|. shiftMask, xK_s  ), spawnterm "ssh ellis")
      , ((mod4Mask .|. shiftMask, xK_F11), spawnterm "emacsclient -nw /home/george/.xmonad/xmonad.hs")
      , ((mod4Mask .|. shiftMask, xK_e  ), spawnterm "emacsclient -nw -e \"(list (eshell \\\"new\\\") (delete-other-windows))\"")
      , ((mod4Mask .|. shiftMask, xK_r  ), spawnterm "sudo -s")
-- applications
      , ((mod4Mask .|. controlMask, xK_f), spawn "firefox")
      , ((mod4Mask .|. controlMask, xK_t), spawn "liferea")
      , ((mod4Mask .|. controlMask, xK_p), spawn "zathura")
-- lock screen
      , ((mod4Mask, xK_x), spawn "xscreensaver-command --lock")
      ]
