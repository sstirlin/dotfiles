;; official packages (i.e. using package.el)

(setq package-list '(key-chord undo-tree evil epc python-environment jedi ein))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
      (package-install package)))



;; unofficial packages (managed via el-get) 

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")


; packages that I like (custom recipes)
(setq el-get-sources
    '((:name cmake-font-lock
             :type git
             :url "https://github.com/Lindydancer/cmake-font-lock.git"
             :features andersl-cmake-font-lock
             :compile "andersl-cmake-font-lock.el")))


; packages that I like (built-in recipes)
(setq my-packages
      '(transpose-frame cmake-mode cmake-font-lock el-get))


(el-get 'sync my-packages)



;; packages now need to be loaded


; load undo-tree
(require 'undo-tree)
(global-undo-tree-mode 1)


; load evil mode (vim emulation)
(require 'evil)
(define-key  evil-normal-state-map  [backtab]  (lambda() (interactive) (dotimes (i 4) (evil-backward-char))))  ; shift-tab is backtab
(define-key  evil-insert-state-map  [backtab]  (lambda() (interactive) (dotimes (i 4) (evil-backward-char))))  ; shift-tab is backtab
(evil-mode 1)


; key-chord lets me remap jk as ESC for evil mode
(require 'key-chord)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)


; show-paren-mode flashes too slowly... speed it up!
(setq show-paren-delay 0.1)
(show-paren-mode 1)
(setq blink-matching-paren t)


; load transpose-frame
(require 'transpose-frame)


; enable windmove
(windmove-default-keybindings 'meta)


; load cmake-font-lock
(autoload 'andersl-cmake-font-lock-activate "andersl-cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'andersl-cmake-font-lock-activate)


; load jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)           
(setq jedi:complete-on-dot t)


; load ein
(require 'ein)
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)


; load ido
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)


; cpp code should use 4 spaces for indentation, not 2
(setq-default c-basic-offset 4)
; disable electric mode
(setq-default c-electric-flag nil)
; load cc mode
(require 'cc-mode)


;; done with packages



; smooth scrolling
(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
(setq-default scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)


; dump temp files elsewhere please 
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


; disable menu bar at top
(menu-bar-mode -1)


; uniquify buffer names so that I can tell them apart
(require 'uniquify) 
(setq 
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")


; restructuredText faces have stupid default colors
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rst-level-1 ((t (:background "grey40"))))
 '(rst-level-2 ((t (:background "grey40"))))
 '(rst-level-3 ((t (:background "grey40"))))
 '(rst-level-4 ((t (:background "grey40"))))
 '(rst-level-5 ((t (:background "grey40"))))
 '(rst-level-6 ((t (:background "grey40")))))


; underscores should NOT be word separators... this is obnoxious
(modify-syntax-entry ?_ "w")


; RET should be newline and autoindent
(define-key global-map (kbd "RET") 'newline-and-indent)


; tabs should be 4 spaces.  Anything else is communism
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

