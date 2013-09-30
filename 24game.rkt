#lang swindle
(require racket/cmdline)

(define (plus a b) (+ a b))
(define (minus a b) (- a b))
(define (times a b) (* a b))
(define (divide a b) (if (eqv? b 0) (amb) (/ a b)))

(define (s a b c d)
  (
     let ((o1 (amb (cons plus "+") (cons minus "-") (cons times  "*") (cons divide "/")))
          (o2 (amb (cons plus "+") (cons minus "-") (cons times  "*") (cons divide "/")))
          (o3 (amb (cons plus "+") (cons minus "-") (cons times  "*") (cons divide "/")))
          (v1 (amb (cons a "a") (cons b "b") (cons c "c") (cons d "d")))
          (v2 (amb (cons a "a") (cons b "b") (cons c "c") (cons d "d")))
          (v3 (amb (cons a "a") (cons b "b") (cons c "c") (cons d "d")))
          (v4 (amb (cons a "a") (cons b "b") (cons c "c") (cons d "d")))
          (form (amb 1 2)))
      (begin 
        (if (eqv? (cdr v1) (cdr v2)) (amb))
        (if (eqv? (cdr v1) (cdr v3)) (amb))
        (if (eqv? (cdr v1) (cdr v4)) (amb))
        (if (eqv? (cdr v2) (cdr v3)) (amb))
        (if (eqv? (cdr v2) (cdr v4)) (amb))
        (if (eqv? (cdr v3) (cdr v4)) (amb))
        (cond [(eqv? form 1) 
               (if (eqv? ((car o3) (car v1) ((car o2) (car v2) ((car o1) (car v3) (car v4)))) 24) 
                                 (display (string-append (number->string (car v1)) (cdr o3) "(" (number->string (car v2)) (cdr o2) "(" (number->string (car v3)) (cdr o1) (number->string (car v4)) "))\n" )) 
                                 (amb))]
 
             [(eqv? form 2) 
               (if (eqv? ((car o3) ((car o2) (car v1) (car v2)) ((car o1) (car v3) (car v4))) 24) 
                                 (display (string-append "(" (number->string (car v1)) (cdr o2) (number->string (car v2)) ")" (cdr o3) "(" (number->string (car v3)) (cdr o1) (number->string (car v4)) ")\n" )) 
                                 (amb))]
              

        )
      )
   )
  )

(s (string->number (vector-ref (current-command-line-arguments) 0))
   (string->number (vector-ref (current-command-line-arguments) 1)) 
   (string->number (vector-ref (current-command-line-arguments) 2)) 
   (string->number (vector-ref (current-command-line-arguments) 3)))

