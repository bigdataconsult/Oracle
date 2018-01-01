select null dummy, owner, status, count(*) cnt from dba_objects where owner like '%FCRM%' and status !='VALID' group by owner, status order by owner;
