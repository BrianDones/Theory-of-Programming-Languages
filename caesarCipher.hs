{-
   Brian Dones
   Alan Labouseur
   Theory of Programming Languages
   March 28, 2014
   
   Caesar Cipher Project in Haskell
-}

import Data.Char

-- This function takes a letter or character and gets the ascii value
asciiValue :: Char -> Int
asciiValue x = ord x - ord 'a'

-- This function takes an ascii value and returns the character or
-- letter value
toChar :: Int -> Char
toChar num = chr (ord 'a' + num)

-- This function takes a shift value and adds the shift value to
-- the ascii value of a character
shiftValue :: Int -> Char -> Char
shiftValue num x 
    | isLower x = toChar ((asciiValue x + num) `mod` 26)
	| isUpper x = toChar ((asciiValue x + num) `mod` 26)
	| otherwise = x

-- This function takes a shift value and a string, then uses a list
-- comprehension to add the shift value to a letter within the string
-- returning an encrypted string
encrypt :: Int -> String -> String
encrypt num xs = [shiftValue num x | x <- xs]

-- This function takes a shift value and negates the value then encrypts
-- that string
decrypt :: Int -> String -> String
decrypt num xs = encrypt (negate num) xs

-- This function takes a shift value and continuously encrypt the string over
-- and over again until the shift value equals a max shift value of 26
solve :: Int -> String -> [String]
solve shift xs = if (shift <= 26)
					then encrypt (shift) xs:[] ++ solve (shift+1) xs
					else []