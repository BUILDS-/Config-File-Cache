import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Circle
import XMonad.Layout.Tabbed
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Util.EZConfig(additionalKeys)

myManageHook = composeAll
    [ className =? "Gimp" --> doFloat 
    , className =? "Uptrack-manager" --> doFloat
    , className =? "stalonetray" --> doIgnore 
    , className =? "nm-connection-editor" --> doFloat
    , className =? "anathema" --> doFloat
    , className =? "blender" --> doFloat ]

main = xmonad myConfig

-- Main configuration, override the defaults to your liking.
myConfig = defaultConfig {
        borderWidth        = 2, 
        terminal           = "gnome-terminal",
        --normalBorderColor  = "#000000",
        --focusedBorderColor = "#000000",
        normalBorderColor  = "#222222",
        focusedBorderColor = "#008400",
	manageHook = manageDocks <+> myManageHook 
		      <+> manageHook defaultConfig,
	layoutHook = avoidStruts  $  layoutHook defaultConfig,
        startupHook = setWMName "LG3D",
	modMask = mod4Mask  -- Rebind Mod to the Windows key
	} 