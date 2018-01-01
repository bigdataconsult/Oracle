select * from (
select start_time, sql_id, ELAPSED_SECONDS/60 done, TIME_REMAINING/60 left, target, sofar, totalwork, sofar/totalwork*100 per
from gv$session_longops
order by left desc)
where rownum <=100
and sofar != totalwork
and totalwork != 0
/
