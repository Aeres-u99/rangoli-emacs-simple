;;; Straight bootstrap
;; https://github.com/raxod502/straight.el

(setq straight-repository-branch "develop"
      straight-enable-use-package-integration nil)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://stable.melpa.org/packages/"))


(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;; Features
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://stable.melpa.org/packages/")))

(add-to-list 'load-path (concat user-emacs-directory "features/"))

;; You /will/ need these

(require 'rangoli-core)
(require 'rangoli-config)
(require 'rangoli-keybindings)
(require 'rangoli-ui)

;; You /may/ want these

;;(require 'rangoli-ui-theme)
(require 'rangoli-ui-font)
(require 'rangoli-snippet)
(require 'rangoli-org)
(require 'rangoli-markdown)
(require 'rangoli-pdf)

(require 'rangoli-timer)
(require 'rangoli-websearch)
(require 'rangoli-emoji)

(require 'rangoli-reading)
(require 'rangoli-text)
(require 'rangoli-annotate)

(require 'rangoli-git)
(require 'rangoli-projects)

(require 'rangoli-programming)
(require 'rangoli-lsp)
(require 'rangoli-docker)
(require 'rangoli-tramp)
(require 'rangoli-elisp)
(require 'rangoli-rust)
(require 'rangoli-cpp)
(require 'rangoli-python)
(require 'rangoli-swift)
(require 'rangoli-java)

;; You probably /do not/ want these

;; (require 'swa-org)
;; (require 'swa-bookmarks)
;; (require 'swa-personal)

(let ((rangoli-private-config (f-join rangoli/private-emacs-config-dir "init.el")))
  (when (f-exists? rangoli-private-config)
    (load rangoli-private-config)))
;; for clipboard, this allows contro shift C and control shift v to copy paste stuffs
(setq select-enable-clipboard t)
;; this is to enable line numbers
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))


;; set default tab char's display width to 4 spaces
(setq-default tab-width 4) ; emacs 23.1 to 26 default to 8

;; set current buffer's tab char's display width to 4 spaces
(setq tab-width 4)
;; An attempt at launching termite inside Emacs. 

(global-set-key (kbd "C-c s") (kbd "M-! termite RET"))

;; Package initializations lie ahead! 
(package-initialize)


(use-package smart-mode-line
  :config
  (setq sml/theme 'respectful)
  (sml/setup))
(use-package lsp-mode
  :hook (prog-mode . lsp))

(use-package lsp-ui)
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
;; note that setting `venv-location` is not necessary if you
;; use the default location (`~/.virtualenvs`), or if the
;; the environment variable `WORKON_HOME` points to the right place
(setq venv-location '("~/SoopaProject/Projects/Leecher/leecher/"
                      "~/SoopaProject/Projects/eliza/"
                      "~/SoopaProject/Projects/AI-chat-bot/"))
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional
(use-package eaf
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
  :custom
  (eaf-find-alternate-file-in-dired t)
  :config
    (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
    (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
    (eaf-bind-key take_photo "p" eaf-camera-keybinding))
(load-theme 'material t)
