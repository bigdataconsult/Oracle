select owner, object_type, object_name, created from dba_objects where owner LIKE '%FCRM%' AND status !='VALID' ORDER BY 1

/
