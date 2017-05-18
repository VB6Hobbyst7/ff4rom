#include once "../common/boolean.bas"
#include once "../common/new/list.bas"
#include once "gameobjects/elementgrid.bas"
#include once "gameobjects/actor.bas"
#include once "gameobjects/menucommand.bas"

const item_command = 2 'Belongs with menucommands; needed for giveactorcommand

type FF4Rom

 public:
 elementgrids(total_element_grids) as ElementGrid
 menu_commands(total_menu_commands) as MenuCommand

 actors(total_actors) as Actor
 names(total_names) as String
 jobchange_actor as Integer
 jobchange_job as UByte
 blackreplace_actor as Integer
 blackreplace_text as String
 
 private:
 romdata as String
 unheadered as Boolean

 public:
 declare function ConvertText(text as String) as String
 declare function DisplayText(text as String) as String
 declare function FlagIndex(flagname as String) as Integer
 declare function NextUnusedElementGrid() as Integer

 declare function FindMakeElementGrid(combination as List) as Integer
 declare sub GiveActorCommand(actorindex as UByte, commandindex as UByte)

 declare sub ReadFromFile(filename as String)
 declare sub WriteToFile(filename as String)

 private:
 declare function ByteAt(address as Integer) as UByte
 declare sub WriteByte(address as Integer, newbyte as UByte)
 declare sub ReadElementGrids()
 declare sub WriteElementGrids()
 declare sub ReadActors()
 declare sub WriteActors()

end type

#include once "info/converttext.bas"
#include once "info/displaytext.bas"
#include once "info/flagindex.bas"
#include once "info/nextunusedelementgrid.bas"

#include once "edit/findmakeelementgrid.bas"
#include once "edit/giveactorcommand.bas"

#include once "rominterface/readfromfile.bas"
#include once "rominterface/writetofile.bas"
#include once "rominterface/byteat.bas"
#include once "rominterface/writebyte.bas"

#include once "readwrite/elementgrids.bas"
#include once "readwrite/actors.bas"
