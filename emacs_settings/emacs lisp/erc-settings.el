
;; erc stuff
(erc-autojoin-mode t)
(require 'erc-fill)
(erc-fill-mode t)
(require 'erc-ring)
(erc-ring-mode t)
(setq erc-log-insert-log-on-open nil)
(setq erc-save-buffer-on-part t)
(setq erc-hide-timestamps nil)
(setq erc-autojoin-channels-alist
      '((".*\\.cyberdynesystems.net" "#japanese.utf8" "#ajatt")
        (".*\\.freenode.net" "#lisp" "#scheme" "#haskell" "#ruby" "#rails")
                                    ;;("quakenet.org")
                                    ))

(require 'erc-dcc)

;; irc server passwords
(require 'erc-services)
(erc-services-mode 1)
(setq erc-prompt-for-nickserv-password nil)

(setf erc-log-channels-directory "~/.erc/logs/")


(defun maybe-start-erc ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (if (get-buffer "irc.cyberdynesystems.net:6667")
      (erc-track-switch-buffer 1)
    (when (y-or-n-p "Start ERC? ")
      (erc :server "irc.freenode.net" :port 6667 :nick "toekutr")
      (erc :server "irc.cyberdynesystems.net" :port 6667 :nick "erik")
      ;;(erc :server "irc.quakenet.org" :port 6667 :nick "toekutr")
      )))
