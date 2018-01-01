set pages 200
set lines 200
col owner for a32
col owner_table for a48
col column_name for a32
col data_type for a32

break on owner skip 1

select c.owner, c.owner||'.'||table_name owner_table, column_name, data_type
from dba_tab_columns c, dba_objects o
WHERE c.table_name = UPPER('&&1')
AND data_type like UPPER('%&2%')
and c.owner like DECODE('&&3',NULL,'%FCRM%',UPPER('%&&3%'))
AND table_name not like 'BIN$%'
AND table_name=object_name
AND object_type='TABLE'
ORDER BY 1, 2
/

define 2=''
set lines 200