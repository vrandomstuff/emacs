;; -*- lexical-binding: t; -*-

(deftheme tokyo-night-storm "Tokyo Night Storm theme")

(let ((bg "#24283b")
      (bg-alt "#1f2335")
      (fg "#c0caf5")
      (fg-alt "#a9b1d6")
      (black "#1d202f")
      (red "#f7768e")
      (green "#9ece6a")
      (yellow "#e0af68")
      (blue "#7aa2f7")
      (magenta "#bb9af7")
      (cyan "#7dcfff")
      (gray "#565f89"))

  (custom-theme-set-faces
   'tokyo-night-storm
   `(default ((t (:foreground ,fg :background ,bg))))
   `(cursor ((t (:background ,fg))))
   `(region ((t (:background "#364a82"))))
   `(font-lock-builtin-face ((t (:foreground ,magenta))))
   `(font-lock-comment-face ((t (:foreground ,gray :slant italic))))
   `(font-lock-constant-face ((t (:foreground ,blue))))
   `(font-lock-function-name-face ((t (:foreground ,blue :bold t))))
   `(font-lock-keyword-face ((t (:foreground ,magenta))))
   `(font-lock-string-face ((t (:foreground ,green))))
   `(font-lock-type-face ((t (:foreground ,yellow))))
   `(font-lock-variable-name-face ((t (:foreground ,fg))))
   `(mode-line ((t (:foreground ,fg :background ,bg-alt))))
   `(mode-line-inactive ((t (:foreground ,gray :background ,black)))))

  (custom-theme-set-variables
   'tokyo-night-storm
   `(ansi-color-names-vector [,black ,red ,green ,yellow ,blue ,magenta ,cyan ,fg])))

(provide-theme 'tokyo-night-storm)
