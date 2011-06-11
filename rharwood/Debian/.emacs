(display-time)
(column-number-mode)

(defadvice split-window-vertically
    (after my-window-splitting-advice first () activate)
    (set-window-buffer (next-window) (other-buffer)))

; more org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq require-final-newline t)

; TODO: fix this!
(setq c-tab-always-indent t)
(setq c-auto-newline nil)
(setq c-indent-level 2)
(setq c-continued-statement-offset 4)
(setq c-brace-offset 0)
(setq c-argdecl-indent 5)
(setq c-label-offset 2)
(setq c-continued-brace-offset 0)
(setq c-mode-hook 
      '(lambda () 
         (setq case-fold-search nil c-argdecl-indent 0 fill-prefix " * ")
         )
      )

(setq-default c-basic-offset 2)
; fuck tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;(setq default-major-mode 'text-mode)

(setq text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 78)

(setq info-mode-hook 'visual-mode)

(setq org-indent-indentation-per-level 1)
(setq org-mode-hook '(org-indent-mode))

(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))
(global-set-key "\C-u" 'backward-kill-line) ; FUCK ARGUMENT PASSING

(global-set-key "\C-h" 'delete-backward-char) ; fuck everything about bash and emacs not matching
(defun kill-word-backward ()
  "M-d except it's M-h."
  (interactive)
  (unless (looking-at "\\<")
    (backward-word))
  (kill-word 1))
(global-set-key "\M-h" 'backward-kill-word) ; and frankly fuck that too

;(add-to-list 'auto-mode-alist '(
(setq auto-mode-alist '(
                        ("\\.c$" . c-mode)
                        ("\\.h$" . c-mode)
                        ("\\.i$" . c-mode)
                        ("\\.php$" . php-mode)
                        ("\\.mss$" . scribe-mode)
                        ("\\.s$" . text-mode)
                        ("\\.tex$" . TeX-mode)
                        ("\\.el$" . emacs-lisp-mode)
                        ("\\.text$" . text-mode)
                        ("\\.gwm$" . lisp-mode)
                        ("\\.cl$" . lisp-mode)
                        ("\\.scm$" . scheme-mode)
                        ("\\.md$" . emacs-lisp-mode)
                        ("\\.l$" . lisp-mode)
                        ("\\.lisp$" . lisp-mode)
                        ("\\.f$" . fortran-mode)
                        ("/draft$" . draft-mode)
                        ("\\.TeX$" . TeX-mode)
                        ("\\.sty$" . LaTeX-mode)
                        ("\\.bbl$" . LaTeX-mode)
                        ("\\.bib$" . text-mode)
                        ("\\.article$" . text-mode)
                        ("\\.letter$" . text-mode)
                        ("\\.texinfo$" . texinfo-mode)
                        ("\\.lsp$" . lisp-mode)
                        ("\\.y$" . c-mode)
                        ("\\.cc$" . c-mode)
                        ("\\.hs$" . haskell-mode)
                        ("\\.cpp$" . c++-mode)
                        ("\\.py$" . python-mode)
                        ("\\.org$" . org-mode)
                        ("\\.scm.[0-9]*$" . scheme-mode)
                        ("\\.java$" . java-mode)
                        ("\\.txt$" . text-mode)
                        ("[]>:/]\\..*emacs" . emacs-lisp-mode)
                        ("Makefile" . makefile-mode)
                        (".bashrc" . shell-script-mode)
                        (".bash_profile" . shell-script-mode)
                        (".bash_aliases" . shell-script-mode)
                        ("\\.sh$" . shell-script-mode)
                        ("\\.ml$" . lisp-mode)))

(setq completion-ignored-extensions
      (append completion-ignored-extensions
              (quote
               (".bak" "~" ".CKP" ".aux" ".otl" ".err"
		".lib" ".dvi" ".PS" ".o" ".pdf" ".log")
	       )
	      )
      )

(if (eq window-system 'x)
    (if (x-display-color-p)
	(progn
	  (require 'font-lock)
	  (add-hook 'emacs-lisp-mode-hook 'font-lock-mode)
	  (add-hook 'c++-mode-hook 'font-lock-mode)
	  (add-hook 'c-mode-hook 'font-lock-mode)
	  (add-hook 'perl-mode-hook 'font-lock-mode)
	  (add-hook 'java-mode-hook 'font-lock-mode)
	  )
      )
  )
(custom-set-variables
 '(font-lock-maximum-decoration t)
 '(font-lock-support-mode nil)
 '(global-font-lock-mode nil nil (font-lock))
 '(font-lock-global-modes t))
(custom-set-faces)
(when (fboundp 'global-font-lock-mode)
  (require 'font-lock)
  (setq font-lock-maximum-decoration t)
  (global-font-lock-mode t)
  )

(setq auto-save-interval 1024)

;(setq explicit-shell-file-name "/bin/bash")

;(setq text-mode-hook '(setq line-move-visual 't)) ; TODO: MAKE THIS WORK SO I CAN TURN OFF THE STUPIDITY WITH AUTO-FILL
(setq line-move-visual 'nil)
(setq track-eol 1)

(save-excursion
  (set-buffer "*scratch*")
  (setq buffer-file-name (expand-file-name "~/scratch"))
  )
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

(add-to-list 'auto-mode-alist '("sup\\.\\(compose\\|forward\\|reply\\|resume\\)-mode$" . post-mode))

;(add-to-list 'load-path (expand-file-name "/home/robbie/sage-4.6.1/data/emacs"))
;(require 'sage "sage")
;(setq sage-command "/home/robbie/sage-4.6.1/sage")

; If you want sage-view to typeset all your output and have plot()
; commands inline, uncomment the following line and configure sage-view:
;(require 'sage-view "sage-view")
;(add-hook 'sage-startup-hook 'sage-view)
; You can use commands like
; (add-hook 'sage-startup-hook 'sage-view
; 'sage-view-disable-inline-output 'sage-view-disable-inline-plots)
; to have some combination of features.  In future, the customize interface
; will make this simpler... hint, hint!

(load "/home/robbie/.emacs.d/ats-mode.el")

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(global-font-lock-mode 1)

(show-paren-mode 1)

(menu-bar-mode 0)

(setq scroll-step 1)

(fset 'yes-or-no-p 'y-or-n-p)

(message "I loaded your damn init file.  I nearly choked on it, too; I hope you're happy.")
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
