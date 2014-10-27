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

;; monokai theme
(load-theme 'monokai t)

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

(setq ring-bell-function 
      (lambda ()))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-interval 10)
 '(auto-save-timeout 10)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(mouse-wheel-scroll-amount (quote (1e-11 ((shift) . 1) ((control)))))
 '(tool-bar-mode nil)
 '(visible-bell nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
