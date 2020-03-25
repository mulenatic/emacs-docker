(message "==== Reading configuration from .emacs.el ===")

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(load-theme 'zenburn t)

;;company
(global-company-mode)

(add-to-list 'company-backends '(company-shell company-shell-env))

;; eliminate long "yes" or "no" prompts
(fset 'yes-or-no-p 'y-or-n-p)
;; Cusom mod configurations
;; turn of the menu bar
(menu-bar-mode -1)
;; turn of the tool bar
(if window-system
    (tool-bar-mode -1) )

;; (setq helm-projectile-fuzzy-match nil)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(helm-projectile-on)

;; Use C-x O to go to previous window.
(global-set-key (kbd "C-x O") (lambda ()
				(interactive)
				(other-window -1)))

(winner-mode 1)

(setq wg-morph-on nil)

;; Setup workgroups https://github.com/tlh/workgroups.el
(require 'workgroups)
(setq wg-prefix-key (kbd "C-c w"))
(workgroups-mode 1)
