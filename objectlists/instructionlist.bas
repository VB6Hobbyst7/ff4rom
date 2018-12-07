type InstructionList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Instruction ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor InstructionList(initial_size as Integer = 0)
 dim p as Instruction ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Instruction
   AddPointer(p)
  next
 end if
end constructor

operator InstructionList.[](index as Long) as Instruction ptr
 return cptr(Instruction ptr, PointerAt(index + 1))
end operator

function InstructionList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function
