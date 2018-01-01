select owner, table_name, column_name
from dba_tab_columns
where table_name like UPPER('%&1%')
and column_name like ('%&2%')
and owner like DECODE('%&3%',NULL,'%FCRM%',UPPER('%&3%'))
AND table_name not like 'BIN$%'
ORDER BY 1, 2