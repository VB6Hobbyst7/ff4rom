'An event call is what is launced when you step on an event tile or talk to an
' NPC. It figures out which event script to launch based on the status of
' various flags.

' Some event calls have a list of parameters after it which can be referred to
'  in certain events, such as "Bank 2 message after event call".

' NPCs each have their own associated event call, whereas trigger tiles
'  reference an index of an event call from a main list.

type CallComponent

 true_conditions as List
 false_conditions as List
 event_index as UByte

end type


type EventCall

 components as List
 parameters as List

end type

const total_event_calls = &hFE
