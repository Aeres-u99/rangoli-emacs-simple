;; rangoli-ui-theme.el --- theme configuration -*- lexical-binding: t; -*-

;;; Packages

(straight-use-package 'gruvbox-theme)
(straight-use-package 'nord-theme)
(straight-use-package 'zenburn-theme)
(straight-use-package 'kaolin-themes)

;;; Terminal

;; Set cursor color
(when (not (display-graphic-p))
  ;; https://stackoverflow.com/a/13812604/4869
  (send-string-to-terminal "\033]12;green\007"))

;;; Theme-specific config

(require 'kaolin-themes)
(setq kaolin-themes-org-scale-headings nil)

;; https://www.nordtheme.com/docs/ports/emacs/configuration
(require 'nord-theme)
(setq nord-region-highlight "snowstorm")

;;; Default Theme

(defvar rangoli/default-theme-light 'kaolin-light)
(defvar rangoli/default-theme-dark 'kaolin-dark)
(defvar rangoli/default-theme-console 'zenburn)

(defun rangoli/mac-appearance ()
  "Is Mac currently using light or dark appearance?"
  (when (eq system-type 'darwin)
    (if (s-contains? "Dark"
                     (shell-command-to-string "defaults read -g AppleInterfaceStyle"))
        'dark
      'light)))

(defun rangoli/day-time? ()
  (let* ((now (ts-now))
         (hour (ts-hour now))
         (month (ts-month now)))
    ;; roughly, summer months
    ;; https://www.timeanddate.com/time/change/usa
    (if (< 3 month 11)
        (< 7 hour 17)
      ;; roughly, winter months
      ;; https://www.timeanddate.com/time/change/usa
      (< 6 hour 15))))

(defun rangoli/theme-type? ()
  (if window-system
      (if-let ((mac-appearance (rangoli/mac-appearance)))
          mac-appearance
        
        (if (rangoli/day-time?)
            ;; day
            'light
          ;; evening
          'dark))
    'console))

(defvar rangoli/theme-type nil "light or dark or console.")

(defun rangoli/load-theme-light ()
  (interactive)
  (setq rangoli/theme-type 'light)
  (counsel-load-theme-action (symbol-name rangoli/default-theme-light))
  (when (eq system-type 'darwin)
    (modify-all-frames-parameters '((ns-transparent-titlebar . t) (ns-appearance . light)))))

(defun rangoli/load-theme-dark ()
  (interactive)
  (setq rangoli/theme-type 'dark)
  (counsel-load-theme-action (symbol-name rangoli/default-theme-dark))
  (when (eq system-type 'darwin)
    (modify-all-frames-parameters '((ns-transparent-titlebar . t) (ns-appearance . dark)))))

(defun rangoli/load-theme-console ()
  (interactive)
  (setq rangoli/theme-type 'console)
  (counsel-load-theme-action (symbol-name rangoli/default-theme-console)))

(if-let (theme-type (rangoli/theme-type?))
    (cond
     ((eq 'light theme-type) (rangoli/load-theme-light))
     ((eq 'dark theme-type) (rangoli/load-theme-dark))
     ((eq 'console theme-type) (rangoli/load-theme-console))))

;;; Theme switcher

(defun rangoli/theme-cycle ()
  (interactive)
  (if (eq 'light rangoli/theme-type)
      (rangoli/load-theme-dark)
    (rangoli/load-theme-light)))

(rangoli/set-leader-key "T n" 'rangoli/theme-cycle "next theme")
(rangoli/set-leader-key "T s" 'counsel-load-theme "switch theme")

(provide 'rangoli-ui-theme)
;; rangoli-ui-theme.el ends here
