;; church.el
;; ============================================================================
;; 
;; 03/17/09 frank jaekel 
;;          based on quack.el and some inspiration from cmuscheme.el
;;
(setq quack-global-menu-p nil)
(require 'quack)

;; add church keywords to quack's fontify list
;; ----------------------------------------------------------------------------
(setq church-keywords-to-fontify 
      '("lambda" "if" "mem" "get-current-environment" "quote" "eval" "apply"
        "define" "begin" "let" "let*" "named-let" "case" "cond" 
        "first" "rest" "pair" "list" "list-ref" "list-elt" "length" "append"
        "null?" "list?" "iota" "make-list" "ist->vector" "vector->list" 
        "vector-ref" "number?" "exp" "log" "expt" "modulo" "min" "max" "flip"
        "log-flip" "sample-integer" "sample-discrete" "poisson" "beta" "gamma"
        " exponential" "uniform" "no-proposals" "eq?" "equal?" "gensym" "and" 
        "or" "xor" "not" "mem-rec" "marg" "Y" "uniform-draw" "multinomial" 
        "second" "third" "fourth" "fifth" "sixth" "seventh" "all" "any" 
        "product" "sum" "repeat" "fold" "reverse" "map" "multi-map" "filter" 
        "rejection-query" "rejection-lex-query" "DPmem" "PYmem" "dirichlet"
        "make-multinomial-dirichlet" "make-symmetric-multinomial-dirichlet"
        "mh-lex-query" "repeated-mh-lex-query" "tempered-mh-lex-query" 
        "church"))

;; overwrite Quack's keyword definitions
(setq quack-pltish-keywords-to-fontify 
      (append church-keywords-to-fontify
              quack-pltish-keywords-to-fontify))

(setq quack-emacsish-keywords-to-fontify 
      (append church-keywords-to-fontify
              quack-pltish-keywords-to-fontify))

;; let's change some of the default settings for Quack
;; ----------------------------------------------------------------------------
(setq quack-default-program "ikarus")
(setq quack-fontify-style (quote plt))
(setq quack-pretty-lambda-p nil)
(setq quack-programs 
 (append quack-programs
  '("ikarus" 
    "ssh -t alonzo@nospoon.mit.edu ikarus")))
; -t for ssh is important so the remote process is treated as a terminal and
; gets killed when your emacs session is killed. Otherwise you will have dead
; ikarus processes remaining

;; make sure that passwords are not shown
;; ----------------------------------------------------------------------------
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;; add some funtions that deal with sending stuff to the scheme process
;; ----------------------------------------------------------------------------

;; find the outermost function in which a point start is wrapped; for this
;; we need to find the beginning and the end of the string first; for this we 
;; use beginning-of-defun (C-M-a) and beackward-sexp (C-M-b)... 
;; if we are at top-level and outside a function we get the beginning of the 
;; previous function

(defun church-sexp-name-start (start)
  (save-excursion (goto-char start)
		  (backward-sexp) 
		  (forward-word 1) 
		  (backward-word 1) 
		  (point)))

(defun church-sexp-name-end (start)
  (save-excursion (goto-char start)
		  (backward-sexp) 
		  (forward-word 1) 
		  (point)))

(defun church-sexp-name (start)
  (buffer-substring 
   (church-sexp-name-start start) 
   (church-sexp-name-end start)))

(defun church-function-name-start (start)
  (save-excursion (goto-char start)
		  (beginning-of-defun) 
		  (forward-word 1) 
		  (backward-word 1) 
		  (point)))

(defun church-function-name-end (start)
  (save-excursion (goto-char start)
		  (beginning-of-defun) 
		  (forward-word 1) 
		  (point)))

(defun church-function-name (start)
  (buffer-substring 
   (church-function-name-start start) 
   (church-function-name-end start)))

(defun church-end-of-function (start)
  (save-excursion (goto-char start)
		  (beginning-of-defun)
		  (end-of-defun)
		  (point)))

(defun church-end-of-next-function (start)
  (save-excursion (goto-char (church-end-of-function start))
                  (end-of-defun)
                  (point)))

