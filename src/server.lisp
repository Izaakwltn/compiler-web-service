(in-package #:lambda-server)

(defun start-server ()
  (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port 4243)))

(define-easy-handler (comp :uri "/compile") (exp)
  (setf (content-type*) "application/json")
  (let* ((ht (make-hash-table :test 'equal))
	 (e (list (read-from-string exp)))
	 (e2 `(,e))
	 (e3 (car (car e2)))
	 (expr (compile-scheme e3)))
    (setf (gethash 'expression ht) (write-to-string expr))
    (stringify ht :pretty t :stream t)))
