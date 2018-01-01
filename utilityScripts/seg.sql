SELECT segment_name, partition_name, round(bytes/(1024*1024))
 FROM user_segments
WHERE round(bytes/(1024*1024),2) > 100
ORDER by bytes

/
