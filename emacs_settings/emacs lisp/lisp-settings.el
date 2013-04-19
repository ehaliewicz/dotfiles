;;;
;;; lisp-settings.el
;;;

(cond ((eql 'gnu/linux system-type) 
       ;; load slime
       (progn (add-hook 'lisp-mode-hook (lambda () (progn (paredit-mode t) (slime-mode t))))
              (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
              (setq slime-net-coding-system 'utf-8-unix)

              (setq slime-lisp-implementations
                    '((sbcl ("/usr/bin/sbcl" "--core" "/home/erik/code/sbcl.core-with-swank" "--dynamic-space-size" "4096")
                       :init (lambda (port-file _)
                               (format "(swank:start-server %S)\n" port-file))))) ;("sbcl" "--dynamic-space-size" "4096" :coding-system utf-8-unix)
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

              (add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)))

      ((eql 'windows-nt system-type)

       (progn (add-hook 'lisp-mode-hook (lambda () (progn (paredit-mode t) (slime-mode t))))
              (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

              (setq slime-lisp-implementations
                    '((ccl ("C:/Users/erik/Desktop/ccl/wx86cl64.exe"))
                      (ccl32 ("C:/Users/erik/Desktop/ctcl/wx86cl.exe"))))
              (load (expand-file-name "E:/code/quicklisp/slime-helper.el"))
              (setq lisp-indent-function 'common-lisp-indent-function
                    slime-complete-symbol-function 'slime-fuzzy-complete-symbol
                    slime-startup-animation t)))
      ((eql 'darwin system-type) t))

  (add-hook 'emacs-lisp-mode-hook 'paredit-mode)


(modify-syntax-entry (string-to-char "[") "(]" lisp-mode-syntax-table)
(modify-syntax-entry (string-to-char "]") ")[" lisp-mode-syntax-table)


(require 'ob)
(require 'ob-tangle)

(add-to-list 'org-babel-tangle-lang-exts '("lisp" . "lisp"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '(;(emacs-lisp . t)
   
   (lisp . t)))


(require 'ob-lisp)

(defun org-babel-execute:common-lisp (body params)
  "Evaluate a block of Common Lisp code with Babel."
  (if (fboundp 'slime-eval)
      (slime-eval `(swank:interactive-eval-region ,body))
      (if (fboundp lisp-eval-string)
          (lisp-eval-string body)
          (error "You have to start a lisp repl first!"))))


(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate nil)
(setq org-export-babel-evaluate nil)
(setq org-src-window-setup 'current-window)
(setq inferior-lisp-program "sbcl")

(define-skeleton org-skeleton
    "Header info for a emacs-org file"
  "Title: "
  "#+TITLE:" str " \n"
  "#+AUTHOR: Erik Haliewicz\n"
  "#+email: ehal256@gmail.com\n"
  "#+STARTUP:indent\n"
  "-----")

(global-set-key [C-S-f4] 'org-skeleton)

(setq org-export-html-style-extra "<style type=\"text/css\">pre {\n    border: 1pt solid #AEBDCC;\n   color:white;\n background-color: #000000;\n     padding: 5pt;\n font-family: courier, monospace;\n        font-size: 90%;\n        overflow:auto;\n  } </style>")


(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)

(setq nrepl-hide-special-buffers t)

(setq nrepl-tab-command 'indent-for-tab-command)
(setq nrepl-popup-stacktraces-in-repl t)
(add-hook 'clojure-mode-hook 'nrepl-interaction-mode)
(add-hook 'nrepl-mode-hook 'subword-mode)
(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'org-mode-hook 'paredit-mode)
