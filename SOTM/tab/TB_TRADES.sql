CREATE TABLE TRADES
   (	"OPN_DT" DATE, 
	"S" VARCHAR2(8 BYTE), 
	"SHRS" NUMBER, 
	"OPN_PRC" NUMBER, 
	"COST" NUMBER, 
	"POS" VARCHAR2(4 BYTE), 
	"ISTP" NUMBER, 
	"CLS_DT" DATE, 
	"CLS_PRC" NUMBER, 
	"PL" NUMBER, 
	"STAT" VARCHAR2(1 BYTE), 
	"COMM" VARCHAR2(32 BYTE), 
	"ATR" NUMBER, 
	"ATR_PCT" NUMBER, 
	"EQUITY" NUMBER, 
	"ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IE_TRA_S_STAT
--------------------------------------------------------

  CREATE INDEX "TEST2"."IE_TRA_S_STAT" ON "TEST2"."TRADES" ("S", "STAT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
