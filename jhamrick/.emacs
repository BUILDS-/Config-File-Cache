(modify-frame-parameters nil '((wait-for-wm . nil)))

;;;;;;;;;;;;;
;; INCLUDE ;;
;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/plugins")

;;;;;;;;;;;;;;;
;; FUNCTIONS ;;
;;;;;;;;;;;;;;;

; unfill a paragraph, i.e., make it so the text does not wrap in the
; paragraph where the cursor is
(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

; unfill a region, i.e., make is so the text in that region does not
; wrap
(defun unfill-region ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-region (region-beginning) (region-end) nil)))

; uncomment a region
(defun uncomment-region (beg end &optional arg)
   (interactive "*r\np")
   (comment-region beg end (- arg)))

;;;;;;;;;;
;; LOAD ;;
;;;;;;;;;;

; load pymacs functionalities
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

; load ropemacs
(pymacs-load "ropemacs" "rope-")

; load pylint
(autoload 'python-pylint "python-pylint")
(autoload 'pylint "python-pylint")

; load pep8
(autoload 'python-pep8 "python-pep8")
(autoload 'pep8 "python-pep8")

;;;;;;;;;;;;;;;;;;
;; DEPENDENCIES ;;
;;;;;;;;;;;;;;;;;;

; auto complete 
(require 'auto-complete) 

(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/ac-dict")

; auto complete configuration
(require 'auto-complete-config) 

; python stuff
(require 'ipython)
(setq py-python-command-args '( "-colors" "Linux"))

(require 'python-mode) 
(provide 'python-programming)

(require 'haskell-mode)

; GPG encryption/decryption
(require 'epa-file) 

; church
(require 'church)

;;;;;;;;;;;;;;;;;
;; KEYBINDINGS ;;
;;;;;;;;;;;;;;;;;

; bind this key to dynamic abbreviation expanding
(global-set-key "\C-u" 'dabbrev-expand)

; window modifications
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

; comment/uncomment codes
(global-set-key "\C-c\C-d" 'comment-region)
(global-set-key "\C-c\C-v" 'uncomment-region)

;;set the keybinding so that you can use f4 for goto line
(global-set-key [f4] 'goto-line)

;;;;;;;;;;;;;;;;;;;
;; CONFIGURATION ;;
;;;;;;;;;;;;;;;;;;;

; use the default autocomplete configuration
(ac-config-default)

; enable encryption
(epa-file-enable)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; EMACS CUSTOMIZATION ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(current-language-environment "English")
 '(font-lock-maximum-decoration t)
 '(global-auto-complete-mode t)
 '(global-font-lock-mode t nil (font-lock))
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(line-number-mode t)
 '(menu-bar-mode nil)
 '(mouse-wheel-mode t nil (mwheel))
 '(py-smart-indentation nil)
 '(python-guess-indent nil)
 '(quack-fontify-style (quote emacs))
 '(quack-pretty-lambda-p nil)
 '(quack-run-scheme-always-prompts-p nil)
 '(quack-smart-open-paren-p t)
 '(quack-switch-to-scheme-method (quote own-frame))
 '(quack-warp-pointer-to-frame-p nil)
 '(ropemacs-enable-autoimport t)
 '(show-paren-mode t nil (paren))
 '(tool-bar-mode nil nil (tool-bar))
 '(transient-mark-mode t)
 '(weblogger-config-alist (quote (("default" "http://jhamrick.mit.edu/xmlrpc.php" "admin" "" "1")))))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;
;; MODES ;;
;;;;;;;;;;;

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
