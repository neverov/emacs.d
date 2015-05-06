;; melpa
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; eshell PATH mangling
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; fixes strange cursor appearance on MacBook Air
(set-mouse-color "white")

;; define some common mac bindings
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper x)] 'kill-region)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper w)] (lambda () (interactive) (kill-buffer)))
(global-set-key [(hyper z)] 'undo)
(global-set-key [(hyper k)] 'cider-repl-clear-buffer)
(global-set-key [(hyper left)] 'move-beginning-of-line)
(global-set-key [(hyper right)] 'move-end-of-line)
(global-set-key [(hyper f)] 'isearch-forward)

;; remap emacs modifier to mac keys
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'hyper)

;; calamity theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/calamity-theme")
(load-theme 'calamity t)

;; backup files and directories
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; yes-or-no prompt
(fset 'yes-or-no-p 'y-or-n-p)

;; auto reload changed files
(global-auto-revert-mode t)

;; long lines mode
(setq toggle-truncate-lines t)

;; turn on horizontal scrolling with mouse wheel
(global-set-key [wheel-left] '(lambda ()
                                (interactive)
                                (scroll-right 1)))
(global-set-key [wheel-right] '(lambda ()
                                 (interactive)
                                 (scroll-left 1)))

;; ido-vertical-mode
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)

;; ido 
(setq ido-create-new-buffer 'always)

;; startup messages
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; nonexistent buffers
(setq confirm-nonexistent-file-or-buffer nil)

;; kill buffers prompt
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook                  #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook                        #'enable-paredit-mode)
(add-hook 'lisp-mode-hook                        #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook            #'enable-paredit-mode)
(add-hook 'scheme-mode-hook                      #'enable-paredit-mode)
(add-hook 'clojure-mode-hook                     #'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook                  #'enable-paredit-mode)

;; web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-current-element-highlight t)
(web-mode-set-content-type "jsx")
(add-hook 'web-mode-hook
          (lambda ()
            (web-mode-set-content-type "jsx")))

;; ensime
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; projectile
(require 'projectile)
(projectile-global-mode)

;; default window size
(if (window-system)
  (set-frame-size (selected-frame) 124 40))

;; disables stupid ring sound when scrolled to the end of the buffer
(setq ring-bell-function 'ignore)

;; sets default cursor to a thin bar line
(setq-default cursor-type 'bar)

;; auto insert matching brackets
(electric-pair-mode t)

;; selected text is deleted on input
(transient-mark-mode t)
(delete-selection-mode t)

;; autosave on lost focus
(add-hook 'focus-out-hook
	  (lambda ()
	    (save-some-buffers t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-interval 10)
 '(auto-save-timeout 10)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(ensime-sem-high-faces
   (quote
    ((var . scala-font-lock:var-face)
     (val :inherit font-lock-constant-face)
     (varField . scala-font-lock:var-face)
     (valField :inherit font-lock-constant-face)
     (functionCall . font-lock-function-name-face)
     (operator . font-lock-keyword-face)
     (param :inherit font-lock-constant-face)
     (class . font-lock-type-face)
     (trait :inherit font-lock-type-face)
     (object . font-lock-constant-face)
     (package . font-lock-preprocessor-face))))
 '(minimap-buffer-name-prefix "*M*")
 '(minimap-update-delay 0.1)
 '(minimap-window-location (quote right))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(visible-bell nil)
 '(web-mode-block-padding 0)
 '(web-mode-code-indent-offset 2)
 '(web-mode-enable-control-block-indentation nil)
 '(web-mode-markup-indent-offset 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#1d1d1d" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 160 :width normal :foundry "nil" :family "Fira Mono" :antialias "natural")))))

