
;tab == 4 spaces
(setq default-tab-width 4)
;Columns automatically shown
(setq column-number-mode t)


;ghci is the haskell interpreter emacs uses.
(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)
(add-hook 'haskell-mode-hook 
   (function
    (lambda ()
      (setq haskell-program-name "ghci")
      (setq haskell-ghci-program-name "ghci6"))))