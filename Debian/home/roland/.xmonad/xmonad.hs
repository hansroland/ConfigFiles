-- ------------------------------------------------------------
-- xmonad.hs Configuration file for XMonad
-- ------------------------------------------------------------
-- 
-- Introduction:
-- See: http://www.haskell.org/haskellwiki/Xmonad/Config_archive/John_Goerzen%27s_Configuration
--      
--
-- Other examples:
--     http://haskell.org/haskellwiki/Xmonad/Config_archive 
--
--
-- Full Documentation of options: XMonad.Core.Xconfig
--    http://hackage.haskell.org/packages/archive/xmonad/0.10/doc/html/XMonad-Core.html
--
-- ------------------------------------------------------------

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
   xmproc <- spawnPipe "xmobar"
   spawn "sh /home/roland/StartMyWiki"
   xmonad $ defaultConfig
     { borderWidth        = 4
     , terminal           = "gnome-terminal"
     , normalBorderColor  = "#cccccc"
     , focusedBorderColor = "#ff0000" 
     , manageHook = manageDocks <+> manageHook defaultConfig
     , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
     , layoutHook = smartBorders $ avoidStruts $  layoutHook  defaultConfig
     --, modMask = mod4Mask   -- Rebind Mod to the Windows key (for Virtual machines)
     }
