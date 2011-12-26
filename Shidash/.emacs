(menu-bar-mode 0)

(setq display-time-24hr-format 1)
(display-time)

(column-number-mode)

(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/"))))

(fset 'yes-or-no-p 'y-or-n-p)

(setq require-final-newline t)

(setq text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 78)

(global-set-key (kbd "<f8>") 'flyspell-mode)
