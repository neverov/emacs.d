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

;; tomorrow theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/tomorrow-theme")
(add-to-list 'load-path "~/.emacs.d/themes/tomorrow-theme")
(load-theme 'tomorrow-night-bright t)

;; neotree
(add-to-list 'load-path "~/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

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

;; smooth-scrolling
(add-to-list 'load-path "~/.emacs.d/modules/smooth-scrolling")
(require 'smooth-scrolling)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-interval 10)
 '(auto-save-timeout 10)
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" default)))
 '(desktop-save t)
 '(desktop-save-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(visible-bell nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
