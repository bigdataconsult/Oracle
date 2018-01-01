COL USED_UREC FORMAT 999,999,999
COL USED_UBLK FORMAT 999,999,999

SELECT a.sid, a.username, b.xidusn, b.used_urec, b.used_ublk
  FROM gv$session a, gv$transaction b
  WHERE a.saddr = b.ses_addr
/
