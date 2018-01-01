set pages 200
col owner for a32
col owner_table for a48
col column_name for a32

break on owner skip 1

select DISTINCT o.owner, o.owner||'.'||a.table_name owner_table, t.num_rows
from dba_tab_columns a, dba_tab_columns b, dba_objects o, dba_tables t
WHERE a.table_name=b.table_name
AND a.column_name like upper('%&&1%')
AND b.column_name like UPPER('%&&2%')
AND o.owner like DECODE('&&3',NULL,'%FCRM%',UPPER('%&&3%'))
AND a.table_name not like 'BIN$%'
AND a.table_name=object_name
AND a.table_name=t.table_name
AND o.owner=t.owner
AND o.object_name=t.table_name
AND o.object_type='TABLE'
ORDER BY 3
/


define 2=''
define 3=''