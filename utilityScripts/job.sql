set lines 200
col job_name for a32
col "Last Start" FOR A16
col "Next Run" FOR A16

SET TERMOUT OFF
COL p1 NEW_VALUE 1
SELECT NULL p1 FROM DUAL WHERE 1=2;
SELECT NVL('&1','user') p1 FROM dual;
SET TERMOUT ON

select job_name, state, job_action, to_char(last_start_date,'DD-MON-YY HH:MI') "Last Start", to_char(next_run_date,'DD-MON-YY HH:MI') "Next Run"
from &1._scheduler_jobs 
order by state;

undef 1
