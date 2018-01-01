CREATE OR REPLACE FUNCTION "TEST2"."GET_ROWS_BACK_DT" (p_dt date, p_rows_back NUMBER, p_s VARCHAR2)
RETURN DATE
AS
	r_dt DATE;
	i NUMBER :=0;
BEGIN
	SELECT MIN(d)
	INTO r_dt
	FROM (SELECT d
			FROM rs3
			WHERE s=p_s
			AND d <= p_dt
			ORDER BY d DESC)
	WHERE rownum <=p_rows_back;
	RETURN r_dt;
END;

/
