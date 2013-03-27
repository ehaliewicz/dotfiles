;-*- coding: utf-8 -*-
;; Shortcuts for ERGOEMACS_KEYBOARD_LAYOUT=colemak
;; Keyboard Layout: Colemak
;; Contributor: Ivan Haralamov ( postivan gmail.com ), “vockets”, Graham Poulter.
;; Creation date: 2009

;;; --------------------------------------------------
;;; CURSOR MOVEMENTS

;; Single char cursor movement
(defconst ergoemacs-backward-char-key			(kbd "M-n"))
(defconst ergoemacs-forward-char-key			(kbd "M-i"))
(defconst ergoemacs-previous-line-key			(kbd "M-u"))
(defconst ergoemacs-next-line-key			(kbd "M-e"))

;; Move by word
(defconst ergoemacs-backward-word-key			(kbd "M-l"))
(defconst ergoemacs-forward-word-key			(kbd "M-y"))

;; Move by paragraph
(defconst ergoemacs-backward-paragraph-key		(kbd "M-L"))
(defconst ergoemacs-forward-paragraph-key		(kbd "M-Y"))

;; Move to beginning/ending of line
(defconst ergoemacs-move-beginning-of-line-key		(kbd "M-h"))
(defconst ergoemacs-move-end-of-line-key		(kbd "M-H"))

;; Move by screen (page up/down)
(defconst ergoemacs-scroll-down-key			(kbd "M-U"))
(defconst ergoemacs-scroll-up-key			(kbd "M-E"))

;; Move to beginning/ending of file
(defconst ergoemacs-beginning-of-buffer-key		(kbd "M-N"))
(defconst ergoemacs-end-of-buffer-key			(kbd "M-I"))

;; isearch
(defconst ergoemacs-isearch-forward-key			(kbd "M-o"))
(defconst ergoemacs-isearch-backward-key		(kbd "M-O"))

(defconst ergoemacs-recenter-key			(kbd "M-;"))

;;; MAJOR EDITING COMMANDS

;; Delete previous/next char.
(defconst ergoemacs-delete-backward-char-key		(kbd "M-s"))
(defconst ergoemacs-delete-char-key			(kbd "M-t"))

; Delete previous/next word.
(defconst ergoemacs-backward-kill-word-key		(kbd "M-f"))
(defconst ergoemacs-kill-word-key			(kbd "M-p"))

; Copy Cut Paste, Paste previous
(defconst ergoemacs-kill-region-key			(kbd "M-x"))
(defconst ergoemacs-kill-ring-save-key			(kbd "M-c"))
(defconst ergoemacs-yank-key				(kbd "M-v"))
(defconst ergoemacs-yank-pop-key			(kbd "M-V"))
(defconst ergoemacs-copy-all-key			(kbd "M-C"))
(defconst ergoemacs-cut-all-key				(kbd "M-X"))

;; undo and redo
(defconst ergoemacs-redo-key				(kbd "M-Z"))
(defconst ergoemacs-undo-key				(kbd "M-z"))

; Kill line
(defconst ergoemacs-kill-line-key			(kbd "M-d"))
(defconst ergoemacs-kill-line-backward-key		(kbd "M-D"))

;;; Textual Transformation

(defconst ergoemacs-mark-paragraph-key			(kbd "M-S-SPC"))
(defconst ergoemacs-shrink-whitespaces-key		(kbd "M-w"))
(defconst ergoemacs-comment-dwim-key			(kbd "M-'"))
(defconst ergoemacs-toggle-letter-case-key		(kbd "M-/"))

; keyword completion, because Alt+Tab is used by OS
(defconst ergoemacs-call-keyword-completion-key		(kbd "M-g"))

; Hard-wrap/un-hard-wrap paragraph
(defconst ergoemacs-compact-uncompact-block-key		(kbd "M-q"))

;;; EMACS'S SPECIAL COMMANDS

; Cancel
(defconst ergoemacs-keyboard-quit-key			(kbd "M-k"))

; Mark point.
(defconst ergoemacs-set-mark-command-key		(kbd "M-SPC"))

(defconst ergoemacs-execute-extended-command-key	(kbd "M-a"))
(defconst ergoemacs-shell-command-key			(kbd "M-A"))

;;; WINDOW SPLITING
(defconst ergoemacs-move-cursor-next-pane-key		(kbd "M-r"))
(defconst ergoemacs-move-cursor-previous-pane-key	(kbd "M-R"))

;;; --------------------------------------------------
;;; OTHER SHORTCUTS

(defconst ergoemacs-switch-to-previous-frame-key        (kbd "M-~"))
(defconst ergoemacs-switch-to-next-frame-key            (kbd "M-`"))

(defconst ergoemacs-query-replace-key                   (kbd "M-5"))
(defconst ergoemacs-query-replace-regexp-key            (kbd "M-%"))

(defconst ergoemacs-delete-other-windows-key            (kbd "M-3"))
(defconst ergoemacs-delete-window-key                   (kbd "M-0"))

(defconst ergoemacs-split-window-vertically-key         (kbd "M-4"))
(defconst ergoemacs-split-window-horizontally-key       (kbd "M-$"))

(defconst ergoemacs-extend-selection-key                (kbd "M-8"))
(defconst ergoemacs-select-text-in-quote-key            (kbd "M-*"))
