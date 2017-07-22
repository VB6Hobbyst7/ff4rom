'Normally, you have to insert your own line breaks manually. This method
' attempts to automatically word wrap a given message, putting line breaks
' where they should go.
function FF4Rom.WrapMessage(text as String) as String

 dim linelength as Integer
 dim symbol as UByte
 dim index as Integer = 1
 dim lines as List
 dim newtext as String
 dim substring as String
 dim words as List
 dim word as String
 dim max_line_length as Integer = 26
 dim indent as Boolean

 'Remove all existing line breaks
 do until index >= len(text)
  symbol = asc(mid(text, index, 1))
  if MessageCodeTakesParameter(symbol) then
   index += 1
  elseif symbol = line_break_code or symbol = blank_line_code then
   text = left(text, index - 1) + space_symbol + mid(text, index + 1)
   index -= 1
  end if
  index += 1
 loop

 'Insert line breaks where they should go
 words = Tokenize(text, space_symbol)
 indent = false
 'for i as Integer = 1 to lines.Length()
  for j as Integer = 1 to words.Length()
   word = words.ItemAt(j)
   'print "Word "; Pad(str(j), 2, true); ": "; Pad(DisplayText(word), 20);
   'for i as Integer = 1 to len(word)
    'print "["; hex(asc(mid(word, i, 1)), 2); "]";
   'next
   'print
   if instr(word, ConvertText(":")) > 0 then
    if len(substring) > 0 then newtext += substring + chr(line_break_code)
    substring = word
    indent = true
   elseif MessageOutputLength(substring + iif(len(substring) > 0, space_symbol, "") + word) > max_line_length then
    newtext += substring + chr(line_break_code)
    substring = iif(indent, space_symbol, "") + word
   else
    substring += iif(len(substring) > 0, space_symbol, "") + word
   end if
  next
 'next
 if len(substring) > 0 then newtext += substring

 return newtext

end function

