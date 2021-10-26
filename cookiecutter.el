;;; cookiecutter.el --- Emacs cookiecutter utilities

;; Copyright (C) 2021 Rui Vieira

;; Author: Rui Vieira <ruidevieira@googlemail.com>
;; Version: 0.1
;; Keywords: python, projects
;; URL: https://github.com/ruivieira/cookiecutter.el

;;; Commentary:

;; A package to manage cookiecutter projects.


;;; Code:
(defun cookiecutter--run-make-target (target)
  (when (locate-dominating-file default-directory "Makefile")
    (cd (locate-dominating-file default-directory "Makefile"))
    (comint-send-string
     (get-buffer-process (shell)) (format "make %s\n" target))))

;;;###autoload
(defun cookiecutter-ds-data ()
  "Bind the main Makefile and create the dataset."
  (interactive)
(cookiecutter--run-make-target "data"))

(defun cookiecutter-ds-features ()
  "Create the features for this project"
  (interactive)
  (cookiecutter--run-make-target "features"))

(defun cookiecutter-ds-train ()
  "Train the model for this project"
  (interactive)
  (cookiecutter--run-make-target "train"))

(provide 'cookiecutter)
;;; cookiecutter.el ends here
