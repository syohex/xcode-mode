;; Copyright (C) 2015 Nickolas S Lanasa III

;; Author: Nickolas S Lanasa III <nick@nytekproductions.com>
;; Keywords: Xcode iOS

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(require 'xcode-helpers)

(defun xcode-build-project ()
  "Builds the Xcode project using xcodebuild."
  (interactive)
  (xcode-compile (format "xcodebuild -project %s -sdk %s -configuration %s"
												 (xcode-select-project)
												 (xcode-select-sdk)
												 (xcode-select-build-config))))

(defun xcode-build-workspace ()
  "Builds the Xcode workspace using xcodebuild."
  (interactive)
  (progn
    (let* ((workspace (xcode-select-workspace)))
      (xcode-compile (format "xcodebuild build -scheme %s -workspace %s -sdk %s -configuration %s"
														 (completing-read
															"Select scheme: "
															(xcode-find-schemes-for-workspace workspace) nil t)
														 workspace
														 (xcode-select-sdk)
														 (xcode-select-build-config))))))

(provide 'xcode-building)
