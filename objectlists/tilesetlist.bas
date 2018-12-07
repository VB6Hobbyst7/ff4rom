type TileSetList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as TileSet ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor TileSetList(initial_size as Integer = 0)
 dim p as TileSet ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new TileSet
   AddPointer(p)
  next
 end if
end constructor

operator TileSetList.[](index as Long) as TileSet ptr
 return cptr(TileSet ptr, PointerAt(index + 1))
end operator

function TileSetList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function
