break on owner skip 1

col owner for a32
col view_name for a49

select owner, owner ||'.'||view_name view_name from dba_views
WHERE view_name like UPPER('%&1%') 
and owner like DECODE('&&2',NULL,'%FCRM%',UPPER('%&&2%')) 
ORDER BY 1, 2;

define 2=''