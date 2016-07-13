create table zipcode  (
   seq                  NUMBER(10)                        not null,
   zipcode              VARCHAR2(50),
   sido                 VARCHAR2(50),
   gugun                VARCHAR2(50),
   dong                 VARCHAR2(50),
   bunji                VARCHAR2(50),
   constraint PK_ZIPCODE primary key (seq)
)

create sequence seq_seq nocache

select * from zipcode where seq=20000

insert into code values ('email', 'gmail.com');
insert into code values ('email', 'hanmail.net');
insert into code values ('email', 'naver.com');
insert into code values ('email', 'nate.com');
insert into code values ('email', 'korea.com');
insert into code values ('email', 'yahoo.com');
insert into code values ('email', 'hotmail.com');
insert into code values ('email', 'chol.com');
insert into code values ('email', 'netian.com');
insert into code values ('email', 'dreamwiz.com');
insert into code values ('email', 'live.com');
insert into code values ('email', 'outlook.com');
insert into code values ('email', 'msn.com');
insert into code values ('email', 'outlook.co.kr');
insert into code values ('email', 'admin.com');

select * from zipcode where dong like '청담%'