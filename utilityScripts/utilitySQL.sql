--############################################
-- display current schema
-- HotKey cs
--############################################
select sys_context( 'userenv', 'current_schema' ) from dual
/

--############################################
-- Set session to fcrm_sam_app
-- HotKey cs
--############################################
alter session set current_schema=fcrm_sam_app;

--############################################
-- Set session to fcrm_sam_app
--############################################
select owner, count(*) 
from dba_tab_columns 
where table_name=UPPER('&1')
GROUP BY owner;