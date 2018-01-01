break on owner skip 1

select owner, view_name from dba_views
WHERE view_name like UPPER('%&1%') 
and owner like DECODE('&&2',NULL,'%FCRM%',UPPER('%&&2%')) 
ORDER BY 1, 2;