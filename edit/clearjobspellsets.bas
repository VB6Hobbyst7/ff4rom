'This removes all spell sets from the specified job. If no job index was
' provided, it clears all spell sets from all jobs.

sub FF4Rom.ClearJobSpellSets(job_index as UByte = &hFF)

 if job_index = &hFF then
  for i as Integer = 0 to total_jobs
   ClearJobSpellSets(i)
  next
 else
  jobs(job_index).white = &hFF
  jobs(job_index).black = &hFF
  jobs(job_index).summon = &hFF
  jobs(job_index).menu_white = &hFF
  jobs(job_index).menu_black = &hFF
  jobs(job_index).menu_summon = &hFF
 end if

end sub
