;; -*- lexical-binding: t; -*-

(require 'ert)
(require 'sexp-diff)

(ert-deftest sexp-diff ()
  (should (equal (sexp-diff
                  '(+ (* x 2) 1)
                  '(- (* x 2) 3 1))
                 '((:new - :old + (* x 2) :new 3 1))))
  (should (equal (sexp-diff
                  '(+ (* x 2) 4 1)
                  '(- (* x 2) 5 3 1))
                 '((:new - :old + (* x 2) :new 5 :new 3 :old 4 1))))
  (should (equal (sexp-diff
                  '(+ (* x 2) 4 4 1)
                  '(- (* x 2) 5 5 3 1))
                 '((:new - :old + (* x 2) :new 5 :new 5 :new 3 :old 4 :old 4 1))))
  (should (equal (sexp-diff
                  '(1   2 3 4)
                  '(1 2 2   4)
                  :old-marker :expected :new-marker :actual)
                 '((1 :actual 2 2 :expected 3 4)))))
