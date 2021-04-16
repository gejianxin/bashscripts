;; This file provide wih functions of automatically installing packages
(setq setup-packages-file  (expand-file-name "$PACKAGE_SETUP_FILE" "$EMACS_DIR"))

;; A list of packages to ensure are installed at launch
(setq my-packages
      '(
            ace-window
            auctex
            counsel-projectile
            default-text-scale
            ein
            elpy
            emms
            ess
            flycheck
            htmlize
            jedi
            julia-mode
            magit
            multiple-cursors
            org2blog
            org-bullets
            org-drill
            org-drill-table
            org-plus-contrib
            py-autopep8
            slime
            smartparens
            try
            use-package
            web-mode
            which-key
            yasnippet
       ))

(load setup-packages-file nil :nomessage) ; Load the packages

(add-to-list 'default-frame-alist '(font . "Source Code Pro-13"))
(set-face-attribute 'default t :font "Source Code Pro-13")
(set-default-font "Source Code Pro-11")

(setq package-enable-at-startup nil)

(require 'org)
(require 'use-package)
(org-babel-load-file (expand-file-name "$EMACS_CONFIG_FILE" "$EMACS_DIR"))
(put 'emms-browser-delete-files 'disabled nil)"