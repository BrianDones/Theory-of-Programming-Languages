/* Brian Dones
   Professor labouseur
   Theory of Programming Languages
   May 4, 2014
*/

object CaesarCipher{
		/* This functionchecks if the the char value is a lowercase, 
		   uppercase, or space.
		*/
		
        def caesar(shiftValue:Int,c:Char) = c match {
    		case c if c isLower => ('a'+((c-'a'+shiftValue)%26)).toChar
			case c if c isUpper => ('A'+((c-'A'+shiftValue)%26)).toChar
			case _ => c
		}
		
		/* The encrypt function takes in a String and a shift value,
		   then maps the shift Value over a string and returns an
		   encrypted string.
		*/
		
		def encrypt(s:String,shiftValue:Int) = s map (c=>caesar(shiftValue,c))
		
		/* The decrypt function is built off the encrypt function, but
		   instead maps a negative shift value over the string.
		   NOTE: Subtracting the shift Value from 26 helps the decrypt
		   function "wrap around" correctly when you are decrypting 
		   lower than the value for a.
		*/
		
		def decrypt(s:String,shiftValue:Int) = encrypt(s,(26-shiftValue))
		
		
		def solve(s:String) = for (shiftValue <- 0 until 27) {
			println(encrypt(s,shiftValue))
		}
		
		
        def main(args:Array[String]){
				println(encrypt("Stacy's mom has got it going on!", 1))
				println(decrypt("Ebojfm Dsbjh tvdlt", 1))
				println(solve("a final test case"))
		}
}

/* If you are compiling and executing this program using http://www.tutorialspoint.com/compile_scala_online.php
   then copy and paste the following code in and ignoring the warning given. 
 

 object HelloWorld {
      /* This functionchecks if the the char value is a lowercase, 
		   uppercase, or space.
		*/
		
        def caesar(shiftValue:Int,c:Char) = c match {
    		case c if c isLower => ('a'+((c-'a'+shiftValue)%26)).toChar
			case c if c isUpper => ('A'+((c-'A'+shiftValue)%26)).toChar
			case _ => c
		}
		
		/* The encrypt function takes in a String and a shift value,
		   then maps the shift Value over a string and returns an
		   encrypted string.
		*/
		
		def encrypt(s:String,shiftValue:Int) = s map (c=>caesar(shiftValue,c))
		
		/* The decrypt function is built off the encrypt function, but
		   instead maps a negative shift value over the string.
		   NOTE: Subtracting the shift Value from 26 helps the decrypt
		   function "wrap around" correctly when you are decrypting 
		   lower than the value for a.
		*/
		
		def decrypt(s:String,shiftValue:Int) = encrypt(s,(26-shiftValue))
		
		
		def solve(s:String) = for (shiftValue <- 0 until 27) {
			println(encrypt(s,shiftValue))
		}
		
		
        def main(args:Array[String]){
				println(encrypt("Stacy's mom has got it going on!", 1))
				println(decrypt("Ebojfm Dsbjh tvdlt", 1))
				println(solve("a final test case"))
		}
} */