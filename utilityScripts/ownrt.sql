select owner, count(*) from dba_tables where owner like 'FCRM%' group by owner order by 1
/
