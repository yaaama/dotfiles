;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(add-hook 'emacs-startup-hook ;; Profile emacs startup
  (lambda ()
    (message "*** Emacs loaded in %s with %d garbage collections."
             (format "%.2f seconds"
                     (float-time
                      (time-subtract after-init-time before-init-time)))
             gcs-done)))

;; Silence compiler warnings as they can be pretty disruptive
(setq! comp-async-report-warnings-errors nil)


;; The default is 800 kilobytes.  Measured in bytes.
(setq! gc-cons-threshold (* 50 1000 1000))

(if (boundp 'comp-deferred-compilation)
    (setq! comp-deferred-compilation nil)
    (setq! native-comp-deferred-compilation nil))
;; In noninteractive sessions, prioritize non-byte-compiled source files to
;; prevent the use of stale byte-code. Otherwise, it saves us a little IO time
;; to skip the mtime checks on every *.elc file.
(setq load-prefer-newer noninteractive)
(setq! doom-theme 'doom-horizon)
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq! org-directory "~/org")
(defvar +my/lang-main "en")

(setq! ispell-personal-dictionary "~/.local/share/.ispell_english")


(setq! frame-alpha-lower-limit 100)
;;:weight 'semi-bold
(setq doom-font (font-spec :family "RobotoMono Nerd Font Mono" :size 15 :style "Medium,Regular"))

;; Adds a fancy banner instead of the default ASCII text.
(setq! +doom-dashboard-banner-file (expand-file-name "banner.png" doom-user-dir))
;; Reduces the padding between menu options in the dashboard.
(setq! +doom-dashboard-banner-padding '(0 . 1))
;; Removes the Github icon from the dashboard menu, saving space.
(setq! +doom-dashboard-functions
  '(doom-dashboard-widget-banner
    doom-dashboard-widget-shortmenu
    doom-dashboard-widget-loaded))
;; Redraws the frame when doom dashboard appears
(add-hook! +doom-dashboard-mode-hook 'redraw-frame)



(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…"                ; Unicode ellispis are nicer than "...", and also save /precious/ space
      scroll-margin 2                             ; It's nice to maintain a little margin
      display-time-default-load-average nil)      ; I don't think I've ever found this useful
(display-time-mode 1)                             ; Enable time in the mode-line
(global-subword-mode 1)                           ; Iterate through CamelCase word


(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ;; escape quits everything


;; Making wrapping text global
(setq! +global-word-wrap-mode t)
;; Making vertico only show 12 items, saves some space.
(setq! vertico-count 12)


(when (daemonp)
  (add-hook! '(delete-frame-functions delete-terminal-functions)
    (let ((inhibit-message t))
      (recentf-save-list)
      (savehist-save))))


(setq user-full-name "Sau Yama"
      user-mail-address "sau@yaaama.xyz")
;;(setq-default cursor-type 'box)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq! display-line-numbers-type t)
;; Wraps lines for every mode
(setq! global-visual-line-mode t)
;; Removes the quit prompt asking you if you really want to quit
(setq! confirm-kill-emacs nil)
(setq-default tab-width 2)
(setq-default evil-shift-width tab-width)

;; Making modeline font smaller
(setq! doom-modeline-height 1)
(setq doom-modeline-hud nil)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-unicode-fallback t)
(setq doom-modeline-modal t)
(setq doom-modeline-modal-icon t)
(custom-set-faces
  '(mode-line ((t (:family "RobotoMono Nerd Font Mono" :height 0.95))))
  '(mode-line-active ((t (:family "RobotoMono Nerd Font Mono" :height 0.95)))) ; For 29+
  '(mode-line-inactive ((t (:family "RobotoMono Nerd Font Mono" :height 0.95)))))

;; Making child windows same font size
(setq +helm-posframe-text-scale 0)


(setq-hook! 'cc-mode +format-with-lsp nil)



;; Make WhichKey pop up quicker
(setq which-key-idle-delay 0.5 ;; Default is 1.0
      which-key-idle-secondary-delay 0.05) ;; Default is nil
;; Making evil mode keys into unicode symbols
(setq which-key-allow-multiple-replacements t)
(after! which-key
  (pushnew!
   which-key-replacement-alist
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "◂\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "◃\\1"))))
(setq which-key-allow-imprecise-window-fit nil) ;; Meant to prevent modeline from hiding which key options




;; New STUFF
;;
;; Evil mode
(after! evil
  (setq evil-ex-substitute-global t     ; I like my s/../.. to by global by default
        evil-move-cursor-back nil       ; Don't move the block cursor when toggling insert mode
        evil-kill-on-visual-paste nil)) ; Don't put overwritten text in the kill ring




(after! consult
  (set-face-attribute 'consult-file nil :inherit 'consult-buffer)
  (setf (plist-get (alist-get 'perl consult-async-split-styles-alist) :initial) ";"))



;; Setting title to just be the buffer name and project title if applicable.
;;(setq frame-title-format
;;      '(""
;;        (:eval
;;         (if (s-contains-p org-roam-directory (or buffer-file-name ""))
;;             (replace-regexp-in-string ".*/[0-9]*-?" "☰ "
;;                                       (subst-char-in-string ?_ ?\s buffer-file-name))
;;           "%b"))
;;        (:eval
;;         (when-let* ((project-name (projectile-project-name))
;;                     (project-name (if (string= "-" project-name)
;;                                       (ignore-errors (file-name-base (string-trim-right (vc-root-dir))))
;;                                     project-name)))
;;           (format (if (buffer-modified-p) " ○ %s" " ● %s") project-name)))))




;; Org Download mode to copy and paste images into org files
(require 'org-download)
;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)


;; Nested indents
(setq yas-triggers-in-field t)


(setq org-src-fontify-natively t
    org-src-tab-acts-natively t
    org-confirm-babel-evaluate nil
    org-edit-src-content-indentation 0)


(use-package! devdocs
  :commands (devdocs-lookup devdocs-install)
  :config
  (setq devdocs-data-dir (expand-file-name "devdocs" doom-data-dir)))
(setq org-fold-catch-invisible-edits 'smart ;; try not to accidently do weird stuff in invisible regions
      org-startup-indented t) ;; Enable 'org-indent-mode' by default, override with '+#startup: noindent' for big files


;; LSP stuff
(after! lsp-mode
  (setq lsp-lens-enable t
        lsp-semantic-tokens-enable t ;; hide unreachable ifdefs
        lsp-enable-symbol-highlighting t
        lsp-headerline-breadcrumb-enable t))
        ;; LSP UI related tweaks
       ;; lsp-ui-sideline-enable t
       ;; lsp-ui-sideline-show-hover t
       ;; lsp-ui-sideline-show-symbol nil
       ;; lsp-ui-sideline-show-diagnostics nil
       ;; lsp-ui-sideline-show-code-actions nil)
  



;; Bash LSP
(after! sh-mode
  (use-package! lsp)
  (add-hook 'sh-mode-hook 'shfmt-on-save-mode)
  (setq! lsp-bash-highlight-parsing-errors t))
  ;; TODO: Make tree sitter mode turn on whenever shell mode is on.
  ;;'tree-sitter-hl-mode



(after! haskell-mode
 (require 'hs-lint)
 (defun my-haskell-mode-hook ()
     (local-set-key "\C-cl" 'hs-lint))
 (add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
 (setq! hs-lint-replace-with-suggestions t)
 (setq! lsp-haskell-formatting-provider "fourmolu")
 (setq! lsp-haskell-max-completions 50)
 (setq! lsp-haskell-check-project nil))



(use-package! all-the-icons)
(use-package! all-the-icons-dired)
(after! all-the-icons
  (setcdr (assoc "m" all-the-icons-extension-icon-alist)
          (cdr (assoc "matlab" all-the-icons-extension-icon-alist))))


(setq-default org-download-image-dir "~/media/pix/.orgdownload/")

;;(use-package! info-colors)
;;(use-package! info-colors
;;  :commands (info-colors-fontify-node))






;;(after! dired
;;   (setq dired-listing-switches "-aghogtu --group-directories-first")
;;  ;;(setq! dired-listing-switches "-lhaoguD --group-directories-first")
;;  (setq dired-omit-files "^\\.[^.].*")
;;  (setq dired-omit-verbose nil)
;;  (setq dired-hide-details-hid-symlink-targets nil)
;;  (setq delete-by-moving-to-trash t))

;; (map! )

;;(fset 'evil-visual-update-x-selection 'ignore)



;;(after! haskell-mode
;;  (setq ghc-init "ghc" nil t
;;        ghc-debug "ghc" nil t))


;;(autoload 'ghc-init "ghc" nil t)
;;(autoload 'ghc-debug "ghc" nil t)
;;(add-hook 'haskell-mode-hook (lambda () (ghc-init)))


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))




;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
