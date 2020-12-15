;; rangoli-text.el --- text related functionality -*- lexical-binding: t; -*-

;;; text manipulation

;; make `sort-lines` case-insensitive
(setq sort-fold-case t)

(rangoli/set-leader-key "t s" 'query-replace)
(rangoli/set-leader-key "t S" 'replace-string)
(rangoli/set-leader-key "t r" 'query-replace-regexp)
(rangoli/set-leader-key "t R" 'replace-regexp)

;;; copy-as-format

(straight-use-package 'copy-as-format)

(rangoli/declare-prefix "t c" "copy as format")
(rangoli/set-leader-key "t c j" 'copy-as-format-jira "jira")
(rangoli/set-leader-key "t c m" 'copy-as-format-markdown "markdown")
(rangoli/set-leader-key "t c o" 'copy-as-format-org-mode "org-mode")
(rangoli/set-leader-key "t c s" 'copy-as-format-slack "slack")
(rangoli/declare-prefix "t c g" "git")
(rangoli/set-leader-key "t c g h" 'copy-as-format-github "github")
(rangoli/set-leader-key "t c g l" 'copy-as-format-gitlab "gitlab")

(provide 'rangoli-text)
;; rangoli-text.el ends here
