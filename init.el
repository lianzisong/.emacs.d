(require 'package)
(setq package-archives
     '(("gnu" . "http://elpa.emacs-china.org/gnu/")
       ("melpa stable" . "http://elpa.emacs-china.org/melpa-stable/")))

(package-initialize)
;;disable the welcome page
(setq inhibit-splash-screen t)

;;encoding
(set-language-environment "chinese-gbk")
;;(set-language-environment "utf-8")

;;use-package
(require 'use-package)


;;================dev config ========
;;show the line number
(global-nlinum-mode)

;;python

;;set the rpc python to python3
;;set the interactiv python to python3
(require 'elpy)

(use-package elpy
  :config
  (setq elpy-rpc-python-command "python3")
  (setq python-shell-interpreter "python3")
  (elpy-enable))

;;python end

;;company
(require 'company)
(add-hook 'c++-mode-hook '(lambda() (company-mode)))
(add-hook 'c-mode-hook '(lambda() (company-mode)))
(add-hook 'objc-mode-hook '(lambda() (company-mode)))

;;company end

;;c/c++ 
;;cscope
(require 'xcscope)
(add-hook 'c++-mode-hook '(lambda() (cscope-enable)))
(add-hook 'c-mode-hook '(lambda() (cscope-enable)))
;;bind shortcut
(use-package xcscope
  :bind (("C-c s s" . cscope-find-this-symbol)
	 ("C-c s d" . cscope-find-global-definition)
	 ("C-c s n" . cscope-history-forward-line-current-result)
	 ("C-c s p" . cscope-history-backward-line-current-result)
	 ("C-c s c" . cscope-find-functions-calling-this-function)
	 ("C-c s u" . cscope-pop-mark))
  )

;;cscope end

;;==========================end=======================
(put 'erase-buffer 'disabled nil)
