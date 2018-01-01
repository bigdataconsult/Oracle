select inst_ID, AVG(value)
FROM gv$sysmetric_history
where metric_name='Host CPU Utilization (%)'
AND BEGIN_TIME > SYSDATE-.0005
GROUP BY INST_ID
ORDER BY 1
/
