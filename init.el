(require 'package)
(setq package-archives
     '(("gnu" . "http://elpa.emacs-china.org/gnu/")
       ("melpa stable" . "http://elpa.emacs-china.org/melpa-stable/")))

(package-initialize)
(setq inhibit-splash-screen t)

;;python

;;set the rpc python to python3
(setq elpy-rpc-python-command "python3")
;;set the interactiv python to python3
(setq python-shell-interpreter "python3")
(elpy-enable)

;;python end

;;irony
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;;irony end


(put 'erase-buffer 'disabled nil)
