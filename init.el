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

;; calamity theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/calamity-theme")
(load-theme 'calamity t)

;; font settings
(when window-system
  (set-face-font 'default "Ubuntu Mono-16"))

;; backup files and directories
(setq backup-directory-alist `(("." . "~/.emacs.d/.backup")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t nil)))
 '(variable-pitch ((t nil))))

;; yes-or-no prompt
(fset 'yes-or-no-p 'y-or-n-p)

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

;; neotree
(add-to-list 'load-path "~/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; ensime
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . js-mode))

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
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(visible-bell nil))

