;; (load "/home/george/.lib/emacs/ats-mode.el")
;; (load "/home/george/.lib/emacs/rainbow-delimiters.el")

;; Put auto-backups in ~/.emacs_backups
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;; Haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; Java
(defun my-java-mode-hook () (setq c-basic-offset 2))
(add-hook 'java-mode-hook 'my-java-mode-hook)

;; Sanity, people. Sanity.
(setq text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 78)
(setq require-final-newline t)
(setq-default indent-tabs-mode nil)
(menu-bar-mode 0)

;; HERE FOLLOWS A DEPRECATED NOTMUCH.EL CONFIGURATION.

;; notmuch
;(require 'notmuch)
;(setq message-kill-buffer-on-exit t)
;; bbdb
;(require 'bbdb)
;(bbdb-initialize 'message)
;(bbdb-insinuate-message)
;(bbdb-insinuate-w3)
;; msmtp
;(setq message-send-mail-function 'message-send-mail-with-sendmail)
;(setq sendmail-program "/usr/bin/msmtp")
;(setq message-sendmail-extra-arguments '("-a" "personalgmail"))
;(setq mail-host-address "gmail.com")
;(setq user-full-name "George Silvis, III")
;(setq user-mail-address "george.iii.silvis@gmail.com")

