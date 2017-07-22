'This takes an ascii string and converts it into the FF4 character encoding.

function FF4Rom.ConvertText(text as String) as String

 dim result as String
 dim letter as String
 dim temp as UByte

 for i as Integer = 1 to len(text)
  letter = mid(text, i, 1)
  select case letter
   case "0" to "9"
    temp = asc(letter) + &h50
   case "A" to "Z"
    temp = asc(letter) + 1
   case "a" to "z"
    temp = asc(letter) - 5
   case " "
    temp = &hFF
   case "#"
    temp = &h15
   case "'"
    temp = &hC0
   case "."
    temp = &hC1
   case "-"
    temp = &hC2
   case "_"
    temp = &hC3
   case "!"
    temp = &hC4
   case "?"
    temp = &hC5
   case "%"
    temp = &hC6
   case "/"
    temp = &hC7
   case ":"
    temp = &hC8
   case ","
    temp = &hC9
   case else
    temp = asc(letter)
  end select
  result += chr(temp)
 next

 return result

end function
