set define off;

CREATE OR REPLACE PROCEDURE "TEST2"."OPN_POS" (p_s VARCHAR2, p_d DATE, p_c NUMBER, p_nxt_d DATE, p_nxt_o NUMBER, p_risk_parity_amt NUMBER)
AS
	v_atr NUMBER;
	v_atr_pct NUMBER;
	v_trd_unit NUMBER;
	v_cost NUMBER;
	v_eqt_free NUMBER;
	r_success BOOLEAN := TRUE;
BEGIN
	v_atr:=get_atr(p_s, p_d, 20);
	v_atr_pct := ROUND((v_atr/p_c)*100,3);

	SELECT eqt_free, ROUND((equity*p_risk_parity_amt)/v_atr,3) INTO v_eqt_free, v_trd_unit FROM trd_acct;
	v_cost := v_trd_unit*p_nxt_o;
    
	IF v_cost < v_eqt_free
	THEN
		INSERT INTO trades (opn_dt, s, pos, shrs, opn_prc, stat, atr, atr_pct, cost)
		VALUES (p_nxt_d, p_s, 'L', v_trd_unit, p_nxt_o, 'O', v_atr, v_atr_pct, v_trd_unit*p_nxt_o);

		UPDATE trd_acct SET eqt_free=eqt_free-v_cost;
		dbms_output.put_line(p_d||' Bought '||v_trd_unit||' shares of '||p_s);
	END IF;
END;
/
