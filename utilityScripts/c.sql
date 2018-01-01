set pages 200
col owner for a32
col owner_table for a48
col column_name for a32

break on owner skip 1

select owner, owner||'.'||table_name owner_table, column_name 
from dba_tab_columns
where column_name like UPPER('%&1%')
and owner like DECODE('&&2',NULL,'%FCRM%',UPPER('%&&2%')) 
AND table_name not like 'BIN$%'
ORDER BY 1, 2
/

define 2=''