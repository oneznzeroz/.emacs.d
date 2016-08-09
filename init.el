;; more repos
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

;; if !use-package => install
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; init use-package
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; less gui
(setq initial-scratch-message "")
(setq inhibit-splash-screen t)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)

;; evil mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))
;; linum rel
(use-package linum-relative
  :ensure t
  :config
  (global-set-key [f12] 'linum-relative-toggle) ;; toggle with f12
  (setq linum-relative-current-symbol "")
  :init
  (linum-relative-global-mode)) ;; hybrid

;; material theme
(use-package material-theme
  :ensure t
  :config
  (load-theme 'material t))

;; spaceline
(use-package spaceline
  :ensure t)
(use-package spaceline-config
  :config
  (spaceline-spacemacs-theme))

;; nyan mode
(use-package nyan-mode
  :ensure t
  :config
  (setq nyan-wavy-trail t)
  (setq nyan-animate-nyancat t)
  :init (nyan-mode 1))

;; company
(use-package company
  :ensure t
  :init (global-company-mode))
;; company-tern
(use-package company-tern
  :ensure t
  :init (add-to-list 'company-backends 'company-tern))

;; yasnippet
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

;; flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
