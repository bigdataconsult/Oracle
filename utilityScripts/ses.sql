select inst_id, osuser, sid, username, machine, sql_id
from gv$session
where osuser!='oracle'
-- group by inst_id, osuser, username, machine
order by 2,3,4
/
