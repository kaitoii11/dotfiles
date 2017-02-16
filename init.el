;;; for Debug ~/.emacs ;;;
;(setq stack-trace-on-error t)
;(setq debug-on-error t)

; GUIから起動されたEmacsのpathが正しくわたらないための設定
; 下に記述したものがPATHの先頭に追加される
(dolist (dir (list
               "/sbin"
               "/usr/sbin"
               "/bin"
               "/usr/bin"
               "/usr/local/bin"
               "/opt/local/bin"
               (expand-file-name "~/bin")
               (expand-file-name "~/.emacs.d/bin")
               ))
  ; PATH と exec-path に同じ物を追加
(when (and (file-exists-p dir) (not (member dir exec-path)))
  (setenv "PATH" (concat dir ":" (getenv "PATH")))
  (setq exec-path (append (list dir) exec-path))))

; 言語を日本語にする
(set-language-environment 'Japanese)
; UTF-8とする
(prefer-coding-system 'utf-8)
; 起動時の画面はいらない
(setq inhibit-startup-message t)
; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;;; ignore pasting image to Emacs when copying from MS Word
(setq yank-excluded-properties t)

; Emacs.appの場合
(when (eq system-type 'darwin)
  ;;; Command keyをMetaに
  (setq ns-command-modifier 'meta))

; GUI版Emacsの場合
(if window-system (progn
  (custom-set-faces
    '(default ((t (:background "black" :foreground "white"))))
    '(cursor (
           (((class color) (background dark )) (:background "green"))
           (((class color) (background light)) (:background "green"))
           (t ())
           )))
  (set-foreground-color "white")
  (set-background-color "black")
  (set-cursor-color "green")
  ;; 起動時のディスプレイサイズ変更(環境に応じて適宜変更)
  (set-frame-height (next-frame) 31)
  (set-frame-width (next-frame) 80)
  ;; メニューバーを隠す
  (tool-bar-mode -1)
  ;; デフォルトの透明度を設定する (85%)
  (add-to-list 'default-frame-alist '(alpha . 85))
  ;; カレントウィンドウの透明度を変更する (85%)
  (set-frame-parameter nil 'alpha 85)
  ;;; 画像ファイルを表示する
  (auto-image-file-mode t)
  ;; Font
  (create-fontset-from-ascii-font "Menlo-12:weight=normal:slant=normal" nil "menlomarugo")
  (set-fontset-font "fontset-menlomarugo"
                    'unicode
                    (font-spec :family "Hiragino Maru Gothic ProN" :size 14)
                    nil
                    'append)
  (add-to-list 'default-frame-alist '(font . "fontset-menlomarugo"))
  ;; (set-face-attribute 'default nil :family "monaco" :height 150)
  ;; (set-fontset-font
  ;;   (frame-parameter nil 'font)
  ;;     'japanese-jisx0208
  ;;     '("Hiragino Kaku Gothic ProN" . "iso10646-1"))
  ;; (set-fontset-font
  ;;   (frame-parameter nil 'font)
  ;;     'japanese-jisx0212
  ;;     '("Hiragino Kaku Gothic ProN" . "iso10646-1"))
  ;; (set-fontset-font
  ;;   (frame-parameter nil 'font)
  ;;     'mule-unicode-0100-24ff
  ;;     '("monaco" . "iso10646-1"))
  ;; (setq face-font-rescale-alist
  ;;     '(("^-apple-hiragino.*" . re 'saveplace nil t)
  ;;       (setq-default save-place t)
  ;;         (setq save-place-file "~/.emacs.d/saved-places"))e.2)
  ;;       (".*osaka-bold.*" . 1.2)
  ;;       (".*osaka-medium.*" . 1.2)
  ;;       (".*courier-bold-.*-mac-roman" . 1.0)
  ;;       (".*monaco cy-bold-.*-mac-cyrillic" . 0.9) (".*monaco-bold-.*-mac-roman" . 0.9)
  ;;       ("-cdac$" . 1.3)))
  ) (menu-bar-mode -1)
)

;;; key bind ;;;
;(global-set-key "\C-z" 'undo)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-\C-h" 'backward-kill-word)
(global-set-key "\M-h" 'help-for-help)
(global-set-key "\M-g" 'goto-line)
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
(global-set-key "\C-]" 'find-tag)
(global-set-key "\C-t" 'pop-tag-mark)
(define-key minibuffer-local-completion-map "\C-p" 'previous-history-element)
(define-key minibuffer-local-completion-map "\C-n" 'next-history-element)
(load-library "term/bobcat") ;;; Backspace <-> DEL ;;;
(setq ns-command-modifier (quote meta))
;-------------------------------
;;; environment setting ;;;
(setq exec-path (append exec-path '("/opt/local/bin")))
(setq version-control nil)
(setq default-fill-column 80)
(setq visible-bell t)     ;;; no beep
(line-number-mode t)      ;;; display line number
(setq column-number-mode t) ;;; display column number
(setq scroll-step 1)
(blink-cursor-mode 1)     ;;; カーソルの点滅を止める
(show-paren-mode t)      ;;; 括弧の対応を表示
(setq show-paren-style 'expression);;; 括弧内も光らせる
(set-face-background 'show-paren-match-face "#00008b");;;括弧内の色設定
(setq transient-mark-mode t) ;;; hilight copy region ;;;
(setq-default indent-tabs-mode nil)   ;;; expand Tab to space ;;;
(setq kill-whole-line t)  ;;; C-k behavior
(setq next-line-add-newlines nil) ;;; C-n don't add new lines at EOF
(put 'narrow-to-region 'disabled nil) ;;; end of file ;;;
(setq backup-inhibited t) ;; バックアップファイルを作らない
(setq eval-expression-print-length nil) ;;; evalした結果を全部表示
(which-function-mode 1) ;;; ウィンドウの上部に現在の関数名を表示
(setq completion-ignore-case t) ;;; 補完時に大文字小文字を区別しない
(setq read-file-name-completion-ignore-case t)
;;行番号を表示
(global-linum-mode t)
(set-face-attribute 'linum nil :foreground "#800" :height 0.9)
(setq linum-format "%3d")


;;; history ;;;
(savehist-mode 1) ;;; ミニバッファの履歴を保存する
(setq history-length 10000) ;;; 履歴数を大きくする
(recentf-mode)
(setq recentf-max-saved-items 10000) ;;; 最近開いたファイルを保存する数を増やす

;;; ファイルの先頭に#!...があるファイルを保存すると実行権をつける
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;;; 自動スペルチェック C-.で候補表示
;;; sudo port install ispell が必要
(setq ispell-program-name "/opt/local/bin/ispell")
(setq flyspell-issue-message-flag nil)
(setq ispell-dictionary "american")

;; text-mode
(add-hook
 'text-mode-hook 'flyspell-mode)

;; program-mode
(add-hook
 'prog-mode-hook 'flyspell-prog-mode)

;; c-modeやc++-modeなどcc-modeベースのモード共通の設定
(add-hook
 'c-mode-common-hook
 (lambda ()
   ;; BSDスタイルをベースにする
   (c-set-style "bsd")
   ;; スペースでインデントをする
   (setq indent-tabs-mode nil)
   ;; インデント幅を2にする
   (setq c-basic-offset 2)
   ;; CamelCaseの語でも単語単位に分解して編集する
   ;; EmacsFrameClass   => Emacs Frame Class
   (subword-mode 1)
   ))

;; emacs-lisp-modeでバッファーを開いたときに行う設定
(add-hook
 'emacs-lisp-mode-hook
 (lambda ()
   ;; スペースでインデントをする
   (setq indent-tabs-mode nil)
   ))

;;; CUDA
(setq auto-mode-alist
    (cons (cons "\\.cu$" 'c++-mode) auto-mode-alist))

;;; GDB ;;;
;;; sudo port install gdb が必要
(add-hook 'gdb-mode-hook
          '(lambda ()
             (setq gdb-many-windows t)
             (setq gud-gdb-command-name "ggdb -i=mi")
             (local-set-key "\C-p" 'comint-previous-input)
             (local-set-key "\C-n" 'comint-next-input)
             ))

;;; el-get ;;;
;; M-x el-get-list-packages でパッケージのリストを表示、i を押して x でinstall
;; el-get インストール後のロードパスの用意
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;; もし el-get がなければインストールを行う
(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (end-of-buffer)
       (eval-print-last-sexp)))))
(require 'el-get)

;;; YaTeX
(add-to-list 'load-path "~/.emacs.d/el-get/yatex")
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(add-hook 'yatex-mode-hook'(lambda ()(setq auto-fill-function nil)))
;; Preview.app の使用
(setq dvi2-command "open -a Preview")

;;; bibtex
(add-hook 'yatex-mode-hook 'turn-on-reftex)

;;; FlyMake
;;; Auto Complete Mode
;;; http://cx4a.org/software/auto-complete/manual.ja.html#.E3.81.AF.E3.81.98.E3.82.81.E3.81.AB
;;; multi-term

;;packages
(require 'package)
;Add package-archives
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;Initialize
(package-initialize)

;;flymake
;(require 'flymake)

;(defun flymake-cc-init ()
;  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
;                       'flymake-create-temp-inplace))
;         (local-file  (file-relative-name
;                       temp-file
;                       (file-name-directory buffer-file-name))))
;    (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

;(push '("\\.cc$" flymake-cc-init) flymake-allowed-file-name-masks)

;(add-hook 'c++-mode-hook
;          '(lambda ()
;            (flymake-mode t)))

; flycheck
(require 'flycheck)

(flycheck-define-checker c/c++
  "A C/C++ checker using g++."
  :command ("g++" "-Wall" "-Wextra" source)
  :error-patterns  ((error line-start
                           (file-name) ":" line ":" column ":" " エラー: " (message)
                           line-end)
                    (warning line-start
                             (file-name) ":" line ":" column ":" " 警告: " (message)
                             line-end))
    :modes (c-mode c++-mode))

;;auto-complete
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-hook 'emacs-lisp-mode-hook '(lambda ()
                                   (require 'auto-complete)
                                   (auto-complete-mode t)
                                   ))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(global-auto-complete-mode t)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-completing-map (kbd "C-m") 'ac-complete)
;;parenthesis autopair
(require 'flex-autopair)
(flex-autopair-mode 1)

;;;;;;;;;C-x C-fのデフォルト表示の設定;;;;;;;;;;
(cd "~/")
(put 'upcase-region 'disabled nil)

;.cuでc-mode
(setq auto-mode-alist
(cons (cons "\\.cu$" 'c-mode) auto-mode-alist))

(add-hook 'c-mode-common-hook
        '(lambda ()
                ;; センテンスの終了である ';' を入力したら、自動改行+インデント
;                (c-toggle-auto-hungry-state 1)
                ;; RET キーで自動改行+インデント
                (define-key c-mode-base-map "\C-m" 'newline-and-indent)
                 ))
;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x " "M-x "))
;(setq guide-key/highlight-command-regexp "rectangle")
(setq guide-key/popup-window-position 'bottom)
(guide-key-mode 1)  ; guide-key-mode を有効にする

;;theme
(load-theme 'manoj-dark t)

;; 以前開いたファイルを再度開いたとき、元のカーソル位置を復元する
;; ;; http://www.emacswiki.org/emacs/SavePlace

(when (require 'saveplace nil t)
  (setq-default save-place t)
  (setq save-place-file "~/.emacs.d/saved-places"))

(add-hook 'after-init-hook 'global-company-mode)


;; 全角スペースを赤ハイライト
(global-whitespace-mode 1)
  (setq whitespace-space-regexp "\\(\u3000\\)")
  (setq whitespace-style '(face tabs tab-mark spaces space-mark))
  (setq whitespace-display-mappings ())
  (set-face-foreground 'whitespace-tab "#F1C40F")
  (set-face-background 'whitespace-space "#E74C3C")


;;
;; tabbar
;; (install-elisp "http://www.emacswiki.org/emacs/download/tabbar.el")
;; ______________________________________________________________________

(require 'tabbar)
(tabbar-mode 1)

;; タブ上でマウスホイール操作無効
(tabbar-mwheel-mode -1)

;; グループ化しない
(setq tabbar-buffer-groups-function nil)

;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; タブの長さ
(setq tabbar-separator '(1.5))

;; 外観変更
(set-face-attribute
 'tabbar-default nil
 :family "Comic Sans MS"
 :background "black"
 :foreground "gray72"
 :height 1.0)
(set-face-attribute
 'tabbar-unselected nil
 :background "black"
 :foreground "grey72"
 :box nil)
(set-face-attribute
 'tabbar-selected nil
 :background "black"
 :foreground "yellow"
 :box nil)
(set-face-attribute
 'tabbar-button nil
 :box nil)
(set-face-attribute
 'tabbar-separator nil
 :height 1.5)

;; タブに表示させるバッファの設定
(defvar my-tabbar-displayed-buffers
  '("*scratch*" "*Messages*" "*Backtrace*" "*Colors*" "*Faces*" "*vc-")
  "*Regexps matches buffer names always included tabs.")

(defun my-tabbar-buffer-list ()
  "Return the list of buffers to show in tabs.
Exclude buffers whose name starts with a space or an asterisk.
The current buffer and buffers matches `my-tabbar-displayed-buffers'
are always included."
  (let* ((hides (list ?\  ?\*))
         (re (regexp-opt my-tabbar-displayed-buffers))
         (cur-buf (current-buffer))
         (tabs (delq nil
                     (mapcar (lambda (buf)
                               (let ((name (buffer-name buf)))
                                 (when (or (string-match re name)
                                           (not (memq (aref name 0) hides)))
                                   buf)))
                             (buffer-list)))))
    ;; Always include the current buffer.
    (if (memq cur-buf tabs)
        tabs
      (cons cur-buf tabs))))

(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

;; Ctrl-Tab, Ctrl-Shift-Tab でタブを切り替える
(dolist (func '(tabbar-mode tabbar-forward-tab tabbar-forward-group tabbar-backward-tab tabbar-backward-group))
  (autoload func "tabbar" "Tabs at the top of buffers and easy control-tab navigation"))
(defmacro defun-prefix-alt (name on-no-prefix on-prefix &optional do-always)
  `(defun ,name (arg)
     (interactive "P")
     ,do-always
     (if (equal nil arg)
         ,on-no-prefix
       ,on-prefix)))
(defun-prefix-alt shk-tabbar-next (tabbar-forward-tab) (tabbar-forward-group) (tabbar-mode 1))
(defun-prefix-alt shk-tabbar-prev (tabbar-backward-tab) (tabbar-backward-group) (tabbar-mode 1))
(global-set-key [(control tab)] 'shk-tabbar-next)
(global-set-key [(control shift tab)] 'shk-tabbar-prev)

;; タブ上をマウス中クリックで kill-buffer
(defun my-tabbar-buffer-help-on-tab (tab)
  "Return the help string shown when mouse is onto TAB."
  (if tabbar--buffer-show-groups
      (let* ((tabset (tabbar-tab-tabset tab))
             (tab (tabbar-selected-tab tabset)))
        (format "mouse-1: switch to buffer %S in group [%s]"
                (buffer-name (tabbar-tab-value tab)) tabset))
    (format "\
mouse-1: switch to buffer %S\n\
mouse-2: kill this buffer\n\
mouse-3: delete other windows"
            (buffer-name (tabbar-tab-value tab)))))

(defun my-tabbar-buffer-select-tab (event tab)
  "On mouse EVENT, select TAB."
  (let ((mouse-button (event-basic-type event))
        (buffer (tabbar-tab-value tab)))
    (cond
     ((eq mouse-button 'mouse-2)
      (with-current-buffer buffer
        (kill-buffer)))
     ((eq mouse-button 'mouse-3)
      (delete-other-windows))
     (t
      (switch-to-buffer buffer)))
    ;; Don't show groups.
    (tabbar-buffer-show-groups nil)))

(setq tabbar-help-on-tab-function 'my-tabbar-buffer-help-on-tab)
(setq tabbar-select-tab-function 'my-tabbar-buffer-select-tab)


(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)

;; autoinsert
(auto-insert-mode 1)
(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-alist
      (append '(                                  ;;テンプレートファイルのファイル名のリスト
                ("\\.tex" . "template.tex")
                ("\\.cpp". "template.cpp")
                ("\\.c". "template.c")
                ) auto-insert-alist))
(setq auto-insert-directory "~/.emacs.d/template/")  ;;テンプレートファイルのディレクトリ

;; header auto-complete
(require 'auto-complete-c-headers)
(add-hook 'c++-mode-hook '(setq ac-sources (append ac-sources '(ac-source-c-headers))))
(add-hook 'c-mode-hook '(setq ac-sources (append ac-sources '(ac-source-c-headers))))

; window movement
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <right>") 'windmove-right)

(super-save-mode +1)
(setq super-save-auto-save-when-idle t)
(setq auto-save-default nil)
