program caesarCipher
	implicit none
	
	interface
		subroutine encrypt (text, shiftValue)
			character (*), intent(in) :: text
			integer :: shiftValue
		end subroutine encrypt
		
		
		subroutine decrypt (text, shiftValue)
			character (*), intent(in) :: text
			integer :: shiftValue
		end subroutine decrypt
		
		
		subroutine solve (text, shiftValue)
			character (*), intent(in) :: text
			integer :: shiftValue
		end subroutine solve
		
		
		function capitalize (text)
			character (*), intent(in) :: text
			character (len=len_trim(text)) :: capitalize
		end function capitalize
		
	end interface
	
	character (len = 35) :: firstTestCase ="Sean Connery is the best James Bond"
	character (len = 19) :: secondTestCase ="This is a test case"
	character (len = 25) :: thirdTestCase ="This is a final test case"
	integer :: shiftValue
	shiftValue = 8

	firstTestCase = capitalize(firstTestCase)
	secondTestCase = capitalize(secondTestCase)
	thirdTestCase = capitalize(thirdTestCase)

	print *, "String: Sean Connery is the best James Bond, Shift: 8"
	call encrypt(firstTestCase, shiftValue)

	print *, ""
	print *, "String: This is a test case, Shift Value: 19"
	shiftValue = 19
	call decrypt(secondTestCase, shiftValue)

	print *, ""
	print *, "String: This is a final test case, Shift Value: 26"
	shiftValue = 26
	call solve(thirdTestCase, shiftValue)


end program caesarCipher

function capitalize(text) result(tempValue)
	implicit none
	character(len=*), intent(in) :: text
	character(len=len_trim(text)):: tempValue
	integer :: i
	tempValue = ""


	do i = 1, len(text), 1
		if (ichar(text(i:i)) > 90) then
			tempValue(i:i) = achar(iachar(text(i:i)) - 32)
		else
			tempValue(i:i) = text(i:i)
		endif
	end do
end function capitalize


subroutine encrypt(text, shiftValue)
	implicit none
	character (len=*), intent(in) :: text
	character (len=len(text)) :: tempValue
	integer :: shiftValue
	integer :: i

	tempValue = ""


	do i = 1, len(text), 1
		if (IACHAR(text(i:i)) == 32) then
			tempValue(i:i) = " "
		else 
			if (IACHAR(text(i:i)) + shiftValue > 90 ) then
				tempValue(i:i) = ACHAR(64 + ((IACHAR(text(i:i)) + shiftValue) - 90))
			else
				tempValue(i:i) = ACHAR(IACHAR(text(i:i)) + shiftValue)
			endif
		endif
	end do

	print *, tempValue
end subroutine encrypt

subroutine decrypt(text, shiftValue)
	implicit none
	character (len=*), intent(in) :: text
	character (len=len(text)) :: tempValue
	integer :: shiftValue
	integer :: i

	tempValue = ""


	do i = 1, len(text), 1
		if (IACHAR(text(i:i)) == 32) then
			tempValue(i:i) = " "
		else 
			if (IACHAR(text(i:i)) - shiftValue < 65 ) then
				tempValue(i:i) = ACHAR(91 - (65 - (IACHAR(text(i:i)) - shiftValue)))
			else
				tempValue(i:i) = ACHAR(IACHAR(text(i:i)) - shiftValue)
			endif
		endif
	end do

	print *, tempValue
end subroutine decrypt

subroutine solve(text, shiftValue)
	implicit none
	character (len=*), intent(in) :: text
	integer :: shiftValue
	integer :: i

	do i = shiftValue, 0, -1 
		call decrypt(text, i)
	end do
end subroutine solve