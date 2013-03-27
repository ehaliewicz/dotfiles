(load "~/code/quicklisp/setup.lisp")
(ql:quickload "cl-fad")
(ql:quickload "trivial-shell")
(ql:quickload "local-time")


(defvar *files-in-local-bin* (cl-fad:list-directory "bin"))
(defvar *files-in-local-config* (cl-fad:list-directory "config"))

(defvar *files-in-bin* (cl-fad:list-directory "~/bin"))
(defvar *files-in-home* (remove-if #'cl-fad:directory-pathname-p (cl-fad:list-directory "~/")))

(defvar *conflicting-bin* (intersection *files-in-local-bin* *files-in-bin* :key #'file-namestring :test #'equal))
(defvar *conflicting-config* (intersection *files-in-local-config* *files-in-home* :key #'file-namestring :test #'equal))

(format t "Copying conflicting files to ./backup~%~%")


(unless (cl-fad:directory-exists-p #P"./backup")
  (format t "Creating backup directory.~%")
  (trivial-shell:shell-command "mkdir backup")
  (trivial-shell:shell-command "mkdir backup/config")
  (trivial-shell:shell-command "mkdir backup/bin"))

(defun deploy-files (list-of-files src-dir target-dir)
  (mapcar (lambda (file) (cl-fad:copy-file (merge-pathnames (file-namestring file) src-dir)
                                       (merge-pathnames (file-namestring file) target-dir)
                                       :overwrite t))
          list-of-files))

(defun make-backups (list-of-files src-dir target-dir)
  (let ((skip-conflicts nil)
        (overwrite-conflicts nil))
    (mapcar (lambda (file) 
              (let* ((copy-target (merge-pathnames file target-dir))
                     (copy-src (merge-pathnames file src-dir)))
                (if (cl-fad:file-exists-p copy-target)
                    (unless skip-conflicts
                      (if overwrite-conflicts
                          (cl-fad:copy-file copy-src copy-target :overwrite t)
                          (progn (format t "Current file ~s already exists in backup.~% Please choose an option to continue. ~%" (file-namestring copy-target))
                                 (format t "[O]verwrite file.~%")
                                 (format t "[OA] Overwrite all conflicting files.~%")
                                 (format t "[R]ename the new file.~%")
                                 (format t "[S]kip this file.~%")
                                 (format t "[SA] Skip all conflicting files.~%")
                                 (tagbody
                                  read                          
                                    (case (read)
                                      (o (cl-fad:copy-file copy-src copy-target :overwrite t))
                                      (r 
                                       (tagbody
                                        filename
                                          (format t "Enter a new filename: ")
                                          (let ((new-copy-target (merge-pathnames (read) target-dir)))
                                            (if (cl-fad:file-exists-p new-copy-target)
                                                (progn
                                                  (format t "File ~s exists in filesytem." new-copy-target)
                                                  (go filename))
                                                (cl-fad:copy-file copy-src new-copy-target :overwrite nil)))))
                                      (s t)
                                      (sa (setf skip-conflicts t))
                                      (oa (setf overwrite-conflicts t))
                                      (otherwise (progn (format t "Please enter a valid selection.~%") (go read))))))))
                    
                    (cl-fad:copy-file copy-src copy-target :overwrite nil))))
            list-of-files)))

(format t "Creating backups.~%")


(make-backups (mapcar #'file-namestring *conflicting-bin*) 
              "~/bin/" "backup/bin/")
(make-backups (mapcar #'file-namestring *conflicting-config*)
              "~/" "backup/config/")



(format t "Deploying files in ~a and ~a to ~a and ~a respectively~%~%" "./bin" "./config" "~/bin" "~/")


(deploy-files *files-in-local-bin* "bin/" "~/bin/")
(deploy-files *files-in-local-config* "config/" "~/")

;;(format t "Copying ~s to ~s~%" "./emacs_settings" "~/.emacs.d")


(format t "Remember to link ~a to ~a.~%" "emacs_settings" "~/.emacs.d")

;; (if (or (cl-fad:directory-exists-p #P"~/.emacs.d") (cl-fad:file-exists-p #P"~/.emacs.d"))
;;     (progn (format t "~s directory or symbolic link already exists. Please choose an option to continue.~%" #P "~/.emacs.d")
;;            (format t "[O]verwrite.~%")
;;            (format t "[S]kip.~%")
;;            (tagbody
;;               read
              
;;               (case (read)
;;                 (o (progn (trivial-shell:shell-command "rm ~/.emacs.d")
;;                           (trivial-shell:shell-command "mkdir ~/.emacs.d")
;;                           (trivial-shell:shell-command "cp -a emacs_settings/. ~/emacs.d/")))
;;                 (s t)
;;                 (otherwise (progn (format t "Please enter a valid selection.~%") (go read))))))
    
;;     (progn
;;       (trivial-shell:shell-command "mkdir ~/.emacs.d")
;;       (trivial-shell:shell-command "cp -a emacs_settings/. ~/emacs.d/")))
