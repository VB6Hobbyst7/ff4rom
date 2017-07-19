type Message

 text as String

 declare sub Wrap()

end type


const total_bank1_messages = 511
const total_bank3_messages = 255

const line_break_code = 1
const message_end_code = 0
const song_code = 3
const name_code = 4
const pause_code = 5
const item_code = 7


sub Message.Wrap()

 dim linelength as Integer
 dim symbol as UByte
 dim index as Integer = 1
 dim lines as List
 dim newtext as String
 dim substring as String
 dim words as List
 dim word as String
 dim max_line_length as Integer = 30 'I can't remember

 'Remove all existing line breaks
 ' (Leave in line breaks at the end of blank lines)
 do until index >= len(text)
  symbol = asc(mid(text, index, 1))
  if symbol = line_break_code then
   if linelength > 0 then
    text = left(text, index - 1) + mid(text, index + 1)
    index -= 1
   end if
  end if
  index += 1
 loop

 'Insert line breaks where they should go
 lines = Tokenize(text, chr(line_break_code))
 for i as Integer = 1 to lines.Length()
  words = Tokenize(text, chr(space_symbol))
  for j as Integer = 1 to words.Length()
   word = words.ItemAt(j)
   if MessageOutputLength(substring) + MessageOutputLength(word) > max_line_length then
    newtext += mid(substring, 2) + line_break_code
    substring = ""
   else
    substring += chr(space_symbol) + word
   end if
  next
 next
 if len(substring) > 0 then newtext += mid(substring, 2)
 newtext += message_end_code

 text = newtext

end sub
