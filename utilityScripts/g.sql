set lines 200, wrap off

col &2 clear
-- col &2 for a48
-- col &2 for 999,999,999,999



select &2, COUNT(*) cnt, null dummy FROM &1 GROUP BY &2 ORDER BY 2;