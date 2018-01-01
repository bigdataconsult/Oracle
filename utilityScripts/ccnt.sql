select owner, count(*) 
from dba_tab_columns 
where table_name=UPPER('&1')
GROUP BY owner;