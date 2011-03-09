;;;; show page-break separated pages as slides.
;;;; call M-x slide-init to start with the current buffer
;;;; use M-] and M-[ to navigate
;;;; use M-x slide-quit to stop
;;;;
;;;; currently messes with the global font settings. sorry about that.
;;;;
 
;; (c) 2011 Joost Diepenmaat, Zeekat Softwareontwikkeling.
;;          joost@zeekat.nl http://joost.zeekat.nl/


;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 2 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(defun slide-show-next-page
  ()
  (interactive)
  (goto-line 0) ; narrow to next page gets confused if point is at
                ; last line
  (narrow-to-page 1))

(defun slide-show-prev-page
  ()
  (interactive)
  (goto-line 0)
  (narrow-to-page -1)
  (goto-line 0))

(defun slide-init
  ()
  (interactive)
  (widen)
  (goto-line 0)
  (narrow-to-page 0)
  (local-set-key [(super \])] #'slide-show-next-page)
  (local-set-key [(super \[)] #'slide-show-prev-page)
  (set-face-attribute 'default nil
                    :family "Inconsolata" :height 250 :weight 'normal))

(defun slide-quit
  ()
  (interactive) 
  (widen)
  (set-face-attribute 'default nil
                      :family "Inconsolata" :height (case system-type
                                                      ('gnu/linux 130)
                                                      ('darwin 145)) :weight 'normal))

(provide 'simple-slides)
