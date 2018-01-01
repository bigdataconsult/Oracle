set pages 200
col owner for a32
col owner_table for a48
col column_name for a32

break on owner skip 1

select c.owner, c.owner||'.'||table_name owner_table, column_name, data_type, data_length
from dba_tab_columns c, dba_objects o
where column_name like UPPER('%&1%')
and c.owner like DECODE('&&2',NULL,'%FCRM%',UPPER('%&&2%'))
AND table_name not like 'BIN$%'
AND table_name=object_name
AND object_type='TABLE'
ORDER BY 1, 2
/

define 2=''