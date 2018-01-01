SELECT i.index_name, column_name
  FROM user_indexes i, user_ind_columns c
 WHERE i.index_name=c.index_name
   AND i.table_name = '&1'
/
