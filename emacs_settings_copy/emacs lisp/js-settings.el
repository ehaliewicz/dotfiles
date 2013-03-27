;;;
;;;  javascript-settings.el
;;;



;; (when (not (equalp 'windows-nt system-type))
;;   (require 'auto-complete)
;;   ;; autocomplete stuff
;;   (setq auto-complete-dir (concat user-emacs-directory "elpa/auto-complete-1.4/"))
;;   (add-to-list 'load-path auto-complete-dir)
;;   (require 'auto-complete-config)
;;   (add-to-list 'ac-dictionary-directories (concat auto-complete-dir "dir/"))
;;   (setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
;;   (ac-config-default)
;;   (global-auto-complete-mode t)
;;   (ac-flyspell-workaround)

;;   ;; flymake and jslint stuff
;;   (add-to-list 'load-path (concat user-emacs-directory "emacs lisp/jslint-v8"))
;;   (require 'flymake-jslint)
;;   (add-hook 'Javascript-mode-hook
;;             (lambda () (flymake-mode-t)))
;;   (add-hook 'js-mode-hook
;;             (lambda () (flymake-mode t)))



  
;;   ;; js comint
;;   (require 'js-comint)
;;   ;; use node as our repl
;;   (setq inferior-js-program "node")
;;   (setq inferior-js-program-command "node")

;;   (setq inferior-js-mode-hook
;;       (lambda ()
;;         ;; We like nice colors
;;         (ansi-color-for-comint-mode-on)
;;         ;; Deal with some prompt nonsense
;;         (add-to-list 'comint-preoutput-filter-functions
;;                      (lambda (output)
;;                        (replace-regexp-in-string ".*1G\.\.\..*5G" "..."
;;                      (replace-regexp-in-string ".*1G.*3G" "&gt;" output)))))))
