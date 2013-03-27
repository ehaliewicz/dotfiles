;;;
;;;  package-settings.el
;;;

;; ensure that packages are installed
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)

 (add-to-list 'package-archives
              '("ELPA" . "http://tromey.com/elpa/") t)

 (add-to-list 'package-archives
              '("gnu" . "http://elpa.gnu.org/packages/") t)
(package-initialize)

 (when (not package-archive-contents)
   (package-refresh-contents))

;; ergoemacs-keybindings
 (defvar my-packages '(starter-kit starter-kit-lisp starter-kit-eshell erc zenburn)
   "A list of packages to ensure are installed at launch.")

 (dolist (p my-packages)
   (when (not (package-installed-p p))
     (package-install p)))
