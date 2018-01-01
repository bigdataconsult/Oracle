set pages 200
col owner for a32
col owner_table for a48
col column_name for a32

break on owner skip 1

select distinct owner, owner_table, num_rows FROM (
select c.owner, c.owner||'.'||t.table_name owner_table, c.column_name, t.num_rows
from dba_tab_columns c, dba_objects o, dba_tables t
WHERE c.column_name like UPPER('%&1%')
AND c.owner like DECODE('&&2',NULL,'%FCRM%',UPPER('%&&2%'))
AND c.table_name not like 'BIN$%'
AND c.table_name=object_name
AND o.object_type='TABLE'
AND o.object_name=t.table_name
AND o.owner=t.owner)
ORDER BY 3;

define 2=''