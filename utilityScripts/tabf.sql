set lines 200
col owner_table for a50
break on owner skip 1

SELECT owner, owner||'.'||table_name owner_table, num_rows
FROM dba_tables
WHERE table_name like UPPER('%&1%') AND
	num_rows > 0 AND
	table_name not like 'BIN$%' AND
	owner like DECODE('&&2',NULL,'%FCRM%',UPPER('%&&2%'))
ORDER BY 1, 2
/

define 2=''