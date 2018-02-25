sub FF4Rom.ReadCharacters()
 dim start as Long
 dim level_ptr as Long
 for index as Integer = 0 to total_characters
  start = &h7AB00 + index * &h20
  characters(index)->initial_actor = actors(ByteAt(start) mod 2^5 - 1)
  characters(index)->left_handed = bit(ByteAt(start), 6)
  characters(index)->right_handed = bit(ByteAt(start), 7)
  characters(index)->job_link = jobs(ByteAt(start + 1) mod 2^4)
  characters(index)->level = ByteAt(start + 2)
  characters(index)->max_hp = ByteAt(start + 9) + ByteAt(start + 10) * &h100
  characters(index)->max_mp = ByteAt(start + 13) + ByteAt(start + 14) * &h100
  for i as Integer = 0 to 4
   characters(index)->stats(i) = ByteAt(start + 15 + i)
  next
  characters(index)->xp = ByteAt(start + &h17) + ByteAt(start + &h18) * &h100 + ByteAt(start + &h19) * &h10000
  characters(index)->tnl = ByteAt(start + &h1D) + ByteAt(start + &h1E) * &h100 + ByteAt(start + &h1F) * &h10000
  start = &h7B700 + (ByteAt(start) mod 2^5 - 1)  * 2
  level_ptr = &h70200 + ByteAt(start) + ByteAt(start + 1) * &h100 + (characters(index)->level - 1) * 5
  for i as Integer = characters(index)->level to 69
   characters(index)->levelups(i).stat_bonus.FromByte(level_ptr)
   characters(index)->levelups(i).hp_bonus = ByteAt(level_ptr + 1)
   characters(index)->levelups(i).mp_bonus = ByteAt(level_ptr + 2) mod 2^5
   characters(index)->levelups(i).tnl = ByteAt(level_ptr + 3) + ByteAt(level_ptr + 4) * &h100 + (ByteAt(level_ptr + 2) \ 2^5) * &h10000
   level_ptr += 5
  next
  for i as Integer = 0 to 7
   characters(index)->after70(i).FromByte(level_ptr + i)
  next
 next
end sub

sub FF4Rom.WriteCharacters()
 dim start as Long
 dim temp as UByte
 dim level_ptr(total_characters) as Long
 for index as Integer = 0 to total_characters
  start = &h7AB00 + index * &h20
  temp = ActorIndex(characters(index)->initial_actor) + 1
  if characters(index)->left_handed then temp = bitset(temp, 6)
  if characters(index)->right_handed then temp = bitset(temp, 7)
  WriteByte(start, temp)
  WriteByte(start + 1, JobIndex(characters(index)->job_link))
  WriteByte(start + 2, characters(index)->level)
  WriteByte(start + 7, characters(index)->max_hp mod &h100)
  WriteByte(start + 8, characters(index)->max_hp \ &h100)
  WriteByte(start + 9, characters(index)->max_hp mod &h100)
  WriteByte(start + 10, characters(index)->max_hp \ &h100)
  WriteByte(start + 11, characters(index)->max_mp mod &h100)
  WriteByte(start + 12, characters(index)->max_mp \ &h100)
  WriteByte(start + 13, characters(index)->max_mp mod &h100)
  WriteByte(start + 14, characters(index)->max_mp \ &h100)
  for i as Integer = 0 to 4
   WriteByte(start + 15 + i, characters(index)->stats(i))
  next
  WriteByte(start + &h17, characters(index)->xp mod &h100)
  WriteByte(start + &h18, (characters(index)->xp \ &h100) mod &h100)
  WriteByte(start + &h19, characters(index)->xp \ &h10000)
  WriteByte(start + &h1D, characters(index)->tnl mod &h100)
  WriteByte(start + &h1E, (characters(index)->tnl \ &h100) mod &h100)
  WriteByte(start + &h1F, characters(index)->tnl \ &h10000)
 next
 start = &h7B728
 for index as Integer = 0 to total_characters
  level_ptr(index) = start - &h70200 - (characters(index)->level - 1) * 5
  for i as Integer = characters(index)->level to 69
   WriteByte(start, characters(index)->levelups(i).stat_bonus.ToByte())
   WriteByte(start + 1, characters(index)->levelups(i).hp_bonus)
   temp = characters(index)->levelups(i).mp_bonus
   temp += (characters(index)->levelups(i).tnl \ &h10000) * 2^5
   WriteByte(start + 2, temp)
   WriteByte(start + 3, characters(index)->levelups(i).tnl mod &h100)
   WriteByte(start + 4, characters(index)->levelups(i).tnl \ &h100)
   start += 5
  next
  for i as Integer = 0 to 7
   WriteByte(start + i, characters(index)->after70(i).ToByte())
  next
 next
 for index as Integer = 0 to total_actors
  start = &h7B700 + index * 2
  WriteByte(start, level_ptr(CharacterIndex(actors(index)->character_link) mod &h100))
  WriteByte(start + 1, level_ptr(CharacterIndex(actors(index)->character_link) \ &h100))
 next
end sub
