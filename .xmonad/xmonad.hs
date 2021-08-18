import XMonad
import XMonad.Util.SpawnOnce
import XMonad.Util.Run

import XMonad.Actions.SpawnOn

import XMonad.Hooks.ManageDocks

import XMonad.Layout.LayoutModifier(ModifiedLayout)
import XMonad.Layout.ResizableTile
import XMonad.Layout.Renamed
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing

myModMask               = mod4Mask                      :: KeyMask
myTerm                  = "alacritty"                   :: String
myNormalBorderColor     = "#646464"                     :: String -- Dove Gray
myFocusedBorderColor    = "#5543aa"                     :: String -- Gigas
myBorderWidth           = 3
myWindowGap             = 7
myLogHook = return ()

myStartupHook = do
  spawnOnce "nitrogen  --restore &"
  spawnOnce "picom &"
  spawnOn   "workspace1" "firefox"
  spawnOn   "workspace1" myTerm


-- Layouts
mySpacing :: Integer -> l a -> ModifiedLayout Spacing l a
mySpacing i = spacingRaw True (Border i i i i) True (Border i i i i) True

tall =
  renamed [Replace "tall"] $
  mySpacing myWindowGap $
  ResizableTall 1 (3/100) (1/2) []

wide =
  renamed [Replace "wide"] $
  Mirror tall

full =
  renamed [Replace "full"] $
  Full

myLayout = avoidStruts $ smartBorders myDefaultLayout
  where
    myDefaultLayout = tall ||| wide ||| full

myWorkspaces            = [" home ", " sys "]

main = do
  xmproc <- spawnPipe "xmobar -x 0 /home/nikola/.config/xmobar/xmobarrc"
  xmonad $ docks defaults

defaults = def {
  terminal    = myTerm
  , modMask     = myModMask
  , borderWidth = myBorderWidth
  , normalBorderColor = myNormalBorderColor
  , focusedBorderColor = myFocusedBorderColor

  -- Hooks and Layouts
  , startupHook = myStartupHook
  , logHook = myLogHook
  , layoutHook = myLayout
  }
