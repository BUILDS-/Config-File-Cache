(load "/home/george/.lib/emacs/ats-mode.el")
(load "/home/george/.lib/emacs/rainbow-delimiters.el")

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(setq text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 78)

(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

(defun my-java-mode-hook ()
  (setq c-basic-offset 2))
(add-hook 'java-mode-hook 'my-java-mode-hook)

(setq require-final-newline t)

(setq-default indent-tabs-mode nil)


(menu-bar-mode 0)
