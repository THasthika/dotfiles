;;; init.el --- require
;;; Commentary:

(require 'cl)

;; set user name
(setq user-full-name "Tharindu Hasthika")

;; set a file to write automatics configs to
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; load the custom file if exists
(when (file-exists-p custom-file)
  (load custom-file))

;; remove annoying features if loading in GUI mode
(when window-system
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1)
  (menu-bar-mode -1))

;; coding styles
;; (setq c-default-style
;;            '((java-mode . "java")
;;              (awk-mode . "awk")
;; 	     (c-mode . "linux")
;;              (other . "gnu")))
(setq c-default-style "linux"
      c-basic-offset 8)

;; initial window
(setq initial-frame-alist
      '((width . 102)   ; characters in a line
        (height . 54))) ; number of lines

;; sebsequent frame
(setq default-frame-alist
      '((width . 100)   ; characters in a line
        (height . 52))) ; number of lines

;; Bar cursor
(setq-default cursor-type '(bar . 1))
;; Don't blink the cursor
(blink-cursor-mode -1)

;; No welcome screen - opens directly in scratch buffer
(setq inhibit-startup-message t
      initial-scratch-message ""
      initial-major-mode 'fundamental-mode
      inhibit-splash-screen t)

;; Change the echo message
(defun display-startup-echo-area-message ()
  (message "Let's do this!"))

;; Backups at .saves folder in the current folder
(setq backup-by-copying t      ; don't clobber symlinks
      backup-directory-alist
      '(("." . "~/.saves"))    ; don't litter my fs tree
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)       ; use versioned backups

;; Auto Saving
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      create-lockfiles nil)

;; file name encoding
(prefer-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-auto-unix)

;; error messages
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; large file load warnings
(setq large-file-warning-threshold (* 15 1024 1024))

;; prompt
(fset 'yes-or-no-p 'y-or-n-p)

;; abbrivation expanding
(setq save-abbrevs 'silently)
(setq-default abbrev-mode t)

;; gdb
(setq gdb-many-windows t
      gdb-show-main t)

;; ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain
      ediff-split-window-function 'split-window-horizontally)

;; tramp
(setq tramp-default-method "ssh"
      tramp-backup-directory-alist backup-directory-alist
      tramp-ssh-controlmaster-options "ssh")

;; set line number on the side
(global-linum-mode t)

;; set param highlight and line highlight
(setq show-paren-delay 0)
(show-paren-mode 1)

(global-hl-line-mode t)

;; move correctly in camelCase
(subword-mode)

;; sentence configuration
(setq sentence-end-double-space nil)

;; recentering
(setq recenter-positions '(top middle bottom))

;; better wild card search
(setq search-whitespace-regexp ".*?")

;; presistent history
(savehist-mode)

;; narrow to region
(put 'narrow-to-region 'disabled nil)

;; pdf viewer
(setq doc-view-continuous t)

;; window management
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; Recentf mode changes
(setq recentf-max-saved-items 1000
      recentf-exclude '("/tmp/" "/ssh:"))
(recentf-mode)

(setq ns-use-native-fullscreen nil)

;; fonts
(cond ((eq system-type 'gnu/linux)
       (set-frame-font "Source Code Pro"))
      ((eq system-type 'darwin)
       (set-frame-font "Monaco"))
      ((eq system-type 'windows-nt)
       (set-frame-font "Lucida Sans Typewriter")))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'bind-key)                ;; if you use any :bind variant

;; custom functions
(defun thb/next-user-buffer()
  "Switch to the next user buffer"
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (< i 20)
      (if (not (thb/user-buffer-q))
	  (progn (next-buffer)
		 (setq i (1+ i)))
	(progn (setq i 100))))))

(defun thb/previous-user-buffer()
  "Switch to the previous user buffer"
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (< i 20)
      (if (not (thb/user-buffer-q))
	  (progn (previous-buffer)
		 (setq i (1+ i)))
	(progn (setq i 100))))))

(defun thb/user-buffer-q()
  (interactive)
  (if (string-equal "*" (substring (buffer-name) 0 1))
      nil
    (if (string-equal major-mode "dired-mode")
	nil
      t
      )))

(defun thb/ignore-errors-wrapper (fn)
  (lexical-let ((fn fn))
    (lambda ()
      (interactive)
      (ignore-errors
	(funcall fn))
      )))

;; global keys

(global-set-key (kbd "C-x <left>") 'thb/next-user-buffer)
(global-set-key (kbd "C-x <right>") 'thb/previous-user-buffer)
(global-set-key (kbd "C-x C-<left>") 'thb/next-user-buffer)
(global-set-key (kbd "C-x C-<right>") 'thb/previous-user-buffer)

(global-set-key (kbd "C-c C-<up>") (thb/ignore-errors-wrapper 'windmove-up))
(global-set-key (kbd "C-c C-<down>") (thb/ignore-errors-wrapper 'windmove-down))
(global-set-key (kbd "C-c C-<left>") (thb/ignore-errors-wrapper 'windmove-left))
(global-set-key (kbd "C-c C-<right>") (thb/ignore-errors-wrapper 'windmove-right))

(global-unset-key (kbd "C-z")) ;; unset gui freezing

(global-set-key (kbd "C-;") 'comment-indent)
(global-set-key (kbd "M-;") 'comment-or-uncomment-region)

(provide 'init-user)
