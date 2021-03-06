(require 'package)
(setq package-archives
     '(("gnu" . "http://elpa.emacs-china.org/gnu/")
       ("melpa stable" . "http://elpa.emacs-china.org/melpa-stable/")))

(package-initialize)
;;disable the welcome page
(setq inhibit-splash-screen t)
;;hide the menubar/scrollbar
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)

;;encoding
;;(set-language-environment "chinese-gbk")
;;(set-language-environment "utf-8")

;;use-package
(require 'use-package)

;;nlinum
(require 'nlinum)

;;color theme
(require 'monokai-theme)
(load-theme 'monokai 1)

;; 设置垃圾回收，在Windows下，emacs25版本会频繁出发垃圾回收，所以需要设置
(when (eq system-type 'windows-nt)
(setq gc-cons-threshold (* 512 1024 1024))
(setq gc-cons-percentage 0.5)
(run-with-idle-timer 5 t #'garbage-collect)
;; 显示垃圾回收信息，这个可以作为调试用
;; (setq garbage-collection-messages t)
)

;;================dev config =========================================
;;show the line number
(global-nlinum-mode)

;;treemacs
(use-package treemacs
  :ensure t
  :defer t
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  :bind
  (:map global-map
	("M-0" . treemacs-select-window))
  )

;;python

;;set the rpc python to python3
;;set the interactiv python to python3
(require 'elpy)
(use-package elpy
  :config
  (when (not (eq system-type 'windows-nt))
    (setq elpy-rpc-python-command "python3")
    (setq python-shell-interpreter "python3"))
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
;; (require 'xcscope)
;; (add-hook 'c++-mode-hook '(lambda() (cscope-enable)))
;; (add-hook 'c-mode-hook '(lambda() (cscope-enable)))
;; (add-hook 'c++-mode-hook '(lambda() (set-language-environment "chinese-gbk")))
;; (add-hook 'c-mode-hook '(lambda() (set-language-environment "chinese-gbk")))
;; ;;bind shortcut
;; (use-package xcscope
;;   :bind (("C-c s s" . cscope-find-this-symbol)
;; 	 ("C-c s d" . cscope-find-global-definition)
;; 	 ("C-c s n" . cscope-history-forward-line-current-result)
;; 	 ("C-c s p" . cscope-history-backward-line-current-result)
;; 	 ("C-c s c" . cscope-find-functions-calling-this-function)
;; 	 ("C-c s u" . cscope-pop-mark))
;;   )

;;cscope end

;;==========================end=======================

(put 'erase-buffer 'disabled nil)
