;INSERTCODE
;------------------------------------------------------------------------------

(define (time x) x) ;; noop until ribbit has a way of measuring time

(define (run-bench name count ok? run)
  (letrec ((loop 
	     (lambda (i result)
	       (if (< 0 i)
		   (loop (- i 1) (run))
		   result))))
    (loop count #f)))

(define (run-benchmark name count ok? run-maker . args)
  (let ((run (apply run-maker args)))
    (let ((result (time (run-bench name count ok? run))))
      (if (not (ok? result))
        (##exit 1)
	(##exit 0)))))

;(define (fatal-error . args)
;  (apply error args))

;(define (call-with-output-file/truncate filename proc)
;   (call-with-output-file filename proc))
