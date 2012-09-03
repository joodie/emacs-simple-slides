;;; simple-slides.el --- Show page-break (^L) separated files as slides.

;; Copyright (c) 2011 Joost Diepenmaat, Zeekat Softwareontwikkeling.
;; joost@zeekat.nl http://joost.zeekat.nl/



;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 2 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.



;;; Commentary:
;;
;; show page-break (^L) separated files as slides.
;; Btw, to insert ^L in an Emacs buffer, hit 'C-q C-l'
;;
;; call M-x slide-init to start with the current buffer
;;
;; use C-v and M-v to navigate, as usual. 
;;
;; use M-x slide-quit to stop
;;



(defun slide-show-next-page ()
  (interactive)
  (goto-line 0) ; narrow to next page gets confused if point is at
                ; last line
  (narrow-to-page 1))



(defun slide-show-prev-page ()
  (interactive)
  (goto-line 0)
  (narrow-to-page -1)
  (goto-line 0))



(defun slide-init ()
  (interactive)
  (widen)
  (goto-line 0)
  (narrow-to-page 0)
  (local-set-key [(C v)] #'slide-show-next-page)
  (local-set-key [(M v)] #'slide-show-prev-page)
  ; you might play with the number. In case size does matter.
  (text-scale-adjust 3))



(defun slide-quit ()
  (interactive)
  (widen)
  (text-scale-adjust 0)
  (local-unset-key [(C v)])
  (local-unset-key [(M v)]))



; The END.


