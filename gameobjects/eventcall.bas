type CallComponent
 true_conditions as List
 false_conditions as List
 event_link as Event ptr
end type

type EventCall
 components as List
 parameters as List
end type

const total_event_calls = &hFE
