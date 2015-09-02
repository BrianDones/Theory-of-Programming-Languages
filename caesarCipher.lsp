;;; Alan Labouseur
;;; Theory of Programming Languages
;;; April 29, 2014

;;; encrypt function
(print "Encrypt function. Input is: Sean Connery, with a shift value of 2")
(print
(map 'string (lambda (input)
  	(if(/= (char-code input) 32)
				(if (>(+(char-code input) 2) 90)
						(code-char(+ 64 (-(+(char-code input) 2) 90)))
				(code-char(+ (char-code input) 2)))
		(code-char 32)))(string-upcase "Sean Connery")))

		
;;; decrypt function
(print "Decrypt function. Input is: Jut hpjoh up cf mfhfoebsz, with a shift value of 1")
(print 
(map 'string (lambda (input)
		(if(/= (char-code input) 32)
				(if (<(-(char-code input) 1) 65)
						(code-char(- 91 (- 65 (-(char-code input) 1))))
				(code-char(- (char-code input) 1)))
		(code-char 32)))(string-upcase "Jut hpjoh up cf mfhfoebsz")))
		
;;; solve function
(print "Solve function. Input is: a, with a max shift of 26")
(loop for shiftValue from 0 to 26 do 
(print (map 'string (lambda (input) 
	(if(/= (char-code input) 32) 
		(if (<(-(char-code input) shiftValue) 65)
			(code-char(- 91 (- 65 (-(char-code input) shiftValue))))
		(code-char(- (char-code input) shiftValue)))
	(code-char 32)))(string-upcase "z y"))))