;;; mpdmacs-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "mpdmacs" "mpdmacs.el" (0 0 0 0))
;;; Generated autoloads from mpdmacs.el

(defvar mpdmacs-mode nil "\
Non-nil if Mpdmacs mode is enabled.
See the `mpdmacs-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `mpdmacs-mode'.")

(custom-autoload 'mpdmacs-mode "mpdmacs" nil)

(autoload 'mpdmacs-mode "mpdmacs" "\
Global minor mode enabling a minimal MPD client.

If called interactively, enable Mpdmacs mode if ARG is positive,
and disable it if ARG is zero or negative.  If called from Lisp,
also enable the mode if ARG is omitted or nil, and toggle it if
ARG is `toggle'; disable the mode otherwise.

When mpdmacs-mode is enabled, Emacs becomes a lightweight MPD
client. Basic playback and playback options (random, consume &c)
are all available, and extensions are supported through hooks
that will be invoked on assorted player events.

`mpdmacs-mode-hook' is run whenever `mpdmacs-mode' is enabled or
disabled.

Key bindings:
\\{mpdmacs-mode-map}

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mpdmacs" '("mpdmacs-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; mpdmacs-autoloads.el ends here
