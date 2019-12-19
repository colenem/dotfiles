;;; packages.el --- user-plugins layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Colene McFarlane <colenemcfarlane@SC-C2VFG1E2DHJF>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `user-plugins-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `user-plugins/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `user-plugins/pre-init-PACKAGE' and/or
;;   `user-plugins/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst user-plugins-packages
  '(
    editorconfig
    evil-smartparens
    php-mode
    ;;mmm-mode
    multi-web-mode
    telephone-line)
    ;etags-table)
  "The list of Lisp packages required by the user-plugins layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun user-plugins/init-editorconfig()
  (use-package editorconfig
    :ensure t
    :config
    (editorconfig-mode 1)))

(defun user-plugins/init-evil-smartparens()
  (use-package evil-smartparens
    :ensure t
    :pin melpa))

(defun user-plugins/init-php-mode()
  (use-package php-mode
  :pin melpa
  :init (require 'php-mode)))

;; (defun user-plugins/init-mmm-mode()
;;   (use-package mmm-mode
;;     :pin melpa
;;     :init (require 'mmm-mode)
;;     :config (progn
;;               (setq mmm-global-mode 'maybe)
;;               (mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php))))

(defun user-plugins/init-multi-web-mode()
  (use-package multi-web-mode
    :pin melpa
    :init (progn
            (require 'multi-web-mode))
            ;; (set-face-attribute
            ;;  'web-mode-html-tag-face nil :foreground "#61afef"
            ;;  'web-mode-attr-name-face nil :foreground "#e06c75"))
            ;; (set-face-foreground 'web-mode-html-tag-face "61afef")
            ;; (set-face-foreground 'web-mode-attr-name-face "#e06c75"))
    :config (progn
              (setq mweb-default-major-mode 'web-mode)
              ;;(setq mweb-default-major-mode 'html-mode)
              ;; (spacemacs|use-package-add-hook web-mode
              ;;   :post-config
              ;;   (set-face-attribute 'web-mode-html-tag-face nil :foreground "#10d0ff")
              ;;   (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "#10d0ff")
              ;;   (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "LightCoral")
              ;;   (set-face-attribute 'web-mode-html-attr-value-face nil :foreground "wheat1")
              ;;   (set-face-attribute 'web-mode-block-delimiter-face nil :inherit nil :background nil :foreground "plum"))
              ;; (spacemacs|use-package-add-hook php-mode
              ;;   :post-config
              ;;   (set-face-attribute 'font-lock-preprocessor-face nil :inherit 'web-mode-block-delimiter-face)
              ;;   (set-face-attribute 'php-string nil :inherit 'web-mode-html-attr-value-face))
              (setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                                (js2-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                                (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
              (setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
              (multi-web-global-mode 1))))

;; (defun user-plugins/init-etags-table()
;;   (use-package etags-table
;;     :pin melpa
;;     :config (progn
;;               ))
;;   )

(defun user-plugins/init-telephone-line()
  (use-package telephone-line
    :pin melpa
    :init (require 'telephone-line-config)
    :config (progn
              (setq telephone-line-primary-left-separator 'telephone-line-flat
              ;; (setq telephone-line-primary-left-separator 'telephone-line-gradient
                    telephone-line-secondary-left-separator 'telephone-line-flat
                    telephone-line-primary-right-separator 'telephone-line-flat
                    ;; telephone-line-primary-right-separator 'telephone-line-gradient
                    telephone-line-secondary-right-separator 'telephone-line-flat)
              ;;(setq telephone-line-height 24)
              (telephone-line-evil-config))))

;;; packages.el ends here
