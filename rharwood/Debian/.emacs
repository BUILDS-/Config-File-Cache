(setq display-time-24hr-format 1)
(display-time)
(column-number-mode)
(display-battery-mode)

(require 'notmuch)
;; Sign messages by default.
(add-hook 'message-setup-hook 'mml-secure-sign-pgpmime)

(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "/usr/share/auto-complete/dict/")
(require 'auto-complete-config)
(ac-config-default)
(ac-flyspell-workaround)

(load "/home/frozencemetery/.emacs.d/sml-modeline.el")
(sml-modeline-mode)

(load "/home/frozencemetery/.emacs.d/ac-math.el")
(require 'ac-math)
(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
        (append '(ac-source-math-latex ac-source-latex-commands  ac-source-math-unicode)
                ac-sources))
  )
(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)

;(add-to-list 'ac-modes 'latex-mode)
; the below is a stupid way to do the above globally
;(define-globalized-minor-mode real-global-auto-complete-mode
;  auto-complete-mode (lambda ()
;                       (if (not (minibufferp (current-buffer)))
;                           (auto-complete-mode 1))
;                       ))
;(real-global-auto-complete-mode t)


(defadvice split-window-vertically
    (after my-window-splitting-advice first () activate)
    (set-window-buffer (next-window) (other-buffer)))

; TODO make this more general; it's goddamn useful
(add-hook 'c-mode-common-hook
          (lambda ()
            (auto-fill-mode 1)
            (set (make-local-variable 'fill-nobreak-predicate)
                 (lambda ()
                   (not (eq (get-text-property (point) 'face)
                            'font-lock-comment-face))))))

; more org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(global-set-key "\C-xp" 'previous-multiframe-window)
(setq require-final-newline t)

(setq c-default-style "k&r" c-basic-offset 2)
;; I'm actually otbs but eh close enough.

; fuck tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;(setq default-major-mode 'text-mode)

(setq text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 78)

(setq info-mode-hook 'visual-mode)

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(setq TeX-PDF-mode t)

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
                        ("\\.texinfo$" . texinfo-mode)
                        ("\\.lsp$" . lisp-mode)
                        ("\\.y$" . c-mode)
                        ("\\.cc$" . c-mode)
                        ("\\.hs$" . haskell-mode)
                        ("\\.cpp$" . c++-mode)
                        ("\\.py$" . python-mode)
                        ("\\.org$" . org-mode)
                        ("\\.java$" . java-mode)
                        ("\\.txt$" . text-mode)
                        ("[]>:/]\\..*emacs" . emacs-lisp-mode)
                        ("Makefile" . makefile-mode)
                        (".bashrc" . shell-script-mode)
                        (".bash_profile" . shell-script-mode)
                        (".bash_aliases" . shell-script-mode)
                        ("\\.sh$" . shell-script-mode)
                        ("/mutt" . mail-mode)
                        ("\\.xml$" . xml-mode)
                        ("\\.sml$" . sml-mode)
                        ("\\.awk$" . awk-mode)
                        ("\\.ml$" . sml-mode)))

(setq sml-program-name "/usr/bin/poly")

(setq completion-ignored-extensions
      (append completion-ignored-extensions
              (quote
               (".bak" 
                "~" 
                ".CKP" 
                ".aux" 
                ".otl" 
                ".err" 
                ".lib" 
                ".dvi" 
                ".PS" 
                ".o" 
                ".pdf" 
                ".log")
               )
              )
      )

;; (if (eq window-system 'x)
;;     (if (x-display-color-p)
;; 	(progn
;; 	  (require 'font-lock)
;; 	  (add-hook 'emacs-lisp-mode-hook 'font-lock-mode)
;; 	  (add-hook 'c++-mode-hook 'font-lock-mode)
;; 	  (add-hook 'c-mode-hook 'font-lock-mode)
;; 	  (add-hook 'perl-mode-hook 'font-lock-mode)
;; 	  (add-hook 'java-mode-hook 'font-lock-mode)
;; 	  )
;;       )
;;   )

(when (fboundp 'global-font-lock-mode)
  (require 'font-lock)
  (setq font-lock-maximum-decoration t)
  (global-font-lock-mode t)
  )

(setq auto-save-interval 1024)

(setq explicit-shell-file-name "/bin/bash")

(setq line-move-visual 'nil)
(setq track-eol 1)

(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;; (add-to-list 'load-path (expand-file-name "/home/frozencemetery/sage-4.6.1/data/emacs"))
;; (require 'sage "sage")
;; (setq sage-command "/home/frozencemetery/sage-4.6.1/sage")

;; ;; If you want sage-view to typeset all your output and have plot()
;; ;; commands inline, uncomment the following line and configure sage-view:
;; (require 'sage-view "sage-view")
;; (add-hook 'sage-startup-hook 'sage-view)
;; ;; You can use commands like
;; (add-hook 'sage-startup-hook 'sage-view
;; ;; 'sage-view-disable-inline-output 'sage-view-disable-inline-plots)
;; ;; to have some combination of features.  In future, the customize interface
;; ;; will make this simpler... hint, hint!

(load "/home/frozencemetery/.emacs.d/ats-mode.el")

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(global-font-lock-mode 1)

(show-paren-mode 1)

(menu-bar-mode 0)

(setq scroll-step 1)

(fset 'yes-or-no-p 'y-or-n-p)

(setq TeX-PDF-mode t)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inferior-lisp-program "sbcl")
 '(notmuch-fcc-dirs (quote true)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-latex-math-face ((((class color) (background light)) (:foreground "green")))))

(require 'icicles)
(icy-mode 1)

(setq TeX-output-view-style
      (quote
       (("^pdf$" "." "evince -f %o")
        ("^html?$" "." "iceweasel %o"))))
(slime-setup  '(slime-repl slime-asdf slime-fancy slime-banner))
