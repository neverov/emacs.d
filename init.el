;; melpa
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; monokai theme
(load-theme 'monokai t)

;; solarized theme
;;(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
;;(require 'solarized-dark-theme)

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

;; eshell PATH mangling
;(defun eshell-mode-hook-fun ()
;  (setq eshell-path-env (concat "/usr/local/bin:" eshell-path-env))
;  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
;(add-hook 'eshell-mode-hook 'eshell-mode-hook-fun)

;; default size
(if (window-system)
  (set-frame-size (selected-frame) 124 40))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
