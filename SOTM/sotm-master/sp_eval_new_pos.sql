set define off;

CREATE OR REPLACE PROCEDURE "TEST2"."EVAL_NEW_POS" (p_d date, p_risk_parity_amt NUMBER)
AS 
BEGIN
  FOR c_opn_pos IN (
      SELECT s, d, c, nxt_d, nxt_o
      FROM (
          SELECT s, d, c, nxt_d, nxt_o, adj_slope, pct_rnk
          FROM rs3
          WHERE d=p_d
          AND s NOT IN (SELECT s FROM TRADES WHERE stat='O')
          AND adj_slope > .3
          AND c>sma100
          AND pct_rnk > .95
          ORDER BY adj_slope DESC
      )
  )
  LOOP
      opn_pos(c_opn_pos.s, c_opn_pos.d, c_opn_pos.c, c_opn_pos.nxt_d, c_opn_pos.nxt_o, p_risk_parity_amt);
  END LOOP;
END;
/
