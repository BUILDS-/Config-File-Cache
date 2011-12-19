(setq display-time-24hr-format 1)
(display-time)
(column-number-mode)
(display-battery-mode)
(load "/home/frozencemetery/.emacs.d/sml-modeline/sml-modeline.el")
(require 'sml-modeline)
(sml-modeline-mode)

(defalias 'e 'find-file)
(setq eshell-aliases-file "/home/frozencemetery/.emacs.d/eshell-aliases")

(require 'notmuch)
(add-hook 'message-setup-hook 'mml-secure-message-sign-pgpmime)
(setq message-kill-buffer-on-exit t)
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq sendmail-program "/usr/bin/msmtp")
(require 'bbdb)
(bbdb-initialize 'message)
(bbdb-insinuate-message)
(bbdb-insinuate-w3)
(defun cg-feed-msmtp ()
  (if (message-mail-p)
      (save-excursion
        (let* ((from
                (save-restriction
                  (message-narrow-to-headers)
                  (message-fetch-field "from")))
               (account
                (cond
                 ;; I use email address as account label in ~/.msmtprc
                 ((string-match "rharwood@club.cc.cmu.edu" from)"rharwood@club.cc.cmu.edu")
                 ((string-match "rharwood@bu.edu" from)"rharwood@bu.edu")
                 ((string-match "rharwood@cmu.edu" from)"rharwood@andrew.cmu.edu")
                 ((string-match "rharwood@andrew.cmu.edu" from)"rharwood@andrew.cmu.edu")
                 ((string-match "threeoften@gmail.com" from)"threeoften@gmail.com"))))
          (setq message-sendmail-extra-arguments (list '"-a" account))))))
(setq message-sendmail-envelope-from 'header)
(add-hook 'message-send-mail-hook 'cg-feed-msmtp)
(setq message-mode-hook 'flyspell-mode)
(defun notmuch-show-bury()
  "remove inpile tag"
  (interactive)
  (kill-this-buffer)
  (notmuch-search-remove-tag "inpile")
  (notmuch-search-next-thread)
  (notmuch-search-show-thread)
  )
(define-key notmuch-show-mode-map "a" 'notmuch-show-bury)
(defun notmuch-search-bury()
  "remove inpile tag"
  (interactive)
  (notmuch-search-remove-tag "inpile")
  (notmuch-search-next-thread)
  )
(define-key notmuch-search-mode-map "a" 'notmuch-search-bury)
;; (require 'auto-complete)
;; (add-to-list 'ac-dictionary-directories "/usr/share/auto-complete/dict/")
;; (require 'auto-complete-config)
;; (ac-config-default)
;; (ac-flyspell-workaround)

(add-hook 'c-mode-common-hook
          (lambda ()
            (auto-fill-mode 1)
            (set (make-local-variable 'fill-nobreak-predicate)
                 (lambda ()
                   (not (eq (get-text-property (point) 'face)
                            'font-lock-comment-face))))))
(setq c-default-style "k&r" c-basic-offset 2)
;; I'm actually otbs but eh close enough.

; more org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(global-set-key "\C-xp" 'previous-multiframe-window)
(global-set-key "\C-c;" 'comment-region)
(global-set-key "\C-c:" 'uncomment-region)

(setq require-final-newline t)

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
                        ("\\.cc$" . c++-mode)
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

(setq auto-save-interval 1024)

(setq explicit-shell-file-name "/bin/bash")

(setq line-move-visual 'nil)
(setq track-eol 1)

(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

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
(setq inferior-lisp-program 'clisp)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-latex-math-face ((((class color) (background light)) (:foreground "green")))))

(setq TeX-output-view-style
      (quote
       (("^pdf$" "." "evince -f %o")
        ("^html?$" "." "iceweasel %o"))))
(slime-setup  '(slime-repl slime-asdf slime-fancy slime-banner))

;; notmuch.el sets its variables through custom-set-variables 
;; this is fine, albiet a bit strange
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(notmuch-saved-searches (quote (
                                  ("inpile" . "tag:inpile")
                                  ("unread" . "tag:unread")
                                  ("builds" . "tag:builds")
                                  ("gutenbach" . "tag:gutenbach")
                                  ("cclub" . "tag:cclub")
                                  ("PPP" . "tag:PPP")
                                  ("debian" . "tag:debian")
                                  ("debugs" . "tag:debugs")
                                  ("buildspolitical" . "tag:buildspolitical")
                                  ("buildssecurity" . "tag:buildssecurity")
                                  ("osssec" . "tag:osssec")
                                  ("cypher" . "tag:cypher")
                                  ("ATS" . "tag:ATS")
                                  ("notmuch" . "tag:notmuch")
                                  ("15150ann" . "tag:15150ann")
                                  ("15150disc" . "tag:15150disc")
                                  ("sent" . "tag:sent")
                                  ("csc" . "tag:csc")
                                  ("spam" . "tag:spam and tag:unread")
                                  ))))
