SET PAGES 500
SET LINES 10000
SET LONGC 10000

select text from user_source where name=&1;

SET PAGES 200
SET LINES 200
SET LONGC 200
