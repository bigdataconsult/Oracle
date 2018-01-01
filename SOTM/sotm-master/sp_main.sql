create or replace PROCEDURE MAIN_SOTM AS 
    v_start_dt CHAR(8) := '20140101';
    v_last_dt DATE := to_date('20151110','yyyymmdd');
    v_vol_cut NUMBER := 50000;
    v_prc_cut NUMBER :=10;
    v_num_of_pos NUMBER :=2;
    v_num_of_opn_pos NUMBER:=0;    
    v_risk_parity_amt NUMBER := .05;
BEGIN
    INSERT INTO trades (opn_dt, s, cls_dt, stat, equity, id)
    VALUES (to_date(v_start_dt,'yyyymmdd')-1, 'XXX', to_date(v_start_dt,'yyyymmdd')-1, 'C', 100000, q_trade.nextval);

    FOR c_trd_day IN
    (
        SELECT DISTINCT d, spx_sma200_yn
        FROM rs3
        WHERE to_char(d,'yyyymmdd')>=v_start_dt
        ORDER BY d
    )
    LOOP
        IF TO_CHAR(c_trd_day.d,'DY')='TUE'
        THEN
            eval_curr_pos(c_trd_day.d, v_last_dt);
            
            IF c_trd_day.spx_sma200_yn='Y' AND c_trd_day.d < v_last_dt
            THEN
              eval_new_pos(c_trd_day.d);
            END IF;
        END IF;
        
        upd_eqt_tbl(c_trd_day.d);
        COMMIT;
    END LOOP;
END;