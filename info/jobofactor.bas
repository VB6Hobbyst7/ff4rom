'This returns the job corresponding to the given actor. It may not be 100%
' accurate, especially if anything has been changed, as the way it determines
' this is to follow the actor's levelup link to a character, then find that
' character's job (with the exception of the "job change actor").

function FF4Rom.JobOfActor(actor_index as UByte) as UByte

 dim result as UByte
 
 if actor_index = jobchange_actor then
  result = jobchange_job
 else
  result = characters(actors(actor_index).level_link).job_index
 end if
 
 return result

end function
