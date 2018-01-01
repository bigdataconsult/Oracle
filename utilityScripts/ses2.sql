select inst_id, osuser, username, machine, sid, serial#
from gv$session
order by 2,3,4
/
