select t.table_name, COLUMN_NAME
from user_tab_columns tc, user_tables t
where entity_sk IN (SELECT COLUMN_NAME || '_SK' FROM USER_TAB_COLUMNS WHERE T.TABLE_NAME='TRANSACTIONS')
AND T.TABLE_NAME != 'TRANSACTIONS'
AND t.table_name=tc.table_name
AND num_rows > 1
ORDER BY 1
/
