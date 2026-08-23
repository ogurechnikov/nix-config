;;; ---------------------------------------------------------------------------
;;; Package management
;;; ---------------------------------------------------------------------------

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             t)

(add-to-list 'package-archives
             '("nongnu" . "https://elpa.nongnu.org/nongnu/")
             t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))


;;; ---------------------------------------------------------------------------
;;; UI
;;; ---------------------------------------------------------------------------

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setopt
 tab-width 4
 display-line-numbers-type 'relative
 fill-column 80
 use-short-answers t)

(global-display-line-numbers-mode 1)
(global-display-fill-column-indicator-mode 1)

(electric-pair-mode 1)
(show-paren-mode 1)
(desktop-save-mode 1)

(use-package dired-sidebar
  :ensure t
  :bind
  (("C-c d" . dired-sidebar-toggle-sidebar)))

;;; ---------------------------------------------------------------------------
;;; Files
;;; ---------------------------------------------------------------------------

(setopt
 backup-directory-alist
 '(("." . "~/.emacs.d/backups/"))

 auto-save-file-name-transforms
 '((".*" "~/.emacs.d/backups/" t))

 create-lockfiles nil)

;;; ---------------------------------------------------------------------------
;;; Completion
;;; ---------------------------------------------------------------------------

;; Completion at point
(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-auto-prefix 2)
  (corfu-cycle t)
  (corfu-preselect 'prompt)
  :init
  (global-corfu-mode))


;; Minibuffer completion UI
(use-package vertico
  :ensure t
  :init
  (vertico-mode))


;; Flexible matching
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides
   '((file (styles partial-completion)))))


;; Rich minibuffer annotations
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))


;; Search and navigation
(use-package consult
  :ensure t
  :bind
  (("C-x b" . consult-buffer)
   ("C-x /" . consult-ripgrep)
   ("C-x C-r" . consult-recent-file)
   ("M-y" . consult-yank-from-kill-ring)))


;;; ---------------------------------------------------------------------------
;;; Projects
;;; ---------------------------------------------------------------------------

(use-package project
  :ensure nil
  :bind-keymap
  ("C-c p" . project-prefix-map))


;;; ---------------------------------------------------------------------------
;;; Git
;;; ---------------------------------------------------------------------------

(use-package magit
  :ensure t
  :bind
  (("C-x g" . magit-status))
  :hook
  (magit-status-mode . auto-revert-mode))


(use-package magit-gitflow
  :ensure t
  :after magit
  :hook
  (magit-mode . turn-on-magit-gitflow))

;;; ---------------------------------------------------------------------------
;;; Eglot
;;; ---------------------------------------------------------------------------

(use-package eglot
  :ensure nil
  :config
  (add-to-list 'eglot-server-programs '(nix-mode . ("nil"))))

;;; ---------------------------------------------------------------------------
;;; Nix
;;; ---------------------------------------------------------------------------

(use-package nix-mode
  :ensure t
  :hook
  (nix-mode . eglot-ensure))

;;; ---------------------------------------------------------------------------
;;; Go
;;; ---------------------------------------------------------------------------

(use-package go-mode
  :ensure t
  :hook
  (go-mode . eglot-ensure)
  (go-mode . my/go-mode-setup))

(defun my/go-mode-setup ()
  "Configure Go buffers."
  (add-hook 'before-save-hook
            'eglot-format
            nil
            t))

;;; ---------------------------------------------------------------------------
;;; Go tests
;;; ---------------------------------------------------------------------------

(defun my/go-test ()
  "Run Go tests for the current package."
  (interactive)
  (compile "go test -v ./..."))

(global-set-key (kbd "C-c t") #'my/go-test)


;;; ---------------------------------------------------------------------------
;;; Common Lisp
;;; ---------------------------------------------------------------------------

(use-package slime
  :ensure t
  :custom
  (inferior-lisp-program "sbcl")
  (slime-contribs '(slime-fancy slime-asdf))
  (slime-complete-symbol-function
   #'slime-fuzzy-complete-symbol)
  :bind
  (("C-c s" . slime)))


;;; ---------------------------------------------------------------------------
;;; Bible
;;; ---------------------------------------------------------------------------

(use-package bible-gateway
  :ensure t
  :custom
  (bible-gateway-bible-version "RUSV")
  (bible-gateway-reading-plan "bibleplan.csv")
  :bind
  (("C-c b" . bible-gateway)))

;;; ---------------------------------------------------------------------------
;;; Custom commands
;;; ---------------------------------------------------------------------------

(defun my/kill-all-buffers ()
  "Kill all live buffers."
  (interactive)
  (mapc #'kill-buffer (buffer-list)))


(global-set-key (kbd "C-c C-d") #'duplicate-line)

;;; ---------------------------------------------------------------------------
;;; Custom system etc
;;; ---------------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(dank-emacs))
 '(custom-safe-themes
   '("56ea9bccc9cbbe6a2eed5f3472914875e44bbc8f58d14885ada18ec22125844d"
	 "a10be2cb039228828c243dd66ad4e76a1cac691d001ea4e6d7e3dfe6a55b0d17"
	 "49361d39cd77efa1e363fde9c80aa08e7a3ddaada86bccd90f3205af8733174a" default))
 '(package-selected-packages
   '(bible-gateway consult corfu dired-sidebar go-test magit magit-gitflow
				   marginalia orderless slime)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
