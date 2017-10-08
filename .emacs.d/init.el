;; add load-pass function
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "elisp" "conf" "public_repos")


;; custom file configure
(setq custom-file (locate-user-emacs-file "custom.el"))
;; if custom file does not exist, make custom file
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
;; load custom file
(load custom-file)


;; package.el configure
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(package-initialize)


;; init-loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")
