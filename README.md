# sexp-diff
[![Melpa](https://melpa.org/packages/sexp-diff-badge.svg)](https://melpa.org/#/sexp-diff)

This package provides an S-expression-aware diffing tool based on Levenshtein-like tree edit distance.

``` emacs-lisp
(sexp-diff
 '(+ (* x 2) 1)
 '(- (* x 2) 3 1))
;; => ((:new - :old + (* x 2) :new 3 1))

(sexp-diff
 '(+ (* x 2) 4 1)
 '(- (* x 2) 5 3 1))
;; => ((:new - :old + (* x 2) :new 5 :new 3 :old 4 1))

(sexp-diff
 '(+ (* x 2) 4 4 1)
 '(- (* x 2) 5 5 3 1))
;; => ((:new - :old + (* x 2) :new 5 :new 5 :new 3 :old 4 :old 4 1))

(sexp-diff
 '(1   2 3 4)
 '(1 2 2   4)
 :old-marker :expected :new-marker :actual)
;; => ((1 :actual 2 2 :expected 3 4))
```

Ported directly from https://docs.racket-lang.org/sexp-diff/index.html
