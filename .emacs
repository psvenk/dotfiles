(load-file "~/.emacs.d/init.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   (quote
    (((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Atril")
     (output-html "xdg-open"))))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (php-mode auctex markdown-mode yaml-mode dockerfile-mode editorconfig cl-lib typescript-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white smoke" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 99 :width normal :foundry "ADBO" :family "Source Code Pro"))))
 '(whitespace-tab ((t (:foreground "#636363")))))

(setq-default TeX-master nil) ; Query for master file.
;; https://www.gnu.org/software/auctex/manual/auctex.html#Multifile
