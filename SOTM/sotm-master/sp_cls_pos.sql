set define off;

CREATE OR REPLACE PROCEDURE "TEST2"."CLS_POS" (p_s VARCHAR, p_c NUMBER, p_d DATE, p_nxt_d IN OUT DATE, p_nxt_o IN OUT NUMBER, p_rnk NUMBER, p_last_dt DATE, p_rnk_cutoff NUMBER)
AS
	v_cls_pos_yn VARCHAR2(10) :='N';
	v_comm trades.comm%type;
	-- v_rnk_cutoff NUMBER := .5;
	v_equity NUMBER;
	v_new_equity NUMBER;
	v_shrs NUMBER;
BEGIN
	IF p_rnk <= p_rnk_cutoff
	THEN
		v_cls_pos_yn:='Y';
		v_comm:='Fell below rank cutoff';
	ELSIF p_d = p_last_dt
	THEN
		v_cls_pos_yn:='Y';
		v_comm:='Last Day';
		p_nxt_o:=p_c;
		p_nxt_d:=p_d;
	END IF;

	SELECT equity INTO v_equity FROM trd_acct;

	IF 	v_cls_pos_yn='Y'
	THEN
		UPDATE trades
		SET cls_dt=p_nxt_d, cls_prc=p_nxt_o, stat='C', pl=(p_nxt_o-opn_prc)*shrs, comm=v_comm, equity=(v_equity+((p_nxt_o-opn_prc)*shrs)), id=q_trade.nextval
		WHERE s=p_s AND stat='O' RETURNING equity, shrs INTO v_new_equity, v_shrs;

		UPDATE trd_acct SET eqt_free = eqt_free+p_nxt_o*v_shrs;
		UPDATE trd_acct SET equity=v_new_equity;
		DBMS_OUTPUT.PUT_LINE(p_d||' Sold '||p_s);
	END IF;
	COMMIT;
END;
/