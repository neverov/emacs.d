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

(setenv "PATH" (concat "/usr/local/bin/sbt/bin:" (getenv "PATH")))
(setenv "PATH" (concat "/usr/local/bin/scala/bin:" (getenv "PATH")))

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

;; web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-current-element-highlight t)

;; ensime
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; jsx-mode
(require 'jsx-mode)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(autoload 'jsx-mode "jsx-mode" "JSX mode" t)

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

;; smooth-scrolling
(setq redisplay-dont-pause t
      scroll-margin 7
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1
      mouse-wheel-scroll-amount '(1 ((shift) . 1)))

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
 '(js-indent-level 2)
 '(js3-consistent-level-indent-inner-bracket t)
 '(js3-curly-indent-offset 2)
 '(js3-expr-indent-offset 2)
 '(js3-paren-indent-offset 2)
 '(js3-square-indent-offset 2)
 '(jsx-indent-level 2)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(visible-bell nil)
 '(web-mode-code-indent-offset 2)
 '(web-mode-markup-indent-offset 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#1d1d1d" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 160 :width normal :foundry "nil" :family "Fira Mono")))))
