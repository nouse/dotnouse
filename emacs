(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(LaTeX-command "xelatex")
 '(TeX-command "tex")
 '(inhibit-startup-screen t)
 )
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)

(require 'el-get)
(setq el-get-sources
      '(evil
         mingus
         color-theme
       ))
(el-get)
(setq evil-shift-width 2)
(setq evil-want-C-u-scroll t)
(require 'evil)  
(evil-mode 1)
(define-key evil-normal-state-map " " 'evil-ex-read-command)

(require 'color-theme)
(color-theme-initialize)
(color-theme-gray30)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;;disable both beeping and visible-bell
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

(require 'mingus)

(ido-mode 1)

(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))