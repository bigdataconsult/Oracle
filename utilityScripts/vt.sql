set long 20000
set longc 2000
set lines 2000
set pages 2000

select text from dba_views where UPPER(view_name) = UPPER('&1');

set lines 200
set pages 200
