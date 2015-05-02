(require 'thingatpt) 
;; For hi-blue face. 
(require 'hi-lock) 
(defvar light-symbol-idle-delay 0
  "*Number of seconds of idle time to wait before highlighting. 
If this variable is set to 0, no idle time is required.") 
(defvar light-symbol-face 'hi-blue 
  "*Face to use when highlighting. 
Default is the `hi-blue' face from `hi-lock'.") 
;; Our timer object. 
(defvar light-symbol-timer nil) 
;; The last argument we passed to font-lock-add-keywords, or nil if 
;; there wasn't one. 
(defvar light-symbol-previous-symbol nil) 
(defconst light-symbol-rx-start 
  (if (< emacs-major-version 22) 
      "\\<" 
    "\\_<") 
  "Start-of-symbol regular expression marker.") 
(defconst light-symbol-rx-end 
  (if (< emacs-major-version 22) 
      "\\>" 
    "\\_>") 
  "End-of-symbol regular expression marker.") 
(defun light-symbol-schedule-timer () 
  (unless (and light-symbol-timer 
               (memq light-symbol-timer timer-idle-list)) 
    (setq light-symbol-timer 
          (run-with-idle-timer light-symbol-idle-delay t 
                               'light-symbol-show-symbol)))) 
(defun light-symbol-refontify () 
  (unless font-lock-mode 
    (font-lock-mode 1)) 
  (font-lock-fontify-buffer)) 
(defun light-symbol-show-symbol () 
  (when (and light-symbol-mode 
             ;; FIXME: this should prevent us from changing when 
             ;; isearch is running but does not... ? 
             (not this-command)) 
    (let ((refontify nil)) 
      (when light-symbol-previous-symbol 
        (font-lock-remove-keywords nil light-symbol-previous-symbol) 
        (setq refontify t)) 
      (let ((sym (thing-at-point 'symbol))) 
        (if sym 
            (progn 
              (set-text-properties 0 (length sym) nil sym) 
              (setq light-symbol-previous-symbol 
                    (list (list 
                           (concat light-symbol-rx-start 
                                   (regexp-quote sym) 
                                   light-symbol-rx-end) 
                           (list 0 (list 'quote light-symbol-face) t)))) 
              (font-lock-add-keywords nil light-symbol-previous-symbol) 
              (setq refontify t)) 
          (setq light-symbol-previous-symbol nil))) 
      (if refontify 
          (light-symbol-refontify))))) 
(defun light-symbol-pre-command () 
  (when light-symbol-previous-symbol 
    (font-lock-remove-keywords nil light-symbol-previous-symbol) 
    (setq light-symbol-previous-symbol nil) 
    (light-symbol-refontify))) 
;;;###autoload 
(define-minor-mode light-symbol-mode 
  "Toggle Light Symbol mode. 
With no argument, this command toggles the mode. 
Non-null prefix argument turns on the mode. 
Null prefix argument turns off the mode. 
When Light Symbol mode is enabled, pausing will highlight the 
symbol under point in the current buffer." 
  ;; Initial value. 
  nil 
  ;; Indicator. 
  " LS" 
  ;; Keymap. 
  nil 
  ;; Body. 
  (if light-symbol-mode 
      (progn 
        (add-hook 'pre-command-hook #'light-symbol-pre-command) 
        (light-symbol-schedule-timer)) 
    (remove-hook 'pre-command-hook #'light-symbol-schedule-timer) 
    (when light-symbol-timer 
      (cancel-timer light-symbol-timer) 
      (setq light-symbol-timer nil)))) 
;;; light-symbol.el ends here 
