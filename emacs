(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(LaTeX-command "xelatex")
 '(TeX-command "tex")
 '(inhibit-startup-screen t)
 '(js2-basic-offset 2))
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)

(setq
  el-get-sources
  '(mingus
    evil
    color-theme
    flymake-ruby
    rvm
   )
)
(require 'el-get)
(el-get 'sync)

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

(setq make-backup-files nil)
(setq auto-save-default nil)

;; save my life
(setq-default tab-width 2)
(fset 'yes-or-no-p 'y-or-n-p);; use y/n to anwser
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;;disable both beeping and visible-bell
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

(require 'mingus)

(ido-mode 1)
(setq ido-enable-flex-matching t)

;; rubymode
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

;; Local key bindings
(add-hook 'ruby-mode-hook
          (lambda ()
            ;; (ruby-electric-mode)
            (local-set-key [(control c) (control e)] 'ruby-insert-end)
))

;; eshell alias
(defun eshell/emacs (file)
          (find-file file))
(defun eshell/vim (file)
          (find-file file))
