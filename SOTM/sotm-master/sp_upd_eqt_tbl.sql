--------------------------------------------------------
--  File created - Monday-November-30-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure SP_UPD_EQT_TBL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TEST2"."SP_UPD_EQT_TBL" (p_d DATE)
AS
	v_eqt_used NUMBER;
	v_eqt_free NUMBER;
BEGIN
	SELECT NVL(sum(t.shrs*s.c),0) INTO v_eqt_used
	FROM trades t, rs2 s
	WHERE t.s=s.s
	AND t.stat='O'
	AND s.d=trunc(p_d);

	SELECT eqt_free INTO v_eqt_free FROM trd_acct;

	INSERT INTO dly_eqt_chgs (d, eqt_used, eqt_free, eqt_tot)
	VALUES(p_d, v_eqt_used, v_eqt_free, (v_eqt_used+v_eqt_free));
END;

/
