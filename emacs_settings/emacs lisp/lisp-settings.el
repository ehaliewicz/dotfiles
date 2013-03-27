;;;
;;; lisp-settings.el
;;;

(if (not (equalp 'windows-nt system-type))
  ;; load slime
    (progn (add-hook 'lisp-mode-hook (lambda () (progn (paredit-mode t) (slime-mode t))))
           (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
           (setq slime-net-coding-system 'utf-8-unix)

           (setq slime-lisp-implementations
                 '((sbcl ("/usr/bin/sbcl" "--dynamic-space-size" "4096") :coding-system utf-8-unix)))
           (load (expand-file-name "~/code/quicklisp/slime-helper.el"))
           (setq lisp-indent-function 'common-lisp-indent-function
                 slime-complete-symbol-function 'slime-fuzzy-complete-symbol
                 common-lisp-hyperspec-root "file:///home/erik/code/lisp/HyperSpec/"
                 slime-startup-animation t)

           

           (add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
           "Stop SLIME's REPL from grabbing DEL,
 which is annoying when backspacing over a '('"
           (defun override-slime-repl-bindings-with-paredit ()
             (define-key slime-repl-mode-map
                 (read-kbd-macro paredit-backward-delete-key) nil))

           (add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit))

    (progn (add-hook 'lisp-mode-hook (lambda () (progn (paredit-mode t) (slime-mode t))))
           (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

           (setq slime-lisp-implementations
                 '((ccl ("C:/Users/erik/Desktop/ccl/wx86cl64.exe"))
                   (ccl32 ("C:/Users/erik/Desktop/ctcl/wx86cl.exe"))))
           (load (expand-file-name "E:/code/quicklisp/slime-helper.el"))
           (setq lisp-indent-function 'common-lisp-indent-function
                 slime-complete-symbol-function 'slime-fuzzy-complete-symbol
                 slime-startup-animation t)))

  (add-hook 'emacs-lisp-mode-hook 'paredit-mode)


