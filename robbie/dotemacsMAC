;;; EMACS CONFIGURATION FILE 

;; Display Time Function 
(display-time)

;;Check terminal type for keypad loading 
(setq terminal-name (getenv "TERM"))
(if (string-equal (substring terminal-name 0 3) "vt2")
(load "~/.vt200" nil t))

;;; C CODE FORMATTING (c-mode defines) 
;; tab will indent even if in middle of a line 
(setq c-tab-always-indent t)
;; newline after semi-colons and braces
(setq c-auto-newline nil) ;; t for newline after semi's or braces
;; indentation of new code levels [if {, while{, etc]
(setq c-indent-level 2)
;; indentation of lines continued from prior line
(setq c-continued-statement-offset 2)
;; extra indentation given to braces 
(setq c-brace-offset 0)
;; indentation given to argument declarations lists
(setq c-argdecl-indent 5)
;; indentation for labels and case statements
(setq c-label-offset -2)
;; indentation given to continued lines beginning with braces
(setq c-continued-brace-offset 0)

;; AUTOMATIC MODE SELECTION (hooks)

;; set text-mode as default
(setq default-major-mode 'text-mode)

;; enable auto-fill-mode in text-mode and all related modes
(setq text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 75);; ONLY FOR NOW -- add to text-mode-hook

;;; Turn on nroff-mode for the following files 
(setq auto-mode-alist (append auto-mode-alist
'(("\\.me$" . nroff-mode)
("\\.ms$" . nroff-mode)
("\\.man$" . nroff-mode)
("\\.[1-8lnp].$" . nroff-mode))))

;; turn on nroff command grouping
(setq nroff-mode-hook '(lambda () (electric-nroff-mode 1)))

;; Turn on coloring of coding for color xterms 
(if (eq window-system 'x)
(if (x-display-color-p)
(progn
(require 'font-lock)
(add-hook 'emacs-lisp-mode-hook 'font-lock-mode)
(add-hook 'c++-mode-hook 'font-lock-mode)
(add-hook 'c-mode-hook 'font-lock-mode)
(add-hook 'perl-mode-hook 'font-lock-mode)
(add-hook 'java-mode-hook 'font-lock-mode)
)))

(custom-set-variables
 '(font-lock-maximum-decoration t)
 '(font-lock-support-mode nil)
 '(global-font-lock-mode nil nil (font-lock))
 '(font-lock-global-modes t))
(custom-set-faces)

;; MISCELLANEOUS STUFF 

;; auto-save set 
(setq auto-save-interval 500)

;; set compile line
;;(setq compile-command "gcc -o ") 

;; make searches case sensitive by default 
(setq-default case-fold-search nil)

;; set shell to run in emacs 
(setq explicit-shell-file-name "/bin/bash")

;; Set lpr flags (M-x lpr) 
;;(setq lpr-switches (list "-h"))

;; scratch buffer safety net 
(save-excursion
(set-buffer "*scratch*")
(setq buffer-file-name (expand-file-name "~/scratch")))

;;
;;Global font-lock ON: 
(global-font-lock-mode 1)

;;Show matching parentheses ON:
(show-paren-mode 1)

;;hide the damn top menu
(menu-bar-mode 0)

;;scroll only one line at a time:
(setq scroll-step 1)

;;force all questions to y or n
(fset 'yes-or-no-p 'y-or-n-p)

;;get some haskell up in here
(load "~/lib/emacs/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-complex-indent)

;;ATS time
(load "~/lib/emacs/ats-mode.el")

;;proceed to init

;; Finally 
(message "Loading init file....done")


