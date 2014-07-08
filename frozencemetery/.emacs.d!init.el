(add-to-list 'load-path "~/.emacs.d")

(setq display-time-24hr-format 1)
(column-number-mode)

(require 'tramp)

(require 'auto-complete-config)
(require 'auto-complete)

(require 'asm-mode)
(add-to-list 'auto-mode-alist '("\\.S$" . asm-mode))

;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                           (auto-complete-mode 1)
                         )))
(real-global-auto-complete-mode t)
(ac-flyspell-workaround)
(define-key ac-complete-mode-map "\t" 'ac-complete)
(define-key ac-complete-mode-map "\r" nil)

(setq x-stretch-cursor nil) ; this seems to be ignored

(defun indent-properly ()
  "Run indent on the buffer"
  (shell-command-on-region (point-min) (point-max) "indent -" t t)
  )
(add-to-list 'auto-mode-alist '("\\.doc\\'" . no-word))

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(add-hook 'c-mode-common-hook
          (lambda ()
            (auto-fill-mode 1)
            (hs-minor-mode)
            (set (make-local-variable 'fill-nobreak-predicate)
                 (lambda ()
                   (not (eq (get-text-property (point) 'face)
                            'font-lock-comment-face
                            ))))))
(setq c-default-style "linux" c-basic-offset 2) ;; ~OTBS
(add-hook 'c++-mode-hook ;; stack overflow made me the man I am today
          (lambda () (setq comment-start "/* " comment-end " */")))

(remove-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(remove-hook 'haskell-mode-hook 'turn-on-simple-indent)
(remove-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 
          (lambda ()
            (local-set-key (kbd "TAB") '(lambda () (interactive) (insert "  ")))
            ))

(defun yank-to-x-clipboard ()
  (interactive)
  (if (region-active-p)
      (progn
        (shell-command-on-region
         (region-beginning)
         (region-end)
         "xsel -b -i")
        (message "Yanked region to clipboard!")
        (deactivate-mark)
        )
    (message "No region active; can't yank to clipboard!")
    ))
(global-set-key "\M-W" 'yank-to-x-clipboard)

(setq require-final-newline t) ; hands down best setting

;; this may cause undesirable "" highlighting
;; it also causes color failure in notmuch-search buffers
;; (show-ws-toggle-show-trailing-whitespace)

;; fuck tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(setq default-major-mode 'text-mode)

(setq text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 78)
(highlight-beyond-fill-column)

(setq info-mode-hook 'visual-mode)

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(setq TeX-PDF-mode t)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-special-ctrl-a t)
(setq org-special-ctrl-e t)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(add-to-list 'auto-mode-alist '(".bash_aliases$" . sh-mode))

(setq completion-ignored-extensions
      (append completion-ignored-extensions
              (list
               ".bak"
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

(global-font-lock-mode 1)

(show-paren-mode 1)

(menu-bar-mode 0)

(setq scroll-step 1)

(fset 'yes-or-no-p 'y-or-n-p)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; ;; load rudel for *obby
;; (defun load-rudel ()
;;   (interactive)
;;   (add-to-list 'load-path "~/.emacs.d/rudel")
;;   (add-to-list 'load-path "~/.emacs.d/rudel/jupiter")
;;   (add-to-list 'load-path "~/.emacs.d/rudel/obby")
;;   (require 'rudel-mode)
;;   (require 'rudel-obby)
;;   (global-rudel-minor-mode)
;;   (global-rudel-header-subscriptions-mode)
;;   (global-rudel-mode-line-publish-state-mode)
;; )

(setq TeX-view-program-list
      '(("zathura" "zathura %o")
        ))
(setq TeX-view-program-selection
      '((output-pdf "zathura")
        ))

(setq TeX-output-view-style
      (quote
       (("^pdf$" "." "zathura %o")
        ("^html?$" "." "iceweasel %o")
        )))

;; (setq inferior-lisp-program 'sbcl)
;; (require 'slime)
;; (slime)
;; (slime-setup '(slime-repl slime-asdf slime-fancy slime-banner))

(setq python-indent 2)

(setq sml-program-name "fml")

(setq uniquify-buffer-name-style 'post-forward)
(require 'uniquify)

(find-file "~/orgmain.org")

(setq message-send-mail-partially-limit 10000000)

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
                  (message-fetch-field "from")
                  ))
               (account
                (cond
                 ;; I use email address as account label in ~/.msmtprc
                 ((string-match "rharwood@club.cc.cmu.edu" from)
                  "rharwood@club.cc.cmu.edu")
                 ((string-match "rharwood@bu.edu" from)
                  "rharwood@bu.edu")
                 ((string-match "rharwood@cmu.edu" from)
                  "rharwood@andrew.cmu.edu")
                 ((string-match "rharwood@andrew.cmu.edu" from)
                  "rharwood@andrew.cmu.edu")
                 ((string-match "threeoften@gmail.com" from)
                  "threeoften@gmail.com")
                 )
                )
               )
          (setq message-sendmail-extra-arguments (list '"-a" account))
          )
        )
    )
  )
(setq message-sendmail-envelope-from 'header)
(add-hook 'message-send-mail-hook 'cg-feed-msmtp)
(setq message-mode-hook 'flyspell-mode)
(define-key notmuch-show-mode-map " "
  (lambda ()
    "restore old space behavior"
    (interactive)
    (notmuch-show-next-thread t)
    )
  )
(define-key notmuch-show-mode-map "r" 'notmuch-show-reply)
(define-key notmuch-show-mode-map "R" 'notmuch-show-reply-sender)
(define-key notmuch-search-mode-map "r" 'notmuch-search-reply-to-thread)
(define-key notmuch-search-mode-map "R"
  'notmuch-search-reply-to-thread-sender
  )
(setq notmuch-show-tag-macro-alist
      (list '("d" "-unread")
            ))
(setq notmuch-search-tag-macro-alist
      (list '("d" "-unread")
            ))
(define-key notmuch-search-mode-map "d"
  (lambda () (interactive)
    (notmuch-search-tag "-unread")
    (notmuch-search-next-thread)
    ))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(haskell-indent-offset 2)
 '(haskell-indentation-starter-offset 2)
 '(mm-text-html-renderer (quote lynx))
 '(notmuch-saved-searches (quote (("inbox" . "tag:inbox") ("unread" . "tag:unread"))))
 '(notmuch-show-insert-text/plain-hook (quote (notmuch-wash-convert-inline-patch-to-part notmuch-wash-wrap-long-lines notmuch-wash-tidy-citations notmuch-wash-elide-blank-lines notmuch-wash-excerpt-citations)))
 '(sml-indent-level 2))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
