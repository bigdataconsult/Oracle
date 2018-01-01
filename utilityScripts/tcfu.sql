select distinct owner_table from (
select owner, owner||'.'||table_name owner_table, column_name
from dba_tab_columns
where table_name like UPPER('%&1%')
and column_name like UPPER('%&2%')
and owner like DECODE('%&3%',NULL,'%FCRM%',UPPER('%&3%'))
and owner like '%FCRM%'
AND table_name not like 'BIN$%')
ORDER BY 1
/
