(asdf:defsystem #:lambda-web
		:description "A compiler web explorer."
		:author "Job Hernandez <hj93@protonmail.com>"
		:version (:read-file-form "VERSION.txt")
		:depends-on (#:hunchentoot #:trivia #:com.inuoe.jzon)
		:license "MIT License"
		:around-compile (lambda (compile)
				  (let (#+sbcl (sb-ext:*derive-function-types* t))
				    (funcall compile)))
		:serial t
		:pathname "src/"
		:components
		((:file "package")
		 (:file "compiler")
		 (:file "server")
		 (:file "parser")
		 (:file "desugar")
		 (:file "cps")))
