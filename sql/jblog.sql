--------------------------------------------------------
--  파일이 생성됨 - 월요일-8월-16-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_CATEGORY_NO
--------------------------------------------------------

   CREATE SEQUENCE  "JBLOG"."SEQ_CATEGORY_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 40 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_COMMENTS_NO
--------------------------------------------------------

   CREATE SEQUENCE  "JBLOG"."SEQ_COMMENTS_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 34 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_POST_NO
--------------------------------------------------------

   CREATE SEQUENCE  "JBLOG"."SEQ_POST_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_USERS_NO
--------------------------------------------------------

   CREATE SEQUENCE  "JBLOG"."SEQ_USERS_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 9 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BLOG
--------------------------------------------------------

  CREATE TABLE "JBLOG"."BLOG" 
   (	"ID" VARCHAR2(50 BYTE), 
	"BLOG_TITLE" VARCHAR2(200 BYTE), 
	"LOGO_FILE" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------

  CREATE TABLE "JBLOG"."CATEGORY" 
   (	"CATE_NO" NUMBER, 
	"ID" VARCHAR2(50 BYTE), 
	"CATE_NAME" VARCHAR2(200 BYTE), 
	"DESCRIPTION" VARCHAR2(500 BYTE), 
	"REG_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table COMMENTS
--------------------------------------------------------

  CREATE TABLE "JBLOG"."COMMENTS" 
   (	"CMT_NO" NUMBER, 
	"POST_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"CMT_CONTENT" VARCHAR2(1000 BYTE), 
	"REG_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table POST
--------------------------------------------------------

  CREATE TABLE "JBLOG"."POST" 
   (	"POST_NO" NUMBER, 
	"CATE_NO" NUMBER, 
	"POST_TITLE" VARCHAR2(300 BYTE), 
	"POST_CONTENT" VARCHAR2(4000 BYTE), 
	"REG_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "JBLOG"."USERS" 
   (	"USER_NO" NUMBER, 
	"ID" VARCHAR2(50 BYTE), 
	"USER_NAME" VARCHAR2(100 BYTE), 
	"PASSWORD" VARCHAR2(50 BYTE), 
	"JOIN_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into JBLOG.BLOG
SET DEFINE OFF;
Insert into JBLOG.BLOG (ID,BLOG_TITLE,LOGO_FILE) values ('asc','최영교의 블로그','162893584899452a8cade-2d99-4ddc-a441-731fe2eccd28.jpg');
Insert into JBLOG.BLOG (ID,BLOG_TITLE,LOGO_FILE) values ('aaa','이지은의 블로그입니다.','spring-logo.jpg');
Insert into JBLOG.BLOG (ID,BLOG_TITLE,LOGO_FILE) values ('www','강호동의 블로그입니다.','spring-logo.jpg');
Insert into JBLOG.BLOG (ID,BLOG_TITLE,LOGO_FILE) values ('qqq','이효리의 블로그입니다.','spring-logo.jpg');
Insert into JBLOG.BLOG (ID,BLOG_TITLE,LOGO_FILE) values ('abcd','박명수','1628643054540ab5bc6cb-a6da-46fb-8b4f-7ff0ef9b98b9.jpg');
Insert into JBLOG.BLOG (ID,BLOG_TITLE,LOGO_FILE) values ('zzz','유재석의 블로그입니다.','spring-logo.jpg');
Insert into JBLOG.BLOG (ID,BLOG_TITLE,LOGO_FILE) values ('aa','정우성','1628753644595d7f14f54-1292-45c0-836f-f53a916af2ff.jpg');
Insert into JBLOG.BLOG (ID,BLOG_TITLE,LOGO_FILE) values ('eee','이광수','16287584693398dfd0601-2950-4eec-a0d6-1ea6866040e8.jpg');
REM INSERTING into JBLOG.CATEGORY
SET DEFINE OFF;
Insert into JBLOG.CATEGORY (CATE_NO,ID,CATE_NAME,DESCRIPTION,REG_DATE) values (1,'asc','자바스크립트','js',to_date('21/08/10','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATE_NO,ID,CATE_NAME,DESCRIPTION,REG_DATE) values (20,'asc','HTML','html',to_date('21/08/11','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATE_NO,ID,CATE_NAME,DESCRIPTION,REG_DATE) values (18,'asc','오라클','oracle',to_date('21/08/11','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATE_NO,ID,CATE_NAME,DESCRIPTION,REG_DATE) values (19,'asc','스프링','spring',to_date('21/08/11','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATE_NO,ID,CATE_NAME,DESCRIPTION,REG_DATE) values (26,'asc','api','api',to_date('21/08/12','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATE_NO,ID,CATE_NAME,DESCRIPTION,REG_DATE) values (24,'zzz','스크립트','스크립트',to_date('21/08/12','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATE_NO,ID,CATE_NAME,DESCRIPTION,REG_DATE) values (25,'asc','안드로이드','안드로이드',to_date('21/08/12','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATE_NO,ID,CATE_NAME,DESCRIPTION,REG_DATE) values (37,'qqq','미분류','기본으로 만들어지는 카테고리입니다.',to_date('21/08/14','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATE_NO,ID,CATE_NAME,DESCRIPTION,REG_DATE) values (28,'asc','2222222','22222',to_date('21/08/12','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATE_NO,ID,CATE_NAME,DESCRIPTION,REG_DATE) values (29,'zzz','25','25',to_date('21/08/12','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATE_NO,ID,CATE_NAME,DESCRIPTION,REG_DATE) values (30,'aa','미분류','기본으로 만들어지는 카테고리입니다.',to_date('21/08/12','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATE_NO,ID,CATE_NAME,DESCRIPTION,REG_DATE) values (34,'eee','미분류','기본으로 만들어지는 카테고리입니다.',to_date('21/08/12','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATE_NO,ID,CATE_NAME,DESCRIPTION,REG_DATE) values (13,'abcd','미분류','기본으로 만들어지는 카테고리입니다.',to_date('21/08/11','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATE_NO,ID,CATE_NAME,DESCRIPTION,REG_DATE) values (14,'zzz','미분류','기본으로 만들어지는 카테고리입니다.',to_date('21/08/11','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATE_NO,ID,CATE_NAME,DESCRIPTION,REG_DATE) values (32,'aa','wwwww','wwwww',to_date('21/08/12','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATE_NO,ID,CATE_NAME,DESCRIPTION,REG_DATE) values (38,'www','미분류','기본으로 만들어지는 카테고리입니다.',to_date('21/08/14','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATE_NO,ID,CATE_NAME,DESCRIPTION,REG_DATE) values (36,'aaa','미분류','기본으로 만들어지는 카테고리입니다.',to_date('21/08/14','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATE_NO,ID,CATE_NAME,DESCRIPTION,REG_DATE) values (39,'asc','33333333333','33333',to_date('21/08/14','RR/MM/DD'));
REM INSERTING into JBLOG.COMMENTS
SET DEFINE OFF;
Insert into JBLOG.COMMENTS (CMT_NO,POST_NO,USER_NO,CMT_CONTENT,REG_DATE) values (30,20,2,'안녕하세요',to_date('21/08/16','RR/MM/DD'));
Insert into JBLOG.COMMENTS (CMT_NO,POST_NO,USER_NO,CMT_CONTENT,REG_DATE) values (33,20,2,'반갑습니다',to_date('21/08/16','RR/MM/DD'));
Insert into JBLOG.COMMENTS (CMT_NO,POST_NO,USER_NO,CMT_CONTENT,REG_DATE) values (23,3,2,'안녕하세요',to_date('21/08/16','RR/MM/DD'));
Insert into JBLOG.COMMENTS (CMT_NO,POST_NO,USER_NO,CMT_CONTENT,REG_DATE) values (25,12,1,'안녕하세요',to_date('21/08/16','RR/MM/DD'));
Insert into JBLOG.COMMENTS (CMT_NO,POST_NO,USER_NO,CMT_CONTENT,REG_DATE) values (26,6,1,'안녕하세요',to_date('21/08/16','RR/MM/DD'));
Insert into JBLOG.COMMENTS (CMT_NO,POST_NO,USER_NO,CMT_CONTENT,REG_DATE) values (27,2,1,'안녕하세요',to_date('21/08/16','RR/MM/DD'));
REM INSERTING into JBLOG.POST
SET DEFINE OFF;
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (1,18,'두번째 포스트 입니다','두번째 컨텐츠 입니다',to_date('21/08/11','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (2,20,'html','html',to_date('21/08/11','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (3,19,'스프링','스프링',to_date('21/08/11','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (4,1,'자바스크립트','자바스크립트',to_date('21/08/11','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (5,18,'오라클','오라클',to_date('21/08/11','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (6,20,'html2','html2',to_date('21/08/11','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (7,20,'html3','htm3',to_date('21/08/11','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (8,18,'오라클2','오라클2',to_date('21/08/11','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (9,14,'미분류 1','미분류 1',to_date('21/08/11','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (10,14,'미분류 2','미분류 2',to_date('21/08/11','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (11,26,'api','api',to_date('21/08/12','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (12,28,'222222222','222222',to_date('21/08/12','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (13,29,'25','25',to_date('21/08/12','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (14,29,'26','26',to_date('21/08/12','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (15,29,'27','27',to_date('21/08/12','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (16,29,'28','28',to_date('21/08/12','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (17,30,'qqqqq','qqq',to_date('21/08/12','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (18,32,'wwwww','wwwww',to_date('21/08/12','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (19,28,'두번째 포스트 입니다','222222222',to_date('21/08/14','RR/MM/DD'));
Insert into JBLOG.POST (POST_NO,CATE_NO,POST_TITLE,POST_CONTENT,REG_DATE) values (20,39,'3333333333','33333',to_date('21/08/14','RR/MM/DD'));
REM INSERTING into JBLOG.USERS
SET DEFINE OFF;
Insert into JBLOG.USERS (USER_NO,ID,USER_NAME,PASSWORD,JOIN_DATE) values (1,'asc','최영교','123',to_date('21/08/10','RR/MM/DD'));
Insert into JBLOG.USERS (USER_NO,ID,USER_NAME,PASSWORD,JOIN_DATE) values (2,'aaa','이지은','111',to_date('21/08/10','RR/MM/DD'));
Insert into JBLOG.USERS (USER_NO,ID,USER_NAME,PASSWORD,JOIN_DATE) values (3,'qqq','이효리','qqq',to_date('21/08/10','RR/MM/DD'));
Insert into JBLOG.USERS (USER_NO,ID,USER_NAME,PASSWORD,JOIN_DATE) values (4,'www','강호동','www',to_date('21/08/10','RR/MM/DD'));
Insert into JBLOG.USERS (USER_NO,ID,USER_NAME,PASSWORD,JOIN_DATE) values (5,'abcd','박명수','111',to_date('21/08/11','RR/MM/DD'));
Insert into JBLOG.USERS (USER_NO,ID,USER_NAME,PASSWORD,JOIN_DATE) values (6,'zzz','유재석','zzz',to_date('21/08/11','RR/MM/DD'));
Insert into JBLOG.USERS (USER_NO,ID,USER_NAME,PASSWORD,JOIN_DATE) values (7,'aa','정우성','aa',to_date('21/08/12','RR/MM/DD'));
Insert into JBLOG.USERS (USER_NO,ID,USER_NAME,PASSWORD,JOIN_DATE) values (8,'eee','이광수','eee',to_date('21/08/12','RR/MM/DD'));
--------------------------------------------------------
--  Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "JBLOG"."COMMENTS" ADD PRIMARY KEY ("CMT_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."COMMENTS" MODIFY ("REG_DATE" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."COMMENTS" MODIFY ("CMT_CONTENT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "JBLOG"."CATEGORY" ADD PRIMARY KEY ("CATE_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."CATEGORY" MODIFY ("REG_DATE" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."CATEGORY" MODIFY ("CATE_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table POST
--------------------------------------------------------

  ALTER TABLE "JBLOG"."POST" ADD PRIMARY KEY ("POST_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."POST" MODIFY ("REG_DATE" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."POST" MODIFY ("POST_TITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "JBLOG"."USERS" ADD UNIQUE ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."USERS" ADD PRIMARY KEY ("USER_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."USERS" MODIFY ("JOIN_DATE" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."USERS" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."USERS" MODIFY ("USER_NAME" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."USERS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BLOG
--------------------------------------------------------

  ALTER TABLE "JBLOG"."BLOG" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."BLOG" MODIFY ("BLOG_TITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BLOG
--------------------------------------------------------

  ALTER TABLE "JBLOG"."BLOG" ADD CONSTRAINT "BLOG_FK" FOREIGN KEY ("ID")
	  REFERENCES "JBLOG"."USERS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "JBLOG"."CATEGORY" ADD CONSTRAINT "CATE_FK" FOREIGN KEY ("ID")
	  REFERENCES "JBLOG"."BLOG" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "JBLOG"."COMMENTS" ADD CONSTRAINT "COMMENTS_FK" FOREIGN KEY ("POST_NO")
	  REFERENCES "JBLOG"."POST" ("POST_NO") ENABLE;
  ALTER TABLE "JBLOG"."COMMENTS" ADD FOREIGN KEY ("USER_NO")
	  REFERENCES "JBLOG"."USERS" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table POST
--------------------------------------------------------

  ALTER TABLE "JBLOG"."POST" ADD CONSTRAINT "POST_FK" FOREIGN KEY ("CATE_NO")
	  REFERENCES "JBLOG"."CATEGORY" ("CATE_NO") ENABLE;
