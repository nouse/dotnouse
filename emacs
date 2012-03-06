(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(LaTeX-command "xelatex")
 '(TeX-command "tex")
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
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
    ruby-electric
    markdown-mode
    inf-ruby
   )
)
(require 'el-get)
(el-get 'sync)

(require 'geiser)

(setq evil-shift-width 2)
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map " " 'evil-ex)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

(require 'color-theme)
(color-theme-initialize)
(color-theme-gray30)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq make-backup-files nil)
(setq auto-save-default nil)

;; save my life
;; Spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(fset 'yes-or-no-p 'y-or-n-p);; use y/n to anwser
(global-set-key (kbd "C-x C-p") 'previous-buffer)
(global-set-key (kbd "C-x C-n") 'next-buffer)

;;disable both beeping and visible-bell
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

(require 'mingus)

(add-to-list 'auto-mode-alist '("\\.mkd\\'" . markdown-mode))

(ido-mode 1)
(setq ido-enable-flex-matching t)
(icomplete-mode 1)

(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)
(rvm-autodetect-ruby)
;;; rhtml-mode
(add-to-list 'load-path "~/.emacs.d/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
   (lambda () (rinari-launch)))
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

;; dependency: rvm rinari
(defadvice rinari-web-server (before rvm-switch-rinari-web-server)
  (rvm-activate-corresponding-ruby))
(ad-activate 'rinari-web-server)

(defadvice rinari-console (before rvm-switch-rinari-console)
  (rvm-activate-corresponding-ruby))
(ad-activate 'rinari-console)

(defadvice run-ruby (before rvm-switch-run-ruby)
  (rvm-activate-corresponding-ruby))
(ad-activate 'run-ruby)
