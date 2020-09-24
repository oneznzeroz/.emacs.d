;; ADD REPOS
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

;; if !use-package => install
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

;; init use-package
(eval-when-compile
    (require 'use-package))

;; less gui
(setq initial-scratch-message "")
;; (setq inhibit-splash-screen t)
;; (scroll-bar-mode 0)
;;(menu-bar-mode 0)
(tool-bar-mode 0)

;; disable mouse
;(use-package disable-mouse
;  :ensure t
;  :config
;  (global-disable-mouse-mode))

;; transparency
;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
;(set-frame-parameter (selected-frame) 'alpha <both>)
;(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
;(add-to-list 'default-frame-alist '(alpha . (85 . 50)))

;; backups
;(setq make-backup-files nil) ; stop creating backup~ files
;(setq auto-save-default nil) ; stop creating #autosave# files
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

;; unset C- and M- digit keys
(dotimes (n 10)
  ;(global-unset-key (kbd (format "C-%d" n)))
  (global-unset-key (kbd (format "M-%d" n)))
  )

;; window mgmt
(use-package eyebrowse
  :diminish eyebrowse-mode
  :config (progn
  (define-key eyebrowse-mode-map (kbd "M-1") 'eyebrowse-switch-to-window-config-1)
  (define-key eyebrowse-mode-map (kbd "M-2") 'eyebrowse-switch-to-window-config-2)
  (define-key eyebrowse-mode-map (kbd "M-3") 'eyebrowse-switch-to-window-config-3)
  (define-key eyebrowse-mode-map (kbd "M-4") 'eyebrowse-switch-to-window-config-4)
  (eyebrowse-mode t)
  (setq eyebrowse-new-workspace t))
  )


;highlights
;(highlight-tabs)
;(highlight-trailing-whitespace)

;; commenting
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; tabs => 2 spaces
;(setq-default indent-tabs-mode nil)
;(setq-default tab-width 2)
;; show shitespace
;(global-whitespace-mode 1)

;; GIT
(use-package magit
  :ensure t
  :config )

;; THEME
(use-package spacemacs-common
    :ensure spacemacs-theme
    :config (load-theme 'spacemacs-dark t))

(use-package spaceline
  :ensure t
  :init
  (setq powerline-default-separator 'arrow-fade)
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme))

;(use-package dracula-theme
;  :ensure t
;  :config
;  (load-theme 'dracula t))

;; window and frame numbering
(use-package winum
    :ensure winum
    :config 
    (setq winum-auto-setup-mode-line nil)
    (winum-mode))

(use-package anzu
  :ensure anzu
  :init
  (setq anzu-cons-mode-line-p nil))


(use-package anzu
  :ensure anzu
  :init
  (setq anzu-cons-mode-line-p nil))

;;use larger font
(setq default-frame-alist '((font . "Ubuntu Mono-16")))

;; linum rel
(use-package linum-relative
  :ensure t
  :config
  (global-set-key [f12] 'linum-relative-toggle) ;; toggle with f12
  (setq linum-relative-current-symbol "")
  :init (linum-relative-global-mode)) ;; hybrid

;; helm
(use-package helm
  :ensure t
  :config
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x C-p") 'helm-projectile-find-file)
  :init (helm-mode 1))

;; helm projectile
(use-package helm-projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'helm)
  (helm-projectile-on)
  (setq projectile-indexing-method 'alien))

;; nyan mode
;(use-package nyan-mode
;  :ensure t
;  :init (nyan-mode))

;; company
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 1)
  :init (global-company-mode))

;; yasnippet
;(use-package yasnippet
;  :ensure t
;  :config
;  (yas-global-mode 1))

;; flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b89a4f5916c29a235d0600ad5a0849b1c50fab16c2c518e1d98f0412367e7f97" default))
 '(package-selected-packages '(eyebrowse magit cyberpunk-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
