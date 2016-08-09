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
(load-theme 'misterioso)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)

;; evil mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;; spaceline
(use-package spaceline
  :ensure t)
(use-package spaceline-config
  :config
  (spaceline-spacemacs-theme))

;; nyan mode
(use-package nyan-mode
  :ensure t
  :init (nyan-mode 1))

;; company
(use-package company
  :ensure t
  :init (global-company-mode))

;; yasnippet
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

;; flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
