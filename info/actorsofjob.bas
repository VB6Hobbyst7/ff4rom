'This returns a list of the actors which correspond to the given job.

function FF4Rom.ActorsOfJob(job_index as UByte) as List

 dim result as List
 
 for i as Integer = 0 to total_actors
  if JobOfActor(i) = job_index then result.AddItem(chr(i))
 next
 
 return result

end function
