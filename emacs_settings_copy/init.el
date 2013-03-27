(require 'cl)

;; auto-generated customizations go in ".emacs-custom.el"
(setq custom-file (concat user-emacs-directory ".emacs-custom.el"))
(load custom-file 'noerror)

(add-to-list 'load-path (concat user-emacs-directory "emacs lisp/"))

;; load these .el files if necessary
(load "erc-settings.el")
(load "org-settings.el")
(load "stumpwm.el")
(load "adoc-mode.el")
(load "package-settings.el")
(load "js-settings.el")
(load "lisp-settings.el")
(load "ergoemacs-settings.el")
(load "actionscript-settings.el")


;; load zenburn
;;(load-theme 'solarized-dark)
(add-to-list 'custom-theme-load-path  (concat user-emacs-directory "themes/"))
(load-theme 'zenburn)
;; line numbers
(load "linum+.el")
(autoload 'linum-mode "linum" "toggle line numbers on/off" t)
(global-set-key (kbd "C-<f5>") 'linum-mode)

;;(global-rainbow-delimiters-mode)



  (add-hook 'after-init-hook
            #'(lambda ()
                (when (locate-library "slime-js")
                  (require 'setup-slime-js))))

(global-set-key [f5] 'slime-js-reload)
(add-hook 'js2-mode-hook
          (lambda ()
            (slime-js-minor-mode 1)))


(add-hook 'coffee-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-d") 'slime-js-coffee-eval-current)
            (local-set-key (kbd "C-c C-b") 'slime-js-coffee-eval-buffer)
            (slime-js-minor-mode 1)))


(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-f") 'er/expand-region)

(eshell)
