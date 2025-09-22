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
   fill-column 120
   visual-line-fill-column-mode t

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
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(javascript
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;; better-defaults
     emacs-lisp
     git
     helm
     pdf
     lsp
     ;; websocket
     ;; simple-httpd
     ;; f
     ;; markdown
     multiple-cursors
     ;; (org :variables
     ;;      org-enable-roam-support t
     ;;      org-enable-roam-ui t)
     (shell :variables
            shell-default-height 30
            shell-default-position 'right)
     ;; spell-checking
     syntax-checking
     ;; version-control
     ;; shell
     treemacs
     (org :variables org-enable-roam-support t)
     (org :variables org-enable-roam-ui t)
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      websocket
                                      simple-httpd
                                      olivetti
                                      f
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

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
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
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
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

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

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
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

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
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

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 12.0
                               :weight normal
                               :width normal
                               :poweline-scale 1.0)

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
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

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
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

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

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
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
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

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
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

  ;; Credit to Bernt Hansen for following GDT structure
  ;; see B.Hansens full config at https://doc.norang.ca/org-mode.html
  ;; [0.0] Org Mode Setup
  (global-set-key (kbd "C-c l") #'org-store-link)
  (global-set-key (kbd "C-c a") #'org-agenda)
  (global-set-key (kbd "C-c c") #'org-capture)

  ;; [1.0] Org Mode Agenda (folder level this way, otherwise you get files with C-[)
  (setq org-agenda-files (quote ("~/org/gtd"
                                 "~/org/gtd/jira-projects")))

  ;; [2.0] Org Mode custom keybindings
  (global-set-key (kbd "<f12>") 'org-agenda)
  ;;(global-set-key (kbd "<f5>") 'bh/org-todo)
  ;;(global-set-key (kbd "<S-f5>") 'bh/widen)
  ;;(global-set-key (kbd "<f7>") 'bh/set-truncate-lines)
  (global-set-key (kbd "<f8>") 'org-cycle-agenda-files)
  ;;(global-set-key (kbd "<f9> <f9>") 'bh/show-org-agenda)
  (global-set-key (kbd "<f9> b") 'bbdb)
  (global-set-key (kbd "<f9> c") 'calendar)
  (global-set-key (kbd "<f9> f") 'boxquote-insert-file)
  (global-set-key (kbd "<f9> g") 'gnus)
  ;;(global-set-key (kbd "<f9> h") 'bh/hide-other)
  ;;(global-set-key (kbd "<f9> n") 'bh/toggle-next-task-display)

  ;;(global-set-key (kbd "<f9> I") 'bh/punch-in)
  ;;(global-set-key (kbd "<f9> O") 'bh/punch-out)

  ;;(global-set-key (kbd "<f9> o") 'bh/make-org-scratch)

  (global-set-key (kbd "<f9> r") 'boxquote-region)
  ;;(global-set-key (kbd "<f9> s") 'bh/switch-to-scratch)

  ;;(global-set-key (kbd "<f9> t") 'bh/insert-inactive-timestamp)
  ;;(global-set-key (kbd "<f9> T") 'bh/toggle-insert-inactive-timestamp)

  (global-set-key (kbd "<f9> v") 'visible-mode)
  (global-set-key (kbd "<f9> l") 'org-toggle-link-display)
  ;;(global-set-key (kbd "<f9> SPC") 'bh/clock-in-last-task)
  (global-set-key (kbd "C-<f9>") 'previous-buffer)
  (global-set-key (kbd "M-<f9>") 'org-toggle-inline-images)
  (global-set-key (kbd "C-x n r") 'narrow-to-region)
  (global-set-key (kbd "C-<f10>") 'next-buffer)
  (global-set-key (kbd "<f11>") 'org-clock-goto)
  (global-set-key (kbd "C-<f11>") 'org-clock-in)
  ;;(global-set-key (kbd "C-s-<f12>") 'bh/save-then-publish)
  (global-set-key (kbd "C-c c") 'org-capture)

  ;; (defun bh/hide-other ()
  ;;   (interactive)
  ;;   (save-excursion
  ;;     (org-back-to-heading 'invisible-ok)
  ;;     (hide-other)
  ;;     (org-cycle)
  ;;     (org-cycle)
  ;;     (org-cycle)))

  ;; (defun bh/set-truncate-lines ()
  ;;   "Toggle value of truncate-lines and refresh window display."
  ;;   (interactive)
  ;;   (setq truncate-lines (not truncate-lines))
  ;;   ;; now refresh window display (an idiom from simple.el):
  ;;   (save-excursion
  ;;     (set-window-start (selected-window)
  ;;                       (window-start (selected-window)))))

  ;; (defun bh/make-org-scratch ()
  ;;   (interactive)
  ;;   (find-file "/tmp/publish/scratch.org")
  ;;   (gnus-make-directory "/tmp/publish"))

  ;; (defun bh/switch-to-scratch ()
  ;;   (interactive)
  ;;   (switch-to-buffer "*scratch*"))

  ;; [3.0] Org Mode Task States
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "red" :weight bold)
                ("NEXT" :foreground "blue" :weight bold)
                ("DONE" :foreground "forest green" :weight bold)
                ("WAITING" :foreground "orange" :weight bold)
                ("HOLD" :foreground "magenta" :weight bold)
                ("CANCELLED" :foreground "forest green" :weight bold)
                ("MEETING" :foreground "forest green" :weight bold)
                ("PHONE" :foreground "forest green" :weight bold))))

  ;; [3.1] Org Mode Task TODO State Triggers
  (setq org-todo-state-tags-triggers
        (quote (("CANCELLED" ("CANCELLED" . t))
                ("WAITING" ("WAITING" . t))
                ("HOLD" ("WAITING") ("HOLD" . t))
                (done ("WAITING") ("HOLD"))
                ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

  ;; [4.0] Org Mode Capture Templates
  (setq org-directory "~/org")
  (setq org-default-notes-file "~/org/gtd/slipbox.org")

  ;; I use C-c c to start capture mode
  (global-set-key (kbd "C-c c") 'org-capture)

  ;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
  (setq org-capture-templates
        (quote (("t" "todo" entry (file "~/org/gtd/slipbox.org")
                 "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
                ("r" "respond" entry (file "~/org/gtd/slipbox.org")
                 "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
                ("n" "note" entry (file "~/org/gtd/slipbox.org")
                 "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
                ("j" "Journal" entry (file+datetree "~/org/gtd/journal.org")
                 "* %?\n%U\n" :clock-in t :clock-resume t)
                ("w" "org-protocol" entry (file "~/org/gtd/slipbox.org")
                 "* TODO Review %c\n%U\n" :immediate-finish t)
                ("a" "Appointment" entry (file+datetree "~/org/gtd/journal.org")
                 ,(concat "* %? :meeting:\n"
                          "<%<%Y-%m-%d %a %^{Time}>>")
                 :time-prompt t)
                ("m" "Meeting" entry (file "~/org/gtd/slipbox.org")
                 "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
                ("p" "Phone call" entry (file "~/org/gtd/slipbox.org")
                 "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
                ("h" "Habit" entry (file "~/org/gtd/slipbox.org")
                 "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))
  ;; [4.1] Remove emplty LOGBOOK drawers in captures if they occur
  (defun bh/remove-empty-drawer-on-clock-out ()
    (interactive)
    (save-excursion
      (beginning-of-line 0)
      (org-remove-empty-drawer-at "LOGBOOK" (point))))

  (add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)

  ;; [5.0] Org Mode Refile Setup
                                        ; Targets include this file and any file contributing to the agenda - up to 9 levels deep
  (setq org-refile-targets (quote ((nil :maxlevel . 2)
                                   (org-agenda-files :maxlevel . 2))))

                                        ; Use full outline paths for refile targets - we file directly with IDO
  (setq org-refile-use-outline-path t)

                                        ; Targets complete directly with IDO
  (setq org-outline-path-complete-in-steps nil)

                                        ; Allow refile to create parent tasks with confirmation
  (setq org-refile-allow-creating-parent-nodes (quote confirm))

                                        ; Use IDO for both buffer and file completion and ido-everywhere to t
  (setq org-completion-use-ido t)
  ;;(setq ido-everywhere t)
  ;;(setq ido-max-directory-size 100000)
  ;;(ido-mode (quote both))
                                        ; Use the current window when visiting files and buffers with ido
  ;;(setq ido-default-file-method 'selected-window)
  ;;(setq ido-default-buffer-method 'selected-window)
                                        ; Use the current window for indirect buffer display
  (setq org-indirect-buffer-display 'current-window)

  ;; [5.1] Refile settings
                                        ; Exclude DONE state tasks from refile targets
  (defun bh/verify-refile-target ()
    "Exclude todo keywords with a done state from refile targets"
    (not (member (nth 2 (org-heading-components)) org-done-keywords)))

  (setq org-refile-target-verify-function 'bh/verify-refile-target)
  ;; END Refile Settings

  ;; [6.0] Org-Mode Agenda & Custom Views
  ;; [6.1] Setup
  ;; Do not dim blocked tasks
  (setq org-agenda-dim-blocked-tasks nil)

  ;; Compact the block agenda view
  (setq org-agenda-compact-blocks t)

  ;; Weekly Revier borrowed from System Crafters
  ;; https://systemcrafters.net/org-mode-productivity/custom-org-agenda-views/
                                        ; (setq org-log-done 'time)
                                        ; (setq org-agenda-start-with-log-mode t)
                                        ;
                                        ; (setq org-agenda-custom-commands
                                        ;       '(("w" "Weekly Review"
                                        ;          ((agenda ""
                                        ;                   ((org-agenda-overriding-header "Completed Tasks")
                                        ;                    (org-agenda-skip-function '(org-agenda-skip-entry-if 'nottodo 'done))
                                        ;                    (org-agenda-span 'week)))
                                        ;
                                        ;           (agenda ""
                                        ;                   ((org-agenda-overriding-header "Unfinished Scheduled Tasks")
                                        ;                    (org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                                        ;                    (org-agenda-span 'week)))))))

  ;; Custom agenda command definitions ** RELIES ON CUSTOM FUNCTIONS SEE BERNT HANSEN DOCS **
  ;; (setq org-agenda-custom-commands
  ;;       (quote (("N" "Notes" tags "NOTE"
  ;;                ((org-agenda-overriding-header "Notes")
  ;;                 (org-tags-match-list-sublevels t)))
  ;;               ("h" "Habits" tags-todo "STYLE=\"habit\""
  ;;                ((org-agenda-overriding-header "Habits")
  ;;                 (org-agenda-sorting-strategy
  ;;                  '(todo-state-down effort-up category-keep))))
  ;;               (" " "Agenda"
  ;;                ((agenda "" nil)
  ;;                 (tags "REFILE"
  ;;                       ((org-agenda-overriding-header "Tasks to Refile")
  ;;                        (org-tags-match-list-sublevels nil)))
  ;;                 (tags-todo "-CANCELLED/!"
  ;;                            ((org-agenda-overriding-header "Stuck Projects")
  ;;                             (org-agenda-skip-function 'bh/skip-non-stuck-projects)
  ;;                             (org-agenda-sorting-strategy
  ;;                              '(category-keep))))
  ;;                 (tags-todo "-HOLD-CANCELLED/!"
  ;;                            ((org-agenda-overriding-header "Projects")
  ;;                             (org-agenda-skip-function 'bh/skip-non-projects)
  ;;                             (org-tags-match-list-sublevels 'indented)
  ;;                             (org-agenda-sorting-strategy
  ;;                              '(category-keep))))
  ;;                 (tags-todo "-CANCELLED/!NEXT"
  ;;                            ((org-agenda-overriding-header (concat "Project Next Tasks"
  ;;                                                                   (if bh/hide-scheduled-and-waiting-next-tasks
  ;;                                                                       ""
  ;;                                                                     " (including WAITING and SCHEDULED tasks)")))
  ;;                             (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
  ;;                             (org-tags-match-list-sublevels t)
  ;;                             (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-sorting-strategy
  ;;                              '(todo-state-down effort-up category-keep))))
  ;;                 (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
  ;;                            ((org-agenda-overriding-header (concat "Project Subtasks"
  ;;                                                                   (if bh/hide-scheduled-and-waiting-next-tasks
  ;;                                                                       ""
  ;;                                                                     " (including WAITING and SCHEDULED tasks)")))
  ;;                             (org-agenda-skip-function 'bh/skip-non-project-tasks)
  ;;                             (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-sorting-strategy
  ;;                              '(category-keep))))
  ;;                 (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
  ;;                            ((org-agenda-overriding-header (concat "Standalone Tasks"
  ;;                                                                   (if bh/hide-scheduled-and-waiting-next-tasks
  ;;                                                                       ""
  ;;                                                                     " (including WAITING and SCHEDULED tasks)")))
  ;;                             (org-agenda-skip-function 'bh/skip-project-tasks)
  ;;                             (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-sorting-strategy
  ;;                              '(category-keep))))
  ;;                 (tags-todo "-CANCELLED+WAITING|HOLD/!"
  ;;                            ((org-agenda-overriding-header (concat "Waiting and Postponed Tasks"
  ;;                                                                   (if bh/hide-scheduled-and-waiting-next-tasks
  ;;                                                                       ""
  ;;                                                                     " (including WAITING and SCHEDULED tasks)")))
  ;;                             (org-agenda-skip-function 'bh/skip-non-tasks)
  ;;                             (org-tags-match-list-sublevels nil)
  ;;                             (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
  ;;                             (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)))
  ;;                 (tags "-REFILE/"
  ;;                       ((org-agenda-overriding-header "Tasks to Archive")
  ;;                        (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
  ;;                        (org-tags-match-list-sublevels nil))))
  ;;                nil))))

  ;; [7.0] Org-Mode Time Clock Setup ** RELIES ON CUSTOM FUNCTIONS, SEE BERN HANSEN, SKIPPING**
  ;; format string used when creating CLOCKSUM lines and when generating a
  ;; time duration (avoid showing days)
  ;; Resume clocking task when emacs is restarted
  ;; (org-clock-persistence-insinuate)
  ;; ;;
  ;; ;; Show lot of clocking history so it's easy to pick items off the C-F11 list
  ;; (setq org-clock-history-length 23)
  ;; ;; Resume clocking task on clock-in if the clock is open
  ;; (setq org-clock-in-resume t)
  ;; ;; Change tasks to NEXT when clocking in
  ;; ;;(setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
  ;; ;; Separate drawers for clocking and logs
  ;; (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
  ;; ;; Save clock data and state changes and notes in the LOGBOOK drawer
  ;; (setq org-clock-into-drawer t)
  ;; ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
  ;; (setq org-clock-out-remove-zero-time-clocks t)
  ;; ;; Clock out when moving task to a done state
  ;; (setq org-clock-out-when-done t)
  ;; ;; Save the running clock and all clock history when exiting Emacs, load it on startup
  ;; (setq org-clock-persist t)
  ;; ;; Do not prompt to resume an active clock
  ;; (setq org-clock-persist-query-resume nil)
  ;; ;; Enable auto clock resolution for finding open clocks
  ;; (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
  ;; ;; Include current clocking task in clock reports
  ;; (setq org-clock-report-include-clocking-task t)

  ;;   (setq bh/keep-clock-running nil)

  ;;   (defun bh/clock-in-to-next (kw)
  ;;     "Switch a task from TODO to NEXT when clocking in.
  ;; Skips capture tasks, projects, and subprojects.
  ;; Switch projects and subprojects from NEXT back to TODO"
  ;;     (when (not (and (boundp 'org-capture-mode) org-capture-mode))
  ;;       (cond
  ;;        ((and (member (org-get-todo-state) (list "TODO"))
  ;;              (bh/is-task-p))
  ;;         "NEXT")
  ;;        ((and (member (org-get-todo-state) (list "NEXT"))
  ;;              (bh/is-project-p))
  ;;         "TODO"))))

  ;;   (defun bh/find-project-task ()
  ;;     "Move point to the parent (project) task if any"
  ;;     (save-restriction
  ;;       (widen)
  ;;       (let ((parent-task (save-excursion (org-back-to-heading 'invisible-ok) (point))))
  ;;         (while (org-up-heading-safe)
  ;;           (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
  ;;             (setq parent-task (point))))
  ;;         (goto-char parent-task)
  ;;         parent-task)))

  ;;   (defun bh/punch-in (arg)
  ;;     "Start continuous clocking and set the default task to the
  ;; selected task.  If no task is selected set the Organization task
  ;; as the default task."
  ;;     (interactive "p")
  ;;     (setq bh/keep-clock-running t)
  ;;     (if (equal major-mode 'org-agenda-mode)
  ;;         ;;
  ;;         ;; We're in the agenda
  ;;         ;;
  ;;         (let* ((marker (org-get-at-bol 'org-hd-marker))
  ;;                (tags (org-with-point-at marker (org-get-tags-at))))
  ;;           (if (and (eq arg 4) tags)
  ;;               (org-agenda-clock-in '(16))
  ;;             (bh/clock-in-organization-task-as-default)))
  ;;       ;;
  ;;       ;; We are not in the agenda
  ;;       ;;
  ;;       (save-restriction
  ;;         (widen)
  ;;                                         ; Find the tags on the current task
  ;;         (if (and (equal major-mode 'org-mode) (not (org-before-first-heading-p)) (eq arg 4))
  ;;             (org-clock-in '(16))
  ;;           (bh/clock-in-organization-task-as-default)))))

  ;;   (defun bh/punch-out ()
  ;;     (interactive)
  ;;     (setq bh/keep-clock-running nil)
  ;;     (when (org-clock-is-active)
  ;;       (org-clock-out))
  ;;     (org-agenda-remove-restriction-lock))

  ;;   (defun bh/clock-in-default-task ()
  ;;     (save-excursion
  ;;       (org-with-point-at org-clock-default-task
  ;;         (org-clock-in))))

  ;;   (defun bh/clock-in-parent-task ()
  ;;     "Move point to the parent (project) task if any and clock in"
  ;;     (let ((parent-task))
  ;;       (save-excursion
  ;;         (save-restriction
  ;;           (widen)
  ;;           (while (and (not parent-task) (org-up-heading-safe))
  ;;             (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
  ;;               (setq parent-task (point))))
  ;;           (if parent-task
  ;;               (org-with-point-at parent-task
  ;;                 (org-clock-in))
  ;;             (when bh/keep-clock-running
  ;;               (bh/clock-in-default-task)))))))

  ;;   (defvar bh/organization-task-id "eb155a82-92b2-4f25-a3c6-0304591af2f9")

  ;;   (defun bh/clock-in-organization-task-as-default ()
  ;;     (interactive)
  ;;     (org-with-point-at (org-id-find bh/organization-task-id 'marker)
  ;;       (org-clock-in '(16))))

  ;;   (defun bh/clock-out-maybe ()
  ;;     (when (and bh/keep-clock-running
  ;;                (not org-clock-clocking-in)
  ;;                (marker-buffer org-clock-default-task)
  ;;                (not org-clock-resolving-clocks-due-to-idleness))
  ;;       (bh/clock-in-parent-task)))

  ;;   (add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)
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
  (use-package org-roam
    :ensure t
    :load-path "/root/org-roam"
    :init
    (setq org-roam-v2-ack t)
    :custom
    (org-roam-directory "~/org/roam") ; replace with your path
    (org-roam_completion-everywhere t)
    :bind (("C-c n l" . org-roam-buffer-toggle)
           ("C-c n f" . org-roam-node-find)
           ("C-c n i" . org-roam-node-insert)
           :map org-mode-map
           ("C-M-i"   . completion-at-point))
                                        ; global-page-break-lines-mode will break the org-roam buffer
    :hook ( org-roam-mode . (lambda () (global-page-break-lines-mode -1)))
    :config
    (org-roam-setup))

  ;; (use-package websocket
  ;;   :after org-roam)
  ;; (use-package org-roam-ui
  ;;   :after org-roam ;; or :after org
  ;;   ;; normally we recommend hooking orui after org-roam, but since org-roam does not have
  ;;   ;; a hookable mode anymore, you're advised to pick something yourself
  ;;   ;; if you don't care about startup time, use
  ;;   ;; :hook (after-init . org-roam-ui-mode)
  ;;   :config
  ;;   (setq org-roam-ui-sync-theme t
  ;;         org-roam-ui-follow t
  ;;         org-roam-ui-update-on-save t
  ;;         org-roam-ui-open-on-start t))

  (setq org-time-clocksum-format
        '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)) ;;
  (setq org-duration-format (quote h:mm))
  ;; WSL-specific setup
  (when (and (eq system-type 'gnu/linux)
             (getenv "WSLENV"))

    ;; pgtk is only available in Emacs 29+
    ;; without it Emacs fonts don't scale properly on
    ;; HiDPI display
    ;;(if (< emacs-major-version 29)
    ;;    (set-frame-font "Cascadia Code 28")
    ;;  (set-frame-font "Cascadia Code 14"))

    ;; Teach Emacs how to open links in your default Windows browser
    (let ((cmd-exe "/mnt/c/Windows/System32/cmd.exe")
          (cmd-args '("/c" "start")))
      (when (file-exists-p cmd-exe)
        (setq browse-url-generic-program  cmd-exe
              browse-url-generic-args     cmd-args
              browse-url-browser-function 'browse-url-generic
              search-web-default-browser 'browse-url-generic))))
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
   '(org-safe-remote-resources
     '("\\`https://0xbadc0fee\\.github\\.io\\(?:/\\|\\'\\)" "\\`https://drojas\\.github\\.io\\(?:/\\|\\'\\)" "\\`https://fniessen\\.github\\.io\\(?:/\\|\\'\\)"))
   '(package-selected-packages
     '(citar-denote adaptive-wrap counsel-gtags dap-mode lsp-docker bui ggtags import-js grizzl js-doc js2-refactor multiple-cursors livid-mode nodejs-repl npm-mode skewer-mode js2-mode tern auto-yasnippet flycheck-pos-tip pos-tip helm-c-yasnippet helm-company helm-lsp lsp-origami origami lsp-treemacs lsp-ui lsp-mode pdf-view-restore pdf-tools tablist yasnippet-snippets esh-help eshell-prompt-extras eshell-z multi-term multi-vterm xref shell-pop terminal-here vterm xterm-color olivetti add-node-modules-path company-web web-completion-data company counsel-css counsel swiper ivy emmet-mode helm-css-scss impatient-mode prettier-js pug-mode sass-mode haml-mode scss-mode slim-mode tagedit web-beautify web-mode yasnippet evil-org gnuplot helm-org-rifle htmlize org-cliplink org-contrib org-download org-mime org-pomodoro alert log4e gntp org-present org-projectile org-project-capture org-category-capture org-rich-yank orgit-forge orgit org org-roam-ui fsm simple-httpd websocket org-roam forge yaml markdown-mode ghub closql emacsql treepy git-link git-messenger git-modes git-timemachine gitignore-templates helm-git-grep helm-ls-git smeargle treemacs-magit magit magit-section git-commit with-editor transient seq ws-butler writeroom-mode winum which-key volatile-highlights vim-powerline vi-tilde-fringe uuidgen use-package undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil toc-org term-cursor symon symbol-overlay string-inflection string-edit-at-point spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline space-doc restart-emacs request rainbow-delimiters quickrun popwin pcre2el password-generator paradox overseer org-superstar open-junk-file nameless multi-line macrostep lorem-ipsum link-hint inspector info+ indent-guide hybrid-mode hungry-delete holy-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org helm-mode-manager helm-make helm-descbinds helm-ag google-translate golden-ratio flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu emr elisp-slime-nav elisp-def editorconfig dumb-jump drag-stuff dotenv-mode dired-quick-sort diminish devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile all-the-icons aggressive-indent ace-link ace-jump-helm-line)))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )
  )
