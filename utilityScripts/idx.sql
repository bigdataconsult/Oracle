COL index_name FOR a32

select index_name, status, partitioned, uniqueness, degree, tablespace_name, visibility, leaf_blocks 
FROM user_indexes where
table_name = UPPER('&1')
order by 1;