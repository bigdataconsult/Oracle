select username,
default_tablespace,
temporary_tablespace,
last_login
FROM dba_users
where username like DECODE('&&1',NULL,'%%',UPPER('%&&1%'))
ORDER BY 1
/
