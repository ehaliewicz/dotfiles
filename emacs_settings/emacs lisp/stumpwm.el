(defun maybe-connect-stump ()
  "Connect to swank server running in stumpwm's lisp image."
  (interactive)
  ;;  (unless (get-buffer "*slime-repl stumpwm sbcl*")
    (when (y-or-n-p "Connect to Stumpwm swank server? ")
      (slime-connect "127.0.0.1" 4005)))
;;)