;; is there a church expression at the top-level anywhere in a region?
(defun church-region-has-church-expression (start end)
  "Check whether region contains (church ...)."
  (interactive "r")
  (if (>= start end)
      (if (string= (church-sexp-name start) "church")
	  t
	  nil)
      (if (string= (church-sexp-name start) "church")
          t
          (church-region-has-church-expression
	   (church-end-of-next-function start) end))))

;; see whether a region needs a church wrapper
(defun church-region-is-inside-church (start end)
  "Check whether a region is in a church wrapper."
  (interactive "r")
  ; check whether the outer-most function name is "church"
  (if (string= (church-function-name start) "church")
      ; if the actual region is inside church
      (if (and (> start (church-function-name-end start)) 
               (> (church-end-of-function start) end))
          ; return true
          t 
          ; otherwise false
          nil)
      nil))

;; try to be clever in deciding whether a region needs a church wrapper
;; before being sent to the scheme buffer
(defun church-needed (start end)
  "Do we need a church wrapper when we send this region to scheme?"
  (interactive "r")
  ; if there is no church expression in the file we definitely need to wrap it
  (if (not (church-region-has-church-expression (point-min) (point-max)))
      t
      (church-region-is-inside-church start end)))

;; send a region to the scheme process and try to be clever about
;; whether the region is wrapped in church or not
(defun church-send-region (start end)
  "If necessary wrap region in church and send it to inferior scheme process."
  (interactive "r")
  (if (church-needed start end)
      (let ()
	(comint-send-string (scheme-proc) "(set! CHURCH-MODE-ENV")
        (comint-send-string (scheme-proc) " (church-with-env ")
	(comint-send-region (scheme-proc)    start end)
	(comint-send-string (scheme-proc) "  CHURCH-MODE-ENV))\n")
        (message "Wrapped in (church-with-env ...) and sent to scheme."))
      (let ()
        (comint-send-region (scheme-proc) start end)
        (comint-send-string (scheme-proc) "\n")
        (message "Sent to scheme."))))

;; the same thing as the previous version but without the environment
;; passed... just plain church
(defun church-send-region-without-env (start end)
  "Wrap region in church and send it to inferior scheme process."
  (interactive "r")
  (if (church-needed start end)
      (let ()
        (comint-send-string (scheme-proc) "(church ")
	(comint-send-region (scheme-proc)   start end)
	(comint-send-string (scheme-proc) ")\n")
        (message "Wrapped in (church ...) and sent to scheme."))
      (let ()
        (comint-send-region (scheme-proc) start end)
        (comint-send-string (scheme-proc) "\n")
        (message "Sent to scheme."))))

;; send a region wrapped in church without the clever check whether it is
;; needed... just always wrap it
(defun church-send-region-without-check (start end)
  "Wrap region in church and send it to inferior scheme process."
  (interactive)
  (comint-send-string (scheme-proc) "(set! CHURCH-MODE-ENV")
  (comint-send-string (scheme-proc) " (church-with-env ")
  (comint-send-region (scheme-proc)    start end)
  (comint-send-string (scheme-proc) "  CHURCH-MODE-ENV))\n")
  (message "Wrapped in (church-with-env ...) and sent to scheme."))
     
(defun church-send-last-sexp ()
  "Send last sexp to inferior scheme process, wrapped in church if needed."
  (interactive)
  (church-send-region (save-excursion (backward-sexp) (point)) (point)))

(defun church-send-last-sexp-without-env ()
  "Send the last sexp but wrap it in a fresh church."
  (interactive)
  (church-send-region-without-env
   (save-excursion (backward-sexp) (point)) (point)))

(defun church-send-last-sexp-without-check ()
  "Send the last sexp to inferior scheme process but wrap it in church."
  (interactive)
  (church-send-region-without-check
   (save-excursion (backward-sexp) (point)) (point)))

(defun church-send-function ()
  "Send current definition to scheme process, wrapped in church if needed."
  (interactive)
  (church-send-region 
   (save-excursion (end-of-defun) (backward-sexp) (point)) 
   (save-excursion (end-of-defun) (point))))
  
