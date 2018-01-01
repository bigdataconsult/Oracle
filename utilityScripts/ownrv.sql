select owner, count(*) from dba_views where owner like 'FCRM%' group by owner order by 1
/
