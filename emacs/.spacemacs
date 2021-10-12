;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     auto-completion
     emacs-lisp
     git
     helm
     html
     javascript
     markdown
     (multiple-cursors :variables multiple-cursors-backend 'evil-mc)
     ( org :variables org-want-todo-bindings t )
     python
     php
     spell-checking
     themes-megapack
     treemacs
     user-plugins
     user-themes
     (xclipboard :variables xclipboard-enable-cliphist t)
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '()

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(slim-mode pug-mode drupal-mode haml-mode counsel-css dap-mode counsel-gtags livid-mode phpcbf php-auto-yasnippets)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(blackboard
                         seoul256
                         aanila
                         Amelie
                         distinguished
                         solarized-wombat-dark
                         spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Fira Mono for Powerline Regular"
                               :size 16.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   ;;dotspacemacs-line-numbers '(:enabled-for-modes 't)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq ispell-program-name "aspell")           ;; use aspell as default dictionary
  (setq vc-follow-symlinks t)                   ;; always follow symlinks, hide prompt
  ;;(setq seoul256-background 233)                ;; use dark background
  (setq-default indent-tabs-mode nil)           ;; always use spaces instead of tabs
  (setq-default tab-width 4)                    ;; tab width of 4 (spaces)
  (setq-default split-height-threshold nil)
  (setq-default split-width-threshold 0)        ;; open in vertical split with C-c o
  (setq even-window-sizes 1)
  (setq-default quelpa-build-tar-executable "/usr/bin/tar")
  (setq org-indent-indentation-per-level 2)
  (setq seoul256-background 233)
 )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (load-theme 'solarized-wombat-dark t)
  (global-whitespace-mode t)
  (set-face-background 'whitespace-line  'nil) ;; change background for whitespace
  (set-face-background 'whitespace-space 'nil) ;; change background for whitespace
  (set-face-background 'whitespace-tab   'nil) ;; change background for whitespace
  (set-face-foreground 'whitespace-line  'nil) ;; change background for whitespace
  (set-face-foreground 'whitespace-space "#5C6370")    ;; change background for whitespace
  (set-face-foreground 'whitespace-tab   "#5C6370")    ;; change background for whitespace
  (set-face-background 'font-lock-comment-face 'nil)
  (add-hook 'org-mode-hook (lambda () (hl-todo-mode -1))) ;;this is messing up task colors
  (setq org-todo-keywords
        '((sequence "TODO" "IN PROGRESS" "NEXT" "NICETOHAVE" "NEEDSFIX" "**BLOCKED**" "TRYFIX" "IGNORE" "WONTFIX" "|" "**DONE**")))
  (setq org-todo-keyword-faces
        '(("TODO" :foreground "#00A0C5" :weight bold)
          ("IN PROGRESS" :foreground "#B0EE34" :weight bold)
          ("NEXT" :foreground "#FFC238" :weight bold)
          ("NICETOHAVE" :foreground "#FE68C3" :weight bold)
          ("NEEDSFIX" :foreground "#FFEA87" :weight bold)
          ("TRYFIX" :foreground "#FF4900" :weight bold)
          ("IGNORE" :foreground "#FF3838" :weight bold)
          ("WONTFIX" :foreground "#FF3838" :weight bold)
          ("**BLOCKED**" :background "#B50202" :foreground "#ffffff" :weight bold)
          ("**DONE**" :background "#00D939" :foreground "#ffffff" :weight bold)
          ))
  (setq seoul256-background 233)
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(ansi-term-color-vector
   [unspecified "#14191f" "#d15120" "#81af34" "#deae3e" "#7e9fc9" "#a878b5" "#7e9fc9" "#dcdddd"])
 '(background-color "#202020")
 '(background-mode dark)
 '(beacon-color "#d54e53")
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#7ec98f")
 '(cua-normal-cursor-color "#7c7c7c")
 '(cua-overwrite-cursor-color "#e5c06d")
 '(cua-read-only-cursor-color "#8ac6f2")
 '(cursor-color "#cccccc")
 '(cursor-type 'bar)
 '(custom-enabled-themes '(seoul256))
 '(custom-safe-themes
   '("845489fb9f7547e6348a80f942402fc7ac7c6854b0accabc49aeddd8cd4a2bd9" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "2296db63b1de14e65390d0ded8e2b5df4b9e4186f3251af56807026542a58201" default))
 '(delete-selection-mode nil)
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-character-color "#202020")
 '(fci-rule-color "#0b0b0b")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(foreground-color "#cccccc")
 '(frame-background-mode 'dark)
 '(fringe-mode 4 nil (fringe))
 '(helm-completion-style 'emacs)
 '(highlight-changes-colors '("#e5786d" "#834c98"))
 '(highlight-parentheses-colors '("#7ec98f" "#e5c06d" "#a4b5e6" "#834c98" "#8ac6f2"))
 '(highlight-symbol-colors
   '("#37422f301f2f" "#22ea312d259d" "#3c102d062b4c" "#23a7185f2777" "#25be3069390f" "#35b22ae41f58" "#2a192d0c36bb"))
 '(highlight-symbol-foreground-color "#8b8b8b")
 '(highlight-tail-colors
   '(("#0b0b0b" . 0)
     ("#183130" . 20)
     ("#183130" . 30)
     ("#183130" . 50)
     ("#323013" . 60)
     ("#323013" . 70)
     ("#341307" . 85)
     ("#0b0b0b" . 100)))
 '(hl-bg-colors
   '("#323013" "#323013" "#323013" "#341307" "#321531" "#183130" "#183130" "#183130"))
 '(hl-fg-colors
   '("#000000" "#000000" "#000000" "#000000" "#000000" "#000000" "#000000" "#000000"))
 '(hl-sexp-background-color "#1c1f26")
 '(linum-format " %7i ")
 '(lsp-ui-doc-border "#8b8b8b")
 '(magit-diff-use-overlays nil)
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style 'chamfer)
 '(nrepl-message-colors
   '("#ffb4ac" "#ddaa6f" "#e5c06d" "#183130" "#e2ffff" "#183130" "#7ec98f" "#e5786d" "#834c98"))
 '(org-src-block-faces
   '(("emacs-lisp"
      (:background "#F0FFF0"))
     ("dot"
      (:foreground "gray50"))))
 '(package-selected-packages
   '(ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit spaceline powerline smeargle skewer-mode simple-httpd scss-mode sass-mode haml-mode restart-emacs rainbow-delimiters popwin phpunit phpcbf php-extras php-auto-yasnippets php-mode persp-mode pcre2el paradox spinner orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-mime org-download org-bullets open-junk-file neotree move-text mmm-mode markdown-toc markdown-mode magit-gitflow magit-popup macrostep lorem-ipsum linum-relative link-hint json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc indent-guide hydra lv hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flyspell-correct-helm flyspell-correct flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit transient git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu emmet-mode elisp-slime-nav dumb-jump f diminish define-word company-web web-completion-data company-tern s dash-functional tern dash company-statistics company column-enforce-mode coffee-mode clean-aindent-mode bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup seoul256-theme))
 '(pos-tip-background-color "#0b0b0b")
 '(pos-tip-foreground-color "#8b8b8b")
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#8ac6f2" "#0b0b0b" 0.2))
 '(telephone-line-mode t)
 '(term-default-bg-color "#000000")
 '(term-default-fg-color "#7c7c7c")
 '(tetris-x-colors
   [[229 192 123]
    [97 175 239]
    [209 154 102]
    [224 108 117]
    [152 195 121]
    [198 120 221]
    [86 182 194]])
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#ffb4ac")
     (40 . "#f3a0bb068dbb")
     (60 . "#ecf0bdf57dd8")
     (80 . "#e5c06d")
     (100 . "#d1fcc2679b35")
     (120 . "#c551c35ab143")
     (140 . "#b610c464c727")
     (160 . "#a327c588dd05")
     (180 . "#8ac6f2")
     (200 . "#89fec7dad1d0")
     (220 . "#8863c85ec150")
     (240 . "#85eec8dcb0cf")
     (260 . "#82a3c956a041")
     (280 . "#7ec98f")
     (300 . "#9131c244b2d6")
     (320 . "#98acbe43c439")
     (340 . "#9f20ba15d58f")
     (360 . "#a4b5e6")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#000000" "#0b0b0b" "#323013" "#ffb4ac" "#183130" "#8ac6f2" "#323013" "#e5c06d" "#183130" "#a4b5e6" "#341307" "#e5786d" "#183130" "#7ec98f" "#7c7c7c" "#5e5e5e"))
 '(window-divider-mode nil)
 '(xterm-color-names
   ["#0b0b0b" "#ffb4ac" "#8ac6f2" "#e5c06d" "#a4b5e6" "#e5786d" "#7ec98f" "#eeeeee"])
 '(xterm-color-names-bright
   ["#000000" "#ddaa6f" "#525252" "#5e5e5e" "#7c7c7c" "#834c98" "#8b8b8b" "#ffffff"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:foreground "#d4d4d4" :background "#000000"))))
 '(font-lock-comment-face ((((class color) (min-colors 89)) (:foreground "#5e5e5e"))))
 '(org-default ((t (:inherit default :family "Fira Mono for Powerline Regular"))))
 '(org-level-1 ((t (:extend nil :foreground "#EB6F6E" :weight normal :height 1.5 :family "Fira Mono for Powerline Regular"))))
 '(org-level-2 ((t (:extend nil :foreground "#D290E4" :weight normal :height 1.35 :family "Fira Mono for Powerline Regular"))))
 '(org-level-3 ((t (:extend nil :foreground "#72BEF2" :weight normal :height 1.25 :family "Fira Mono for Powerline Regular"))))
 '(org-level-4 ((t (:extend nil :foreground "#FFEA87" :weight normal :height 1.17 :family "Fira Mono for Powerline Regular"))))
 '(org-level-5 ((t (:extend nil :foreground "#7ec98f" :weight normal :height 1.17 :family "Fira Mono for Powerline Regular"))))
 '(whitespace-line ((t nil))))
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(custom-safe-themes
   (quote
    ("2296db63b1de14e65390d0ded8e2b5df4b9e4186f3251af56807026542a58201" default)))
 '(package-selected-packages
   (quote
    (ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit spaceline powerline smeargle skewer-mode simple-httpd scss-mode sass-mode haml-mode restart-emacs rainbow-delimiters popwin phpunit phpcbf php-extras php-auto-yasnippets php-mode persp-mode pcre2el paradox spinner orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-mime org-download org-bullets open-junk-file neotree move-text mmm-mode markdown-toc markdown-mode magit-gitflow magit-popup macrostep lorem-ipsum linum-relative link-hint json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc indent-guide hydra lv hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flyspell-correct-helm flyspell-correct flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit transient git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu emmet-mode elisp-slime-nav dumb-jump f diminish define-word company-web web-completion-data company-tern s dash-functional tern dash company-statistics company column-enforce-mode coffee-mode clean-aindent-mode bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup seoul256-theme))))
;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 143 :width normal)))))
