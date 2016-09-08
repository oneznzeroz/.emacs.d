;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;;
;;                  ___                                   ___                    ;;
;;    ___          /__/\        ___           ___        /  /\                   ;;
;;   /  /\         \  \:\      /  /\         /  /\      /  /:/_                  ;;
;;  /  /:/          \  \:\    /  /:/        /  /:/     /  /:/ /\    ___     ___  ;;
;; /__/::\      _____\__\:\  /__/::\       /  /:/     /  /:/ /:/_  /__/\   /  /\ ;;
;; \__\/\:\__  /__/::::::::\ \__\/\:\__   /  /::\    /__/:/ /:/ /\ \  \:\ /  /:/ ;;
;;    \  \:\/\ \  \:\~~\~~\/    \  \:\/\ /__/:/\:\   \  \:\/:/ /:/  \  \:\  /:/  ;;
;;     \__\::/  \  \:\  ~~~      \__\::/ \__\/  \:\   \  \::/ /:/    \  \:\/:/   ;;
;;     /__/:/    \  \:\          /__/:/       \  \:\   \  \:\/:/      \  \::/    ;;
;;     \__\/      \  \:\         \__\/         \__\/    \  \::/        \__\/     ;;
;;                 \__\/                                 \__\/                   ;;
;;                      ~ Configuration by: Mark Sorce ~                         ;;
;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;;

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

;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
;;(set-frame-parameter (selected-frame) 'alpha <both>)
(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
(add-to-list 'default-frame-alist '(alpha . (85 . 50)))

;highlights
;(highlight-tabs)
;(highlight-trailing-whitespace)

(use-package magit
  :ensure t
  :config )

;; backups
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))
;(setq backup-directory-alist
;`((".*" . ,temporary-file-directory)))
;(setq auto-save-file-name-transforms
;`((".*" ,temporary-file-directory t)))

;; handle prompts
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

;; Electric
(electric-indent-mode 1)
(electric-pair-mode 1)

;; commenting
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; tabs => 2 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
;; show shitespace
(global-whitespace-mode 1)

(defvar html-indent-offset)
(setq html-indent-offset 2)

(defvar js-indent-level)
(setq js-indent-level 2)

(defvar css-indent-offset)
(setq css-indent-offset 2)

(defvar javascript-indent-level)
(setq javascript-indent-level 2)

(defvar scss-indent-offset)
(setq scss-indent-offset 2)

;; smooth scrolling
(setq scroll-conservatively 101) ;; move minimum when cursor exits view, instead of recentering
(setq mouse-wheel-scroll-amount '(1)) ;; mouse scroll moves 1 line at a time, instead of 5 lines
(setq mouse-wheel-progressive-speed nil) ;; on a long mouse scroll keep scrolling by 1 line
(setq scroll-margin 5)

;; evil mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;; evil surround
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))
;; web mode
(use-package web-mode
  :ensure t
  :config
  (setq web-mode-markup-indent-offset 2)
  (set-face-background 'web-mode-current-element-highlight-face "yellow")
  (set-face-attribute 'web-mode-html-tag-face nil :foreground "magenta")
  (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "pink")
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-enable-current-element-highlight t))

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

;; spaceline
(use-package spaceline
  :ensure t)
(use-package spaceline-config
  :config
  (set-face-attribute 'spaceline-evil-normal nil :foreground "black")
  (spaceline-spacemacs-theme))
;; theme
(use-package cyberpunk-theme
  :ensure t
  :config
  )
;; (use-package moe-theme
;;   :ensure t
;;   :config
;;   (load-theme 'moe-dark t)
;;   (moe-theme-set-color 'green)
;;   (powerline-moe-theme))
;; nyan mode
(use-package nyan-mode
  :ensure t
  :init (nyan-mode))

;; sass
(use-package scss-mode
  :ensure t
  :config
  (autoload 'scss-mode "scss-mode")
  (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
  (add-to-list 'auto-mode-alist '("\\.sass\\'" . scss-mode)))

;; company
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 1)
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
