function FF4Rom.UniqueActor(actor_index as UByte) as Boolean

 dim actors_of_job as List
 
 actors_of_job = ActorsOfJob(JobOfActor(actor_index))
 
 return (actors_of_job.Length() = 1)

end function
