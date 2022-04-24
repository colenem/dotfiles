;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; treemacs toggle keybinding
(map! :leader
      :desc "Toggle treemacs" "T n" #'treemacs)

;; disable emacs quit confirmation
(setq confirm-kill-emacs nil)
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "PT Mono" :size 15))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'seti)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Develop/syncthing/Develop/syncthing/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; always follow symlinks when clicked
(setq vc-follow-symlinks t)

;; we use spaces only in this household!
(setq-default indent-tabs-mode nil)

;; tab setting of 4 spaces
(setq-default tab-width 4)


;; whitespace settings
(global-whitespace-mode t)
(set-face-attribute 'whitespace-tab nil
                    :background 'unspecified
                    :foreground "#5E5E5E")
(set-face-attribute 'whitespace-space nil
                    :background 'unspecified
                    :foreground "#5E5E5E")


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; telephone line config
(use-package! telephone-line
  :ensure t
  :init (progn
          (require 'telephone-line))
  :config (progn
            (setq telephone-line-primary-left-separator 'telephone-line-gradient
                  telephone-line-secondary-left-separator 'telephone-line-nil
                  telephone-line-primary-right-separator 'telephone-line-gradient
                  telephone-line-secondary-right-separator 'telephone-line-nil)
            (setq telephone-line-height 24
                  telephone-line-evil-use-short-tag t)
            (telephone-line-mode t)))

;; treemacs -- ignore files referenced in .gitignore
(after! treemacs
  (treemacs-git-mode 'extended)
  (add-to-list 'treemacs-pre-file-insert-predicates #'treemacs-is-file-git-ignored?))

  ;; Org mode keyword config
(after! org
  (setq org-log-done 'time)
  (setq org-todo-keywords
        '((sequence "TODO" "IN PROGRESS" "STAGING" "NEXT" "NICETOHAVE" "NEEDSFIX" "BLOCKED" "TRYFIX" "IGNORE" "WONTFIX" "|" "DONE")))
  (setq org-todo-keyword-faces
        '(("TODO" :foreground "#00A0C5" :weight bold)
          ("IN PROGRESS" :foreground "#B0EE34" :weight bold)
          ("STAGING" :foreground "#8A2BE2" :weight bold)
          ("NEXT" :foreground "#FFC238" :weight bold :height)
          ("NICETOHAVE" :foreground "#FE68C3" :weight bold)
          ("NEEDSFIX" :foreground "#FFEA87" :weight bold)
          ("TRYFIX" :foreground "#FF4900" :weight bold)
          ("IGNORE" :foreground "#FF3838" :weight bold)
          ("WONTFIX" :foreground "#FF3838" :weight bold)
          ("BLOCKED" :background "#B50202" :foreground "#ffffff" :weight bold)
          ("DONE" :background "#00D939" :foreground "#ffffff" :weight bold)
          )))

;; Custom colors for php and web mode
(custom-set-faces!
  '(font-lock-comment-face :foreground "#5e5e5e")
  '(font-lock-doc-face :foreground "#7f848e" :slant normal)
  '(mode-line :background "#0D1011" :foreground "#D4D7D6" :underline nil)
  '(php-keyword :foreground "#d666ed")
  '(php-doc-annotation-tag :foreground "#d666ed")
  '(php-import-declaration :foreground "#d666ed")
  '(php-constant :foreground "#d19a66")
  '(php-function-call :foreground "#61afef")
  '(php-operator :foreground "#2bbac5")
  '(php-php-tag :foreground "#e05561")
  '(php-variable-name :foreground "#e05561")
  '(php-variable-sigil :foreground "#e05561")
  '(web-mode-doctype-face :foreground "#d19a66" :slant italic :weight bold)
  '(web-mode-function-call-face :foreground "#2bbac5")
  '(web-mode-html-attr-name-face :foreground "#d19a66" :slant normal)
  '(web-mode-html-tag-bracket-face :foreground "#abb2bf")
  '(web-mode-html-tag-face :foreground "#e05561")
  '(whitespace-line :background nil :foreground nil))
