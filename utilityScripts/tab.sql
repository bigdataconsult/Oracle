set pages 2000

col table_name for a30
col num_rows for 999,999,999,999

select table_name, num_rows, partitioned from user_tables 
where table_name like upper('%&&1%')
order by 2;
