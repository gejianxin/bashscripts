;; $PACKAGE_SETUP_FILE - Package management

(require 'cl)
(require 'package)

;; Set the directory where you want to install the packages
(setq package-user-dir (expand-file-name "elpa/" "$EMACS_DIR"))

;; Add melpa package source when using package list
(setq package-archives '(("gnu-cn" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa-cn" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("melpa-cn-stable" . "https://mirrors.ustc.edu.cn/elpa/melpa-stable/")
                         ("org-cn" . "https://mirrors.ustc.edu.cn/elpa/org/")))

;; Load emacs packages and activate them
;; This must come before configurations of installed packages.
;; Don't delete this line.
(package-initialize)
;; `package-initialize' call is required before any of the below can happen

;; Auto install the required packages
;; Method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

;; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'setup-packages)"