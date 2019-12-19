(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t) ;; melpa stable
(add-to-list 'package-archives '("melpa"        . "https://melpa.org/packages/") t)        ;; melpa bleeding edge
(add-to-list 'package-archives '("marmalade"    . "https://marmalade-repo.org/packages/")) ;; marmalade

;; add to plugins and theme folders to our load path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/emacs.d/plugins/")
(package-initialize)

;; install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(require 'use-package)
(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

;;;;;;;;;;;;;;;;;;
;; custom setup ;;
;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-screen t)          ;; disable splash screen
(global-linum-mode t)                    ;; enable line number display
(tool-bar-mode -1)                       ;; disable pesky toolbar
(global-set-key "\C-x\C-b" 'buffer-menu) ;; open buffer menu instead of showing list in new window
(setq-default indent-tabs-mode nil)      ;; always spaces never tabs
(setq-default tab-width 4)               ;; tab width of 4
(electric-indent-mode 1)                 ;; indent on newline
(set-frame-parameter (selected-frame) 'alpha '(85 . 50)) ;; transparent background
(add-to-list 'default-frame-alist '(alpha  . (85  . 50)))
(add-to-list 'initial-frame-alist '(width  . 140)) ;; default and initial window sizes of emacs (not on start)
(add-to-list 'initial-frame-alist '(height . 73))
(add-to-list 'default-frame-alist '(width  . 140))
(add-to-list 'default-frame-alist '(height . 73))

(add-hook 'lisp-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline)))

(use-package seoul256-theme
  :init (progn
	  (setq seoul256-background 233)))

;; company mode for autocompletion
(use-package company
  :ensure t
  :defer t
  :pin melpa-stable
  :diminish company-mode
  :init (add-hook 'after-init-hook 'global-company-mode))
  ;:config
  ;  (use-package company-tern
  ;    :init (add-to-list 'company-backends 'company-tern)))

;; mini descriptions for autocompletion
(use-package company-quickhelp
  :ensure t
  :defer t
  :pin melpa-stable
  :init (add-hook 'global-company-mode-hook 'company-quickhelp-mode))

;; php syntax highlighting
(use-package php-mode
  :ensure t
  :demand t
  :pin melpa-stable
  ;:mode ("\\.php$" . php-mode)
  ;:init (progn
          ;(require 'php-mode)
         ;(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
  ;       (add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))))
          ;(add-hook 'php-mode-hook 'web-mode)
          ;(add-hook 'php-mode-hook 'php-enable-wordpress-coding-style))
  :init
  (require 'php-mode))

(use-package web-mode
  :ensure t
  :defer t
  :pin melpa
  ;:mode (("\\.php\\" . php-mode)
         ;("\\.blade\\.php\\" . web-mode))
         ;("\\.\\(html\\|htm\\)$" . web-mode))
  :config (progn
            (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
            (add-to-list 'auto-mode-alist '("\\.\\(html\\|php\\)$'" . web-mode))
            (add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))
            (add-hook 'web-mode-hook
                      (lambda()
                        (setq web-mode-markup-indent-offset    4)
                        (setq web-mode-css-indent-offset       4)
                        (setq web-mode-code-indent-offset      4)
                        (setq web-mode-enable-css-colorization t)))))

(use-package helm
  :ensure helm
  :init (progn
	  (require 'helm-config)
	  (setq helm-candidate-number-limit 100)
	  (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
		helm-input-idle-delay 0.01  ; this actually updates things reeeelatively quickly.
		helm-yas-display-key-on-candidate t
		helm-quick-update t
		helm-M-x-requires-pattern nil
		helm-ff-skip-boring-files t))
  :config (progn
            (helm-mode 1))
  :diminish helm-mode)

(use-package flycheck
  :ensure t
  :pin melpa-stable
  :init (global-flycheck-mode))

(use-package yasnippet
  :ensure yasnippet
  :pin melpa
  :init (setq yas-verbosity 1)
  :config (progn
	    (yas-global-mode 1))
  :diminish yas-minor-mode)

(use-package neotree
  :ensure neotree
  :pin melpa
  :config (progn
	    (global-set-key (kbd "M-n") 'neotree-toggle)))

(use-package telephone-line
  :ensure t
  :pin melpa
  :init (progn
        (setq telephone-line-primary-left-separator    'telephone-line-gradient
              telephone-line-secondary-left-separator  'telephone-line-nil
              telephone-line-primary-right-separator   'telephone-line-gradient
              telephone-line-secondary-right-separator 'telephone-line-nil)
        (setq telephone-line-height 24
              telephone-line-evil-use-short-tag t)
        (telephone-line-mode 1)))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :init (progn
          (require 'smartparens-config)
          smartparens-global-mode))

(use-package smart-tabs-mode
  :ensure t
  :demand t)

(use-package js2-mode
  :ensure t
  :pin melpa-stable
  :mode ("\\.js\\'" . js2-mode)
  :init
  (setq js2-highlight-level 3
        js2-mode-show-parse-errors t
        js2-basic-offset 4))
  


;;; .emacs ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b0984818158ff2fa3ae511a2f3db7ea239a223d1dc09475c6c2ccdbc8ee03dd3" "a81bc918eceaee124247648fc9682caddd713897d7fd1398856a5b61a592cb62" "ef36c3f55ef51d6b67d09a698ee89890c8106402e6b32edbfe88b6f66d642fa2" default)))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(js2-highlight-level 3 t)
 '(package-selected-packages
   (quote
    (mmm-mode js2-mode seoul256-theme yasnippet web-mode use-package undo-tree telephone-line smartparens smart-tabs-mode php-mode neotree ivy hydra helm flycheck evil-unimpaired company-tern company-quickhelp auto-compile aggressive-indent adaptive-wrap ace-window)))
 '(php-mode-coding-style (quote wordpress)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
