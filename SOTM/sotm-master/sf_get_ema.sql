CREATE OR REPLACE FUNCTION "TEST2"."GET_EMA" (p_s VARCHAR2, p_ema_end_dt DATE, p_ma_period NUMBER)
RETURN NUMBER
AS
	r_ema NUMBER;
	v_ema_strt_dt DATE;
	v_sma_strt_dt DATE;
BEGIN
	SELECT get_rows_back_dt (p_ema_end_dt, p_ma_period, p_s) INTO v_ema_strt_dt FROM DUAL;
	SELECT get_rows_back_dt (v_ema_strt_dt, p_ma_period, p_s) INTO v_sma_strt_dt FROM DUAL;

	SELECT ema INTO r_ema
	FROM
	(	SELECT d, c, last_date, s, sma, ema
			FROM rs3
			WHERE UPPER(TRIM(s))=UPPER(p_s) AND d BETWEEN v_sma_strt_dt AND p_ema_end_dt
			model
			   partition by (s, 2 / (1+p_ma_period) smoothing_constant)
			   dimension by (d)
			   measures (c, 0 sma,0 ema, v_ema_strt_dt last_date)
			   (
				 sma[any]=AVG(c) OVER (PARTITION BY s ORDER BY d ROWS BETWEEN (p_ma_period-1) PRECEDING AND CURRENT ROW)
				, last_date[any]=lag(d,1) over (partition by s order by d)
				, ema[v_ema_strt_dt] = sma[cv()]
				, ema[d>v_ema_strt_dt] order by d = ( cv(smoothing_constant) * (c[cv()] - ema[last_date[cv()]])) + ema[last_date[cv()]]
				)
		 order by d DESC
	)
	WHERE ROWNUM=1;

	RETURN r_ema;
END;

/
