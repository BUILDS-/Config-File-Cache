(modify-frame-parameters nil '((wait-for-wm . nil)))
(add-to-list 'load-path "~/.emacs.d/plugins")

; enables syntax highlighting
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

; bind this key to dynamic abbreviation expanding
(global-set-key "\C-u" 'dabbrev-expand)

; I want these to be available
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

; cmtemplate stuff
(setq auto-mode-alist (cons '("\\.html.otpl$" . html-mode) auto-mode-alist))

;;set the keybinding so that you can use f4 for goto line
(global-set-key [f4] 'goto-line)

(require 'python-mode)
(add-hook 'python-mode-hook
	  (lambda ()
	    (set (make-variable-buffer-local 'beginning-of-defun-function)
		 'py-beginning-of-def-or-class)
	    (setq outline-regexp "def\\|class ")

	    (require 'ipython)
	    (setq py-python-command-args '( "-colors" "Linux"))
	    
	    ;(require 'pymacs)
	    ;(pymacs-load "ropemacs" "rope-")
	    
	    ;(eldoc-mode 1)
	    ;(python-mode 1)

	    (provide 'python-programming)) t)

; python stuff
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(autoload 'python-mode "python-mode" "Python Mode." t)

; auto-complete.el
(require 'auto-complete)
(global-auto-complete-mode t)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/ac-dict")
(ac-config-default)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(current-language-environment "English")
 '(global-font-lock-mode t nil (font-lock))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(mouse-wheel-mode t nil (mwheel))
 '(quack-fontify-style (quote emacs))
 '(quack-pretty-lambda-p nil)
 '(quack-run-scheme-always-prompts-p nil)
 '(quack-smart-open-paren-p t)
 '(quack-switch-to-scheme-method (quote own-frame))
 '(quack-warp-pointer-to-frame-p nil)
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

; tries to enable a keyboard shortcut for uncommenting a region
(defun uncomment-region (beg end &optional arg)
   (interactive "*r\np")
   (comment-region beg end (- arg)))

(global-set-key "\C-c\C-d" 'comment-region)
(global-set-key "\C-c\C-v" 'uncomment-region)

(setq-default line-number-mode 1)
(setq-default transient-mark-mode t)
(setq auto-fill-mode 0)
(setq inhibit-splash-screen t)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(require 'epa-file)
(epa-file-enable)

(require 'weblogger)

(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(defun unfill-region ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-region (region-beginning) (region-end) nil)))
