;; YO WHATUP THIS HERE BE MY EMACS CONFIG
;; emacs be pretty awesome yo so this file is kinda unnecessary, aight?

;; have a clock, dawg
(display-time)

;; sometimes you just need a terminal, know what I'm saying?
(setq terminal-name (getenv "TERM"))
(if (string-equal (substring terminal-name 0 3) "vt2")
(load "~/.vt200" nil t))

;; aight, so because I'm a real programmer, I'm editin the hell out of c most of the time so here's some config to deal it that
(setq c-tab-always-indent t)
(setq c-auto-newline nil)
(setq c-indent-level 2)
(setq c-continued-statement-offset 4)
(setq c-brace-offset 0)
(setq c-argdecl-indent 5)
(setq c-label-offset -2)
(setq c-continued-brace-offset 0)
(setq c-mode-hook 
      '(lambda () 
	 (setq case-fold-search nil c-argdecl-indent 0 fill-prefix " * ")
	 )
      )

;; hokay, so for some reason text isn't default so have some text, bro:
(setq default-major-mode 'text-mode)

;; enable mind-reading
(setq text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 75)

;; modes are pretty cool they seperate the gods from the vim:
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
			("[]>:/]\\..*emacs" . emacs-lisp-mode)
                        ("\\.ml$" . lisp-mode)))

;; dawg, nroff-mode is good, but it ain't no god:
(setq auto-mode-alist (append auto-mode-alist
			      '(("\\.me$" . nroff-mode)
				("\\.ms$" . nroff-mode)
				("\\.man$" . nroff-mode)
				("\\.[1-8lnp].$" . nroff-mode)
				))
      )
(setq nroff-mode-hook '(lambda () (electric-nroff-mode 1)))

;; okay so mebbe our autoCOMplete could be a bit better
(setq completion-ignored-extensions
      (append completion-ignored-extensions
              (quote
               (".bak" "~" ".CKP" ".aux" ".otl" ".err"
		".lib" ".dvi" ".PS" ".o")
	       )
	      )
      )

;; dayum, I love color on x11:
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

;; yo. font lock.  get it up inz.
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


;; I'm a fan of backups; a brother should be all about blackup.
(setq auto-save-interval 500)

;; bash is like god's right hand man, I tell you
(setq explicit-shell-file-name "/bin/bash")

;; you can never have to much blackup
(save-excursion
  (set-buffer "*scratch*")
  (setq buffer-file-name (expand-file-name "~/scratch"))
  )
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;; sup?
(add-to-list 'auto-mode-alist '("sup\\.\\(compose\\|forward\\|reply\\|resume\\)-mode$" . post-mode))


;; show off my bling
(global-font-lock-mode 1)

;; I got mad matching skillz, yo
(show-paren-mode 1)

;; and I don't use guis
(menu-bar-mode 0)

;; fuck page jumping
(setq scroll-step 1)

;; and I ain't typin no
(fset 'yes-or-no-p 'y-or-n-p)

;; because I'm too young to die
(message "I loaded your damn init file.  I nearly choked on it, too; I hope you're happy.")


