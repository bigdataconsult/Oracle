set echo off
col dstnct for 999,999,999,999,999
col not_nullv for 999,999,999,999,999

select count(1) cnt
, count(distinct &2) dstnct
, SUM(decode(&2,NULL,0,1)) not_nullv
, min(&2) minv
, max(&2) maxv
-- , avg(&2) avgv 
from &1
/
