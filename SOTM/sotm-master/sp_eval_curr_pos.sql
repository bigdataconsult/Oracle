set define off;

CREATE OR REPLACE PROCEDURE "TEST2"."EVAL_CURR_POS" (p_d DATE, p_last_dt DATE, p_rnk_cutoff NUMBER)
AS 
BEGIN
    FOR c_cls_pos IN (
        SELECT t.s, t.shrs, t.pos, r.c, r.nxt_d, r.nxt_o, r.pct_rnk
        FROM trades t, rs3 r
        WHERE t.s=r.s
        AND r.d=p_d
        AND t.stat='O'
        ORDER BY t.s  )
    LOOP 
        CLS_POS(c_cls_pos.s, c_cls_pos.c, p_d, c_cls_pos.nxt_d, c_cls_pos.nxt_o, c_cls_pos.pct_rnk, p_last_dt, p_rnk_cutoff);
    END LOOP;
END EVAL_CURR_POS;
/