(defun church-send-buffer ()
  "Send whole buffer to scheme process, wrapped in churched if needed."
  (interactive)
  (message "Buffer sent to scheme.")
  (if (church-region-has-church-expression (point-min) (point-max))
	(let ((b (buffer-substring (point-min) (point-max))))
	  (call-interactively 'run-scheme)
	  (comint-send-string (current-buffer) b)
	  (comint-send-string (current-buffer) "\n"))
        (let ((b (buffer-substring (point-min) (point-max))))
	  (call-interactively 'run-scheme)
	  (comint-send-string (current-buffer) "(set! CHURCH-MODE-ENV")
	  (comint-send-string (current-buffer) " (church-with-env ")
	  (comint-send-string (current-buffer) b)
	  (comint-send-string (current-buffer) " CHURCH-MODE-ENV))\n"))))

(defun church-send-buffer2 ()
  "Send the whole buffer to inferior scheme process."
  (interactive)
  (message "Buffer sent to scheme.")
  (scheme-send-region (point-min) (point-max)))

(defun church-send-init ()
  "Get a fresh church environment."
  (interactive)
  (comint-send-string (scheme-proc) "(import (church church))\n")
  (comint-send-string (scheme-proc) "(define CHURCH-MODE-ENV")
  (comint-send-string (scheme-proc) " (setup-environment))\n")
  (comint-send-string (scheme-proc) "(set! CHURCH-MODE-ENV")
  (comint-send-string (scheme-proc) " (church-with-env ")
  (comint-send-string (scheme-proc) " (load \"standard-preamble.church\")")
  (comint-send-string (scheme-proc) " CHURCH-MODE-ENV))\n")
  (message "Sent command to initialize church environment: CHURCH-MODE-ENV"))

(defun run-church ()
  "Run scheme and initialize church."
  (interactive)
  (call-interactively 'run-scheme)
  (comint-send-string (current-buffer) "(import (church church)) \n")
  (comint-send-string (current-buffer) "(define CHURCH-MODE-ENV")
  (comint-send-string (current-buffer) " (setup-environment))\n")
  (comint-send-string (current-buffer) "(set! CHURCH-MODE-ENV")
  (comint-send-string (current-buffer) " (church-with-env ")
  (comint-send-string (current-buffer) " (load \"standard-preamble.church\")")
  (comint-send-string (current-buffer) " CHURCH-MODE-ENV))\n")
  (message "Run church and initialize church environment.")) 

(defun run-church-with-restart ()
  "Run scheme and initialize church."
  (interactive)
  (if (comint-check-proc "*scheme*")
      (comint-send-string (scheme-proc) "(exit)\n"))
  (while (comint-check-proc "*scheme*"))
  (call-interactively 'run-scheme)
  (comint-send-string (current-buffer) "(import (church church)) \n")
  (comint-send-string (current-buffer) "(define CHURCH-MODE-ENV")
  (comint-send-string (current-buffer) " (setup-environment))\n")
  (comint-send-string (current-buffer) "(set! CHURCH-MODE-ENV")
  (comint-send-string (current-buffer) " (church-with-env ")
  (comint-send-string (current-buffer) " (load \"standard-preamble.church\")")
  (comint-send-string (current-buffer) " CHURCH-MODE-ENV))\n")
  (message "Run church and initialize church environment.")) 

(defun church-about ()
  "About"
  (interactive)
  (message "To find out more about Church check out http://scripts.mit.edu/~droy/church"))

;; define spiffy shortcuts to eval stuff in church 
;; ----------------------------------------------------------------------------
(defvar church-mode-map nil)
; get a fresh copy of scheme-mode-map so that we don't just point to old map
(setq church-mode-map (copy-keymap scheme-mode-map)) 

; overwrite some scheme definitions
(define-key church-mode-map "\C-x\C-e" 'church-send-last-sexp) 
(define-key church-mode-map "\C-c\C-r" 'church-send-region)
(define-key church-mode-map "\C-c\C-b" 'church-send-buffer)
(define-key church-mode-map "\C-c\C-e" 'church-send-function)
(define-key church-mode-map "\C-c\C-c" 'run-church)
;(define-key church-mode-map "\C-c\C-i" 'church-init)
(define-key church-mode-map "\C-c\M-c" 'run-church-with-restart)

;; make a nice menu (also sits in church-mode-map)
;; ----------------------------------------------------------------------------

; get rid of Quack's scheme menu
(define-key church-mode-map [menu-bar scheme] nil)

; define our own Church menu
(defconst church-mode-menuspec
  `("Church"
    ("Quack Global" ,@(cdr quack-global-menuspec))
    "---"
    ["Toggle Lambda Syntax"           quack-toggle-lambda]
    ["Tidy Buffer Formatting"         quack-tidy-buffer]
    ["Comment-Out Region"             comment-region]
    ["Un-Comment-Out Region"          quack-uncomment-region]
    "---"
    ["Eval Last S-expression"         church-send-last-sexp]
    ["Eval Region"                    church-send-region]
    ["Eval Last Definition"           church-send-function]
    ["Eval Buffer"                    church-send-buffer]
    "---"
    ["Run Scheme and Init Church"     run-church]
    ;["Init Church Environment"        church-send-init]
    ["Restart Scheme and Church"      run-church-with-restart]
    "---"
    ["About"                          church-about]))

; write menu to the church-mode-map keymap 
(defvar church-mode-menu)
(quack-when-gnuemacs
 (let ((map (make-sparse-keymap)))
   (setq church-mode-menu nil)
   (easy-menu-define church-mode-menu map ""
     church-mode-menuspec)
   (define-key church-mode-map [menu-bar church]
     (cons "Church"
           (or (lookup-key map [menu-bar Church])
               (lookup-key map [menu-bar church]))))))

;; make a new mode for church and register .church files
;; ----------------------------------------------------------------------------

; this is copying everything from scheme-mode (with Quack modifications)
(define-derived-mode church-mode scheme-mode "Church"
   "Major mode to edit .church files."
   ; make sure we use the church keymap (with menus) as defined above
   (use-local-map church-mode-map)
)

; usually you would add .church files like this  
(setq auto-mode-alist 
      (cons '("\\.church\\'" . church-mode) auto-mode-alist))

; however, when the interpreter sees #!r6rs at the beginning of file it
; directly switches to scheme-mode (with Emacs.app but not on my linux box)
; so here's a work-around for this that just always loads church-mode for 
; all .church files
(add-hook 'find-file-hooks
          (lambda ()
            (and (buffer-file-name)
                 (string= ".church"
                          (substring (buffer-file-name) -7))
                 (church-mode))))

;; add hooks for church-mode
;; ----------------------------------------------------------------------------

; see quack-shared-mode-hookfunc-stuff in quack.el
(defun church-mode-hookfunc ()

  ; you can put stuff here that you want to be executed when
  ; church-mode is entered

  ; (message "church-mode-hook-func")

  ; give us the same key-bindings as in Quack
  (local-set-key quack-scheme-mode-keymap-prefix quack-scheme-mode-keymap)
 
  ;; Bind the paren-matching keys.
  (local-set-key ")" 'quack-insert-closing-paren)
  (local-set-key "]" 'quack-insert-closing-bracket)

  (local-set-key "(" 'quack-insert-opening-paren)
  (local-set-key "[" 'quack-insert-opening-bracket)

  ;; Steal any find-file bindings.
  (when quack-remap-find-file-bindings-p
    (quack-locally-steal-key-bindings 'find-file     'quack-find-file)
    (quack-locally-steal-key-bindings 'ido-find-file 'quack-find-file))

  ;; Bind Return/Enter key.
  (local-set-key "\r" 'quack-newline)
 
  ;; Display start message
  (church-about)
)

(add-hook 'church-mode-hook 'church-mode-hookfunc)

;; Make church visible to the world
;; ----------------------------------------------------------------------------
(provide 'church)
