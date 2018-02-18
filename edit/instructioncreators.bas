function FF4Rom.InstructionFromBytes(bytes as List) as Instruction ptr

 dim result as Instruction ptr
 dim code as UByte
 dim xx as UByte
 dim yy as UByte
 dim zz as UByte
 dim ww as UByte
 dim templist as List
 
 code = bytes.ValueAt(1)
 xx = bytes.ValueAt(2)
 yy = bytes.ValueAt(3)
 zz = bytes.ValueAt(4)
 ww = bytes.ValueAt(5)
 
 select case code
 case is <= you_spin_instruction
  result = MovementInstruction(code)
 case rumble_instruction to screen_fade_instruction
  result = ScreenInstruction(xx)
 case toggle_status_instruction
  for i as Integer = 0 to 7
   if bit(xx, i) then templist.AddValue(i + 8)
  next
  result = ToggleStatusInstruction(templist)
 case pay_instruction
  result = PayInstruction(xx)
 case set_leader_instruction
  result = SetLeaderInstruction(actors(xx))
 case restore_hp_instruction
  result = RestoreHPInstruction(xx)
 case restore_mp_instruction
  result = RestoreMPInstruction(xx)
 case gain_item_instruction
  result = GainItemInstruction(items(xx))
 case lose_item_instruction
  result = LoseItemInstruction(items(xx))
 case learn_instruction
  result = LearnInstruction(spells(yy), spellsets(xx))
 case lose_status_instruction
  for i as Integer = 0 to 7
   if bit(xx, i) then templist.AddValue(i + 8)
  next
  result = LoseStatusInstruction(templist)
 case gain_status_instruction
  for i as Integer = 0 to 7
   if bit(xx, i) then templist.AddValue(i + 8)
  next
  result = GainStatusInstruction(templist)
 case gain_gil_instruction
  result = GainGilInstruction(xx)
 case lose_gil_instruction
  result = LoseGilInstruction(xx)
 case gain_actor_instruction
  result = GainActorInstruction(actors(xx))
 case lose_actor_instruction
  result = LoseActorInstruction(actors(xx))
 case pause_instruction
  result = PauseInstruction(xx)
 case fade_song_instruction
  result = FadeSongInstruction(xx)
 case repeat_instruction
  result = RepeatInstruction(yy, xx)
 case battle_instruction
  result = BattleInstruction(xx)
 case shop_instruction
  result = ShopInstruction(shops(xx))
 case bank2_call_instruction
  result = Bank2Instruction(xx, false)
 case bank2_map_instruction
  result = Bank2Instruction(xx, true)
 case bank1_low_instruction
  result = Bank1Instruction(bank1_messages(xx))
 case bank1_high_instruction
  result = Bank1Instruction(bank1_messages(xx + &h100))
 case set_flag_instruction
  result = SetFlagInstruction(xx)
 case clear_flag_instruction
  result = ClearFlagInstruction(xx)
 case activate_instruction
  result = ActivateInstruction(npcs(xx))
 case deactivate_instruction
  result = DeactivateInstruction(npcs(xx))
 case bank3_instruction
  result = Bank3Instruction(bank3_messages(xx))
 case pick_item_instruction
  result = PickItemInstruction(items(xx))
 case yesno_instruction
  result = YesNoInstruction(bank1_messages(xx + &h100))
 case tint_instruction
  result = TintInstruction(xx)
 case play_song_instruction
  result = PlaySongInstruction(xx)
 case sfx_instruction
  result = SFXInstruction(xx)
 case vfx_instruction
  result = VFXInstruction(xx)
 case teleport_instruction
  result = TeleportInstruction(maps(xx), yy, zz, ww)
 case end_instruction
  result = EndInstruction()
 end select

end function
