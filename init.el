;; -*- lexical-binding: t; -*-


; packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)


;; https://github.com/rexim/dotfiles/blob/master/.emacs.rc/rc.el
(defvar rc/package-contents-refreshed nil)

(defun rc/package-refresh-contents-once ()
  (when (not rc/package-contents-refreshed)
    (setq rc/package-contents-refreshed t)
    (package-refresh-contents)))

(defun rc/require-one-package (package)
  (when (not (package-installed-p package))
    (rc/package-refresh-contents-once)
    (package-install package)))

(defun rc/require (&rest packages)
  (dolist (package packages)
    (rc/require-one-package package)))

(defun rc/require-theme (theme)
  (let ((theme-package (->> theme
                            (symbol-name)
                            (funcall (-flip #'concat) "-theme")
                            (intern))))
    (rc/require theme-package)
    (load-theme theme t)))

(rc/require 'dash)
(require 'dash)

(rc/require 'dash-functional)
(require 'dash-functional)
; theme
;(rc/require 'gruber-darker-theme)
;(load-theme 'gruber-darker)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'tokyo-night-storm t)
; options

(setq inhibit-startup-screen t)
(setq initial-buffer-choice (lambda () (get-buffer-create "*scratch*")))
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
(setq inhibit-startup-echo-area-message t)

; extentions
(rc/require 'magit)
(rc/require 'dart-mode)
(rc/require '2048-game)
(rc/require 'markdown-mode)
; ido

(rc/require 'smex 'ido-completing-read+)

(require 'ido-completing-read+)

(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

(global-set-key (kbd "M-x") 'smex)
; keybindings
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "C-d")
                (lambda ()
                  (interactive)
                  (beginning-of-line)
                  (kill-line 1)))

; custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("fa42596ce53ea6fc21e499fad7bf4eb8789f800a62ccadce1b6c5d410bd0df89"
     default))
 '(package-selected-packages
   '(dart-mode dash-functional gruber-darker-theme ido-completing-read+
	       magit smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
