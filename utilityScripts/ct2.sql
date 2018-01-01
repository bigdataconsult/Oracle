set feed on
set pages 200
col owner for a32
col owner_table for a48
col column_name for a32

break on owner skip 1

SELECT distinct c.owner, owner_table, num_rows FROM (
	SELECT c.owner, c.table_name, c.owner||'.'||table_name owner_table, column_name
	FROM dba_tab_columns c, dba_objects o
	WHERE column_name like UPPER('%&1%')
	AND c.owner like DECODE('&&2',NULL,'%FCRM%',UPPER('%&&2%'))
	AND table_name not like 'BIN$%'
	AND table_name=object_name
	AND object_type='TABLE') c, dba_tables t
WHERE t.table_name=c.table_name
AND num_rows > 0
ORDER BY 3
/

define 1=''
define 2=''