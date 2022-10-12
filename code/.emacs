;; UTF-8 as default encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8-unix)

(setq inhibit-startup-screen t)
;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "https://melpa.org/packages/")
   t))
;; load config file
(setq custom-file "~/.emacs.d/elisp/code.el")
(load custom-file t)
