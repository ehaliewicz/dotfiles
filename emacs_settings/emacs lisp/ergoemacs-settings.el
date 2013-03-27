;;;
;;; ergoemacs-settings.el
;;;

;; load ergoemacs
(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "colemak")
(add-to-list 'load-path (concat user-emacs-directory "emacs lisp/ergoemacs-keybindings/"))
(load "~/.emacs.d/emacs lisp/ergoemacs-keybindings/ergoemacs-mode")
;; turn off ergoemacs keybindings
(ergoemacs-mode 0)

;; Single char cursor movement. (assuming you are on qwerty)
(global-set-key (kbd "M-n") 'backward-char)
(global-set-key (kbd "M-i") 'forward-char)
(global-set-key (kbd "M-u") 'previous-line)
(global-set-key (kbd "M-e") 'next-line)
(global-set-key (kbd "M-SPC") 'set-mark-command)

;; kicking the habit
(global-unset-key (kbd "C-b")) ; backward-char
(global-unset-key (kbd "C-f")) ; forward-char
(global-unset-key (kbd "C-p")) ; previous-line
(global-unset-key (kbd "C-n")) ; next-line
(global-unset-key (kbd "C-SPC")) ; set-mark-command

; kicking the habit
(global-unset-key (kbd "M-f")) ; forward-word
(global-unset-key (kbd "M-b")) ; backward-word
(global-unset-key (kbd "M-d")) ; kill-word
(global-unset-key (kbd "C-<backspace>")) ; backward-kill-word
(global-unset-key (kbd "C-d")) ; delete-char

;; move by word
(global-set-key (kbd "M-l") 'backward-word)
(global-set-key (kbd "M-y") 'forward-word) ; was (prefix)

;; Delete previous/next char.
(global-set-key (kbd "M-s") 'delete-backward-char)
(global-set-key (kbd "M-t") 'delete-char)

; Delete previous/next word.
(global-set-key (kbd "M-f") 'backward-kill-word)
(global-set-key (kbd "M-p") 'kill-word)

(setq next-line-add-newlines t)

;; a minor mode to keep keybindings from being overridden
;;(global-unset-key (kbd "M-n"))
;;(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode-keymap.")

;;(define-key my-keys-minor-mode-map (kbd "M-n") 'backward-char)
