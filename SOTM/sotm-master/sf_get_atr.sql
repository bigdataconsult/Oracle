CREATE OR REPLACE FUNCTION "TEST2"."GET_ATR" (p_s VARCHAR2, p_dt DATE, p_ma_period NUMBER)
RETURN NUMBER
AS
	r_atr NUMBER;
	v_ema_strt_dt DATE;
	v_sma_strt_dt DATE;

BEGIN
	v_ema_strt_dt := get_rows_back_dt (p_dt, p_ma_period, p_s);
	v_sma_strt_dt := get_rows_back_dt (v_ema_strt_dt, p_ma_period, p_s);

	SELECT ema INTO r_atr
	FROM
	(
		SELECT d, tr, last_date, s, sma, ema
			FROM rs3
			WHERE UPPER(TRIM(s))=UPPER(p_s) AND d BETWEEN v_sma_strt_dt AND p_dt
			MODEL
			   PARTITION BY (s, 2 / (1+p_ma_period) smoothing_constant)
			   DIMENSION BY (d)
			   MEASURES (tr, 0 sma,0 ema, v_ema_strt_dt last_date)
			   (
				 sma[any]=AVG(tr) OVER (PARTITION BY s ORDER BY d ROWS BETWEEN (p_ma_period-1) PRECEDING AND CURRENT ROW)
				, last_date[any]=lag(d,1) over (partition by s order by d)
				, ema[v_ema_strt_dt] = sma[cv()]
				, ema[d>v_ema_strt_dt] order by d = ( cv(smoothing_constant) * (tr[cv()] - ema[last_date[cv()]])) + ema[last_date[cv()]]
				)
		 order by d DESC
	)
	WHERE ROWNUM=1;

	RETURN ROUND(r_atr,3);
END;

/
