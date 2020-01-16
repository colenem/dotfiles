;;; packages.el --- user-themes layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: colene <colene@colene-pc>
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
;; added to `user-themes-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `user-themes/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `user-themes/pre-init-PACKAGE' and/or
;;   `user-themes/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst user-themes-packages
  '(
    (aanila-theme       :location "/home/colene/Develop/dotfiles/emacs/themes")
    (Amelie-theme       :location "/home/colene/Develop/dotfiles/emacs/themes")
;;;    (blackboard-theme   :location "/home/colene/Develop/dotfiles/emacs/themes")
    atom-one-dark-theme
    distinguished-theme
    seoul256-theme
    )
  "The list of Lisp packages required by the user-themes layer.

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

(defun user-themes/init-aanila-theme()
  (use-package aanila-theme
    :ensure nil))

(defun user-themes/init-Amelie-theme()
  (use-package Amelie-theme
    :ensure nil))

;;;(defun user-themes/init-blackboard-theme()
;;;  (use-package blackboard-theme
;;;    :ensure nil
;;;    :defer t))

(defun user-themes/init-atom-one-dark-theme()
  (use-package atom-one-dark-theme
    :defer t
    :config
    (set-face-background 'font-lock-comment-face 'unspecified)))

(defun user-themes/init-distinguished-theme()
  (use-package distinguished-theme
    :defer t))

(defun user-themes/init-seoul256-theme()
  (use-package seoul256-theme
    :demand
    :init
    (setq seoul256-background 233)))

;;; packages.el ends here
