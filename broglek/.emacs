;;; EMACS CONFIGURATION FILE

;;turn off menu
(menu-bar-mode 0)
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
;; turn off startup message
(setq inhibit-startup-message 't)
;; AUTOMATIC MODE SELECTION (hooks)

;; set text-mode as default
(setq default-major-mode 'text-mode)

;; enable auto-fill-mode in text-mode and all related modes
(setq text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 75)        ;; ONLY FOR NOW -- add to text-mode-hook

;;Set auto-modes
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
                        ("\\.scm$" . scheme-mode)
                        ("\\.md$" . emacs-lisp-mode)
                        ("\\.l$" . lisp-mode)
                        ("\\.lisp$" . lisp-mode)
                        ("\\.f$" . fortran-mode)
                        ("/draft$" . draft-mode)

;;; Less common extensions come here
;;; so more common ones above are found faster.
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
                        ("\\.scm.[0-9]*$" . scheme-mode)
                        ;; .emacs following a directory delimiter
                        ;; in either Unix or VMS syntax.
                        ("[]>:/]\\..*emacs" . emacs-lisp-mode)
                        ("\\.ml$" . lisp-mode)))



;;; Turn on nroff-mode for the following files
(setq auto-mode-alist (append auto-mode-alist
			      '(("\\.me$" . nroff-mode)
				("\\.ms$" . nroff-mode)
				("\\.man$" . nroff-mode)
				("\\.[1-8lnp].$" . nroff-mode))))

;; turn on nroff command grouping
(setq nroff-mode-hook '(lambda () (electric-nroff-mode 1)))


;;Ignore these when doing auto-completion

(setq completion-ignored-extensions
      (append completion-ignored-extensions
              (quote
               (".bak" "~" ".CKP" ".aux" ".otl" ".err"
                       ".lib" ".dvi" ".PS" ".o"))))

 (setq load-path
           (append (list nil "/home/broglek/.elisp"
                         "/usr/local/" )
                   load-path))

;;c-mode configuration
(setq c-mode-hook
      '(lambda ()
         (setq case-fold-search nil c-argdecl-indent 0 fill-prefix " * ")
         ))

;; Set Keyboard Bindings

(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-l" 'what-line)
(global-set-key "\M-r" 'replace-string)



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

(when (fboundp 'global-font-lock-mode)
  ;; Load the font-lock package.
  (require 'font-lock)
  ;; Maximum colors
  (setq font-lock-maximum-decoration t)
  ;; Turn on font-lock in all modes that support it
  (global-font-lock-mode t))

;; MISCELLANEOUS STUFF

;; auto-save set
(setq auto-save-interval 500)

;; set compile line
;;(setq compile-command "gcc -o ") 

;; make searches case sensitive by default
(setq-default case-fold-search nil)

;; set shell to run in emacs
(setq explicit-shell-file-name "/bin/bash")

;; for wordprocessing -- access to webster
(defun webster-word (word)
  "Call Webster on a word"
  (interactive "sWord for webster: ")
  (shell-command (concat "webster " "'" word "'")))

;; Set lpr flags (M-x lpr)
;;(setq lpr-switches (list "-h"))

;; scratch buffer safety net
(save-excursion
  (set-buffer "*scratch*")
  (setq buffer-file-name (expand-file-name "~/scratch")))
;; Kyle Configs
(setq version-control t)

;;post config for sup

(add-to-list 'auto-mode-alist '("sup\\.\\(compose\\|forward\\|reply\\|resume\\)-mode$" . post-mode))

;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
(setq scroll-step 1)
;; Finally
(message "Loading init file....done")

