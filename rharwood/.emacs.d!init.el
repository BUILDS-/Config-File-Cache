(setq display-time-24hr-format 1)
(display-time)
(column-number-mode)
(display-battery-mode)

(require 'auto-complete-config)
(require 'auto-complete)
;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)
(ac-flyspell-workaround)

(load "/home/frozencemetery/.emacs.d/sml-modeline/sml-modeline.el")
(require 'sml-modeline)
(sml-modeline-mode)

(defalias 'e 'find-file)
(setq eshell-aliases-file "/home/frozencemetery/.emacs.d/eshell-aliases")
(require 'eshell)
(eshell)

(defun indent-properly ()
  "Run indent on the buffer"
  (shell-command-on-region (point-min) (point-max) "indent -" t t))
(add-to-list 'auto-mode-alist '("\\.doc\\'" . no-word))

(add-hook 'c-mode-common-hook
          (lambda ()
            (auto-fill-mode 1)
            (set (make-local-variable 'fill-nobreak-predicate)
                 (lambda ()
                   (not (eq (get-text-property (point) 'face)
                            'font-lock-comment-face))))
            (indent-properly)
            ))
(setq c-default-style "k&r" c-basic-offset 2)
;; I'm actually otbs but eh close enough.

(global-set-key "\C-xp" 'previous-multiframe-window)
(global-set-key "\C-c;" 'comment-region)
(global-set-key "\C-c:" 'uncomment-region)
(defun yank-to-x-clipboard ()
  (interactive)
  (if (region-active-p)
        (progn
          (shell-command-on-region (region-beginning) (region-end) "xsel -b -i")
          (message "Yanked region to clipboard!")
          (deactivate-mark))
    (message "No region active; can't yank to clipboard!")))
(global-set-key "\M-W" 'yank-to-x-clipboard)

(setq require-final-newline t) ; hands down best setting

;; fuck tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(setq default-major-mode 'text-mode)

(setq text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 78)

(setq info-mode-hook 'visual-mode)

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(setq TeX-PDF-mode t)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '(".bash_aliases$" . sh-mode))

(defun no-word ()
  "Run antiword on the entire buffer."
  (shell-command-on-region (point-min) (point-max) "antiword - " t t))
(add-to-list 'auto-mode-alist '("\\.doc\\'" . no-word))

(setq completion-ignored-extensions
      (append completion-ignored-extensions
              (list
               ".bak" 
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
               ".log"
               )))

(setq auto-save-interval 1024)

(setq explicit-shell-file-name "/bin/bash")

(setq line-move-visual 'nil)
(setq track-eol 1)

(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))

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

;; load rudel for *obby
(defun load-rudel ()
  (interactive)
  (add-to-list 'load-path "~/.emacs.d/rudel")
  (add-to-list 'load-path "~/.emacs.d/rudel/jupiter")
  (add-to-list 'load-path "~/.emacs.d/rudel/obby")
  (require 'rudel-mode)
  (require 'rudel-obby)
  (global-rudel-minor-mode)
  (global-rudel-header-subscriptions-mode)
  (global-rudel-mode-line-publish-state-mode)
)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-latex-math-face ((((class color) (background light)) (:foreground "green"))))
 '(font-latex-verbatim-face ((((class color) (background light)) (:inherit fixed-pitch :foreground "yellow")))))
(setq TeX-output-view-style
      (quote
       (("^pdf$" "." "evince -f %o")
        ("^html?$" "." "iceweasel %o"))))

(setq inferior-lisp-program 'clisp)
(require 'slime)
(slime)
(slime-setup '(slime-repl slime-asdf slime-fancy slime-banner))

(setq python-indent 2)
(run-python)

(setq sml-program-name "sml")
;; fuck you
;; sml-mode
;; I want to override your bindings and CAN'T
(global-set-key "\C-c " 'just-one-space)
(global-set-key "\C-c\C- " 'just-one-space)

(setq uniquify-buffer-name-style 'post-forward)
(require 'uniquify)

(find-file "~/orgmain.org")
(find-file "~/sched.org")
(eshell)
(run-sml "sml" "sml")

(require 'notmuch)
(setq notmuch-hello-thousands-separator ',)
(setq notmuch-crypto-process-mime t)
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
;; notmuch.el sets its variables through custom-set-variables 
;; this is fine, albiet a bit strange
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(notmuch-saved-searches (quote (("inbox" . "tag:inbox") ("unread" . "tag:unread"))))
 '(sml-indent-level 2))
