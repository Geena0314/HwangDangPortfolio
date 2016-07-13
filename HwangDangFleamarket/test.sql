select * FROM admin_QnA 
ORDER BY admin_qna_no DESC;
select * FROM PRODUCT_OPTION
DELETE FROM PRODUCT_OPTION




DROP TABLE product_option 
	CASCADE CONSTRAINTS;
	
select * FROM product;	
select * FROM product_option;	
select * FROM seller;	
select * FROM orders 

SELECT *
  FROM user_constraints
 WHERE table_name = 'orders'

SELECT count(*) FROM order_product 
WHERE order_product_status IN (1,2,3,4)
SELECT count(*) FROM order_product 
WHERE order_product_status IN ('1','2','3','4')
  
 
/* 상품옵션vvvvvvvv */
drop table product_option
CREATE TABLE product_option (
	option_id NUMBER primary key, /* 상품옵션ID */
	option_name VARCHAR2(30) NOT NULL, /* 옵션명 */
	option_sub_name VARCHAR2(60) NOT NULL unique , /* 세부 옵션명 */
	option_stock NUMBER(4) NOT NULL, /* 재고량 */
	option_add_price NUMBER(7) not null, /* 추가가격 */
	product_id VARCHAR2(30) NOT NULL, /* 상품ID */
	foreign key(product_id) references product(product_id) on delete cascade
);
drop sequence option_id_seq
create sequence option_id_seq nocache;



select * FROM member;

INSERT INTO ADMIN_QNA  VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목1'  ,'임시글내용ABC1' ,'scott12','2015-02-12' ,0 , 't');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목2'  ,'임시글내용ABC12' ,'scott12','2015-02-11',0 , 't');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목3'  ,'임시글내용ABC123' ,'scott123','2015-02-04',0 , 'f');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목4'  ,'임시글내용ABC1234' ,'scott124','2015-02-02',0 , 't');
INSERT INTO ADMIN_QNA  VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목1'  ,'임시글내용ABC1' ,'scott12','2015-02-12',0 , 't');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목2'  ,'임시글내용ABC12' ,'scott12','2015-02-11',0 , 't');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목3'  ,'임시글내용ABC123' ,'scott123','2015-02-04',0 , 'f');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목4'  ,'임시글내용ABC1234' ,'scott124','2015-02-02',0 , 't');
INSERT INTO ADMIN_QNA  VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목1'  ,'임시글내용ABC1' ,'scott12','2015-02-12',0 , 't');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목2'  ,'임시글내용ABC12' ,'scott12','2015-02-11',0 , 't');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목3'  ,'임시글내용ABC123' ,'scott123','2015-02-04',0 , 'f');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목4'  ,'임시글내용ABC1234' ,'scott124','2015-02-02',0 , 't');
INSERT INTO ADMIN_QNA  VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목1'  ,'임시글내용ABC1' ,'scott12','2015-02-12',0 , 't');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목2'  ,'임시글내용ABC12' ,'scott12','2015-02-11',0 , 't');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목3'  ,'임시글내용ABC123' ,'scott123','2015-02-04',0 , 'f');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목4'  ,'임시글내용ABC1234' ,'scott124','2015-02-02',0 , 't');
INSERT INTO ADMIN_QNA  VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목1'  ,'임시글내용ABC1' ,'scott12','2015-02-12',0 , 't');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목2'  ,'임시글내용ABC12' ,'scott12','2015-02-11',0 , 't');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목3'  ,'임시글내용ABC123' ,'scott123','2015-02-04',0 , 'f');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목4'  ,'임시글내용ABC1234' ,'scott124','2015-02-02',0 , 't');
INSERT INTO ADMIN_QNA  VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목1'  ,'임시글내용ABC1' ,'scott12','2015-02-12',0 , 't');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목2'  ,'임시글내용ABC12' ,'scott12','2015-02-11',0 , 't');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목3'  ,'임시글내용ABC123' ,'scott123','2015-02-04',0 , 'f');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목4'  ,'임시글내용ABC1234' ,'scott124','2015-02-02',0 , 't');
INSERT INTO ADMIN_QNA  VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목1'  ,'임시글내용ABC1' ,'scott12','2015-02-12',0 , 't');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목2'  ,'임시글내용ABC12' ,'scott12','2015-02-11',0 , 't');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목3'  ,'임시글내용ABC123' ,'scott123','2015-02-04',0 , 'f');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목4'  ,'임시글내용ABC1234' ,'scott124','2015-02-02',0 , 't');
INSERT INTO ADMIN_QNA  VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목1'  ,'임시글내용ABC1' ,'scott12','2015-02-12',0 , 't');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목2'  ,'임시글내용ABC12' ,'scott12','2015-02-11',0 , 't');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목3'  ,'임시글내용ABC123' ,'scott123','2015-02-04',0 , 'f');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목4'  ,'임시글내용ABC1234' ,'scott124','2015-02-02',0 , 't');

/*테이블 스키마 수정 */
ALTER TABLE admin_QnA ADD admin_qna_reply number;
ALTER TABLE admin_QnA drop column  admin_qna_reply;


CREATE TABLE admin_QnA_reply (
	admin_reply_no NUMBER primary key, /* 댓글번호 */
	admin_reply_content varchar2(4000) NOT NULL, /* 내용 */
	admin_reply_date DATE NOT NULL, /* 작성일 */
	admin_reply_writer VARCHAR2(30) NOT NULL, /* 작성자 */
	admin_qna_no NUMBER not null, /* 관리자QnA no */
	
	foreign key(admin_qna_no) references admin_qna(admin_qna_no) on delete cascade

select * FROM  admin_QnA_reply
	
INSERT INTO admin_QnA_reply
VALUES(
	 admin_reply_no_seq.nextval , 
	'abc', 
	'2010-10-10',
	'관리자' , 
	  44
);

-- 조인 테스트 
SELECT  	q.admin_qna_no ,
			q.admin_qna_title ,
			q.admin_qna_content ,
			q.admin_qna_writer ,
			q.admin_qna_date ,
			q.admin_qna_hit ,
			q.admin_qna_published, 
			r.admin_reply_content ,
			r.admin_reply_date
			
		FROM  ADMIN_QNA q  ,  admin_QnA_reply r
		WHERE q.admin_qna_no = 23 
		AND  q.admin_qna_no =  r.admin_qna_no(+) 

		
		DELETE FROM admin_qna_reply 
		WHERE admin_reply_no =  59
		
		
		DELETE FROM admin_qna_reply 
		WHERE admin_qna_no = 55;
		

		select * FROM  admin_QnA_reply 
		WHERE  admin_qna_no = 20;
		
		
select * FROM department
select * FROM employee

select * FROM member 


-- 집에 db추가 
/* 소식통(판매자) */
CREATE TABLE seller_notice (
	seller_notice_no NUMBER NOT NULL, /* 소식글 no */
	seller_notice_title VARCHAR2(300) NOT NULL, /* 소식글 제목 */
	seller_notice_content CLOB NOT NULL, /* 소식글 내용 */
	seller_notice_date DATE NOT NULL, /* 소식글 작성일 */
	seller_notice_hit NUMBER NOT NULL, /* 소식글 조회수 */
	seller_store_no number not null,/* 판매자 스토어 번호 */
	foreign key (seller_store_no) references seller(seller_store_no) on delete cascade
);

create sequence seller_notice_no_seq nocache;



/* 회원 */
DROP TABLE member 
	CASCADE CONSTRAINTS;

/* 판매자 */
DROP TABLE seller 
	CASCADE CONSTRAINTS;
	
/* 회원vvvvvvvvvvvv*/
CREATE TABLE member (
	member_id VARCHAR2(30) primary key, /* 아이디 */
	member_password VARCHAR2(20) NOT NULL, /* 비밀번호 */
	member_name VARCHAR2(18) NOT NULL, /* 이름 */
	member_phone CHAR(13) NOT NULL, /* 전화번호 */
	member_zipcode VARCHAR2(7) NOT NULL, /* 우편번호 */
	member_address VARCHAR2(180) NOT NULL, /* 주소 */
	member_sub_address VARCHAR2(90) NOT NULL, /* 세부주소 */
	member_assign NUMBER(1) NOT NULL /* 판매자등록여부 */
);
ALTER TABLE member RENAME COLUMN member_sub_adress to member_sub_address;

insert into member values ('isj4216', '52545856', '이성준', '010-9977-2905', '123-456',
										   '경기도 성남시 분당구 야탑동.', '노블리치오피스텔 A동 513호', 0);
insert into member values ('lsj4216', '52545856', '판매자', '010-9977-2905', '123-456',
   										   '경기도 성남시 분당구 야탑동.', '노블리치오피스텔 B동 313호', 1);
insert into member values ('hwang', 'dangdang', '황경희매니저', '010-9977-2905', '123-456',
   										   '경기도 성남시 판교동 판교로.', '유스페이스 B동 8층', 1);
insert into member values ('lsj42167', '52545856', '판매자', '010-9977-2905', '123-456',
   										   '경기도 성남시 분당구 야탑동.', '노블리치오피스텔 B동 313호', 1);
insert into member values ('lsj421678', 'dangdang', '황경희매니저', '010-9977-2905', '123-456',
   										   '경기도 성남시 판교동 판교로.', '유스페이스 B동 8층', 1); 
insert into member values ('hwanghwang', 'dangdang', '황경희매니저', '010-9977-2905', '123-466',
   										   '경기도 성남시 판교동 판교로.', '유스페이스 B동 7층', 1);
   						
   										   
insert into member values ('hwang@naver.com','dangdang', '황경희', '010-2387-0073','456-888','경기도 안산시 상록구','어디동 21번지',1) 

insert into member values ('kinghwang', 'kingdang', '퐝경', '010-9977-2905', '123-466',
   										   '경기도 성남시 판교동 판교로.', '유스페이스 B동 7층', 0);
   										   
insert into member values ('hwang3', 'dangdang', '황경희매니저', '010-9977-2905', '123-466',
   										   '경기도 성남시 판교동 판교로.', '유스페이스 B동 7층', 1);


   										   
   										   
/* 판매자vvvvvvvvvvv */
CREATE TABLE seller (
	seller_store_no number not null unique,
	seller_store_name VARCHAR2(60) not null unique, /* 상호명 */
	seller_tax_id CHAR(11), /* 사업자번호 */
	seller_industry VARCHAR2(30) NOT NULL, /* 업종 */
	seller_sub_industry VARCHAR2(150), /* 업종 소분류 */
	seller_zipcode VARCHAR2(7) NOT NULL, /* 우편번호 */
	seller_address VARCHAR2(180) NOT NULL, /* 주소 */
	seller_sub_address VARCHAR2(90) NOT NULL, /* 세부주소 */
	seller_store_image VARCHAR2(90) NOT NULL, /* 대표사진 */
	seller_product1 VARCHAR2(30), /* 판매물품1 */
	seller_product2 VARCHAR2(30), /* 판매물품2 */
	seller_product3 VARCHAR2(30), /* 판매물품3 */
	seller_introduction VARCHAR2(4000) NOT NULL, /* 소개글 */
	seller_assign number(1) not null,
	member_id varchar2(30) not null,
	foreign key(member_id) references member(member_id) on delete cascade
);
drop sequence seller_store_no_seq
create sequence seller_store_no_seq nocache;

insert into seller values(seller_store_no_seq.nextval, '해물나라', '12345-67890', '대분류업종', '소분류업종', '123-456', 
							'경기도 성남시 분당구 야탑동.', '노블리치오피스텔 B동 313호', '해물찜', '#전복', '#냉동문어', '#낙지', 
							'아주아주 싱싱하고 맛있는 해산물을 산지직송해드립니다.',1, 'hwang');
insert into seller values(seller_store_no_seq.nextval, '통영대표꿀빵', '12345-66789', '대분류업종', '소분류업종', '123-654', 
							'경기도 성남시 분당구 삼평동.', '유스페이스 B동 313호', '꿀빵', '#원조꿀빵', '#유자꿀빵', '#고구마꿀빵', 
							'넘나 맛있는 꿀빵을 만드는 꿀빵집입니다.',1, 'hwanghwang');
							
insert into seller values(seller_store_no_seq.nextval, '매머드', '12345-66789', '대분류업종', '소분류업종', '123-654', 
							'경기도 성남시 분당구 삼평동.', '유스페이스 B동 313호', '꿀빵', '#빅커피', '#꿀라떼', '#고구마라떼', 
							'넘나 맛있는 커피를 만드는 카페입니다.',0, 'hwang3'); 
   		
SELECT admin_qna_no_seq.nextval 
FROM dual
select * FROM admin_QnA 
ORDER BY admin_qna_no DESC;


--페이징
select * FROM (
	SELECT admin_qna_no , admin_qna_title , admin_qna_content , admin_qna_writer ,
		   admin_qna_date , admin_qna_hit , admin_qna_published ,admin_qna_password ,
		   ceil(rownum / 10) page
	FROM (
		SELECT    rownum , admin_qna_no , admin_qna_title , admin_qna_content ,admin_qna_writer ,
				  admin_qna_date ,admin_qna_hit ,admin_qna_published , admin_qna_password 
		FROM      ADMIN_QNA a
		ORDER BY  admin_qna_no DESC
	) 
)WHERE page = 1
			
		
SELECT      q.admin_qna_no ,q.admin_qna_title ,q.admin_qna_content ,
			q.admin_qna_writer ,q.admin_qna_date ,q.admin_qna_hit ,
			q.admin_qna_published, q.admin_QnA_password ,
			r.admin_reply_content ,r.admin_reply_date , r.admin_reply_no	
FROM        ADMIN_QNA q  ,  admin_QnA_reply r
WHERE       q.admin_qna_no =  r.admin_qna_no(+) 
	  
SELECT * FROM admin_QnA



--QnA게시판 답변여부 컬럼추가 
ALTER TABLE admin_QnA ADD admin_QnA_reply_exist char(1)
ALTER TABLE admin_QnA DROP COLUMN  admin_QnA_reply_exist 


DROP TABLE orders 
	CASCADE CONSTRAINTS;


CREATE TABLE orders (
	orders_no VARCHAR2(10) primary key, /* 주문번호 */
	orders_receiver VARCHAR2(18) NOT NULL, /* 받는사람 */
	orders_phone CHAR(13) NOT NULL, /* 전화번호 */
	orders_zipcode VARCHAR2(7) NOT NULL, /* 우편번호 */
	orders_address VARCHAR2(180) NOT NULL, /* 주소 */
	orders_sub_address VARCHAR2(90) NOT NULL, /* 세부주소 */
	orders_total_price NUMBER NOT NULL, /* 총주문가격 */
	orders_payment VARCHAR2(21) NOT NULL, /* 결제방식 */
	orders_request VARCHAR2(51), /* 요청사항 */
	payment_status NUMBER(1) NOT NULL, /* 결제여부 */
	orders_date DATE NOT NULL, /* 주문날짜 */
	member_id VARCHAR2(30) NOT NULL,/* 구매자 ID */
	foreign key(member_id) references member(member_id) 
);






--주문TB
insert into orders values ('order_no1', '홍길동1', '010-123-1234', '850-123', '경기도 성남시 분당구 판교동 주소', '유스스페이스 200-1동 303호 세부주소', 30000, '카드', '부재중일시 경비실에 맡겨주세요', 1, '2016-01-01', 'admin@admin.com' );
insert into orders values ('order_no2', '홍길동2', '010-123-1234', '850-123', '경기도 성남시 분당구 판교동 주소', '유스스페이스 200-1동 303호 세부주소', 20000, '카드', '부재중일시 경비실에 맡겨주세요', 2, '2016-02-01', 'admin@admin.com' );
insert into orders values ('order_no3', '홍길동3', '010-123-1234', '850-123', '경기도 성남시 분당구 판교동 주소', '유스스페이스 200-1동 303호 세부주소', 50000, '카드', '부재중일시 경비실에 맡겨주세요', 3, '2016-03-01', 'admin@admin.com' );
insert into orders values ('order_no4', '홍길동4', '010-123-1234', '850-123', '경기도 성남시 분당구 판교동 주소', '유스스페이스 200-1동 303호 세부주소', 10000, '카드', '부재중일시 경비실에 맡겨주세요', 4, '2016-04-01', 'admin@admin.com' );
insert into orders values ('order_no5', '홍길동5', '010-123-1234', '850-123', '경기도 성남시 분당구 판교동 주소', '유스스페이스 200-1동 303호 세부주소', 340000, '카드', '부재중일시 경비실에 맡겨주세요', 1, '2016-05-01', 'admin@admin.com' );
insert into orders values ('order_no6', '홍길동6', '010-123-1234', '850-123', '경기도 성남시 분당구 판교동 주소', '유스스페이스 200-1동 303호 세부주소', 340000, '카드', '부재중일시 경비실에 맡겨주세요', 1, '2016-06-01', 'admin@admin.com');
insert into orders values ('order_no7', '홍길동7', '010-123-1234', '850-123', '경기도 성남시 분당구 판교동 주소', '유스스페이스 200-1동 303호 세부주소', 30000, '카드', '부재중일시 경비실에 맡겨주세요', 1, '2016-07-01', 'admin@admin.com' );
insert into orders values ('order_no8', '홍길동8', '010-123-1234', '850-123', '경기도 성남시 분당구 판교동 주소', '유스스페이스 200-1동 303호 세부주소', 20000, '카드', '부재중일시 경비실에 맡겨주세요', 2, '2016-12-01', 'admin@admin.com' );
insert into orders values ('order_no9', '홍길동9', '010-123-1234', '850-123', '경기도 성남시 분당구 판교동 주소', '유스스페이스 200-1동 303호 세부주소', 20000, '카드', '부재중일시 경비실에 맡겨주세요', 2, '2016-11-01', 'admin@admin.com' );

 SELECT * FROM order_product;
SELECT * FROM orders;
delete FROM orders;
delete FROM order_product;


SELECT  order_product_seq.nextval
FROM dual



-- 주문상품 TB                           //PK              주문수량  , 주문번호  , 상품ID   , 상품옵션 ,  판매자스토어NO  , 상품상태 0~10      
insert into order_product values (order_product_seq.nextval , 5, 'order_no1', '상품id1', 12 , 15 , 0 ); 
insert into order_product values (order_product_seq.nextval ,4, 'order_no2', '상품id2', 13, 15 ,1);  
insert into order_product values (order_product_seq.nextval ,4, 'order_no3', '상품id3', 14, 15 ,2);
insert into order_product values (order_product_seq.nextval ,1, 'order_no4', '상품id4', 15, 16,3);   
insert into order_product values (order_product_seq.nextval ,2, 'order_no5', '상품id5', 16, 16,4);  
insert into order_product values (order_product_seq.nextval ,1, 'order_no6', '상품id6', 17, 16 ,10);
insert into order_product values (order_product_seq.nextval , 1, 'order_no7', '상품id7', 18, 17 ,5);
insert into order_product values (order_product_seq.nextval ,4, 'order_no8', '상품id1', 12, 17 , 6);
insert into order_product values (order_product_seq.nextval ,4, 'order_no1', '상품id3', 12, 17 , 7);


--home
insert into order_product values (order_product_seq.nextval , 5, 'order_no1', '상품id1', 3 , 1 , 0 ); 
insert into order_product values (order_product_seq.nextval ,4, 'order_no2', '상품id2', 4, 1 ,1);  
insert into order_product values (order_product_seq.nextval ,4, 'order_no3', '상품id3', 5, 1 ,2);
insert into order_product values (order_product_seq.nextval ,1, 'order_no4', '상품id4', 6, 2,3);   
insert into order_product values (order_product_seq.nextval ,2, 'order_no5', '상품id5', 7, 2,4);  
insert into order_product values (order_product_seq.nextval ,1, 'order_no6', '상품id6', 3, 2 ,10);
insert into order_product values (order_product_seq.nextval , 1, 'order_no7', '상품id7', 4, 4 ,4);
insert into order_product values (order_product_seq.nextval ,4, 'order_no8', '상품id1', 3, 1 , 4);
insert into order_product values (order_product_seq.nextval ,4, 'order_no1', '상품id3', 6, 4 , 7);
insert into order_product values (order_product_seq.nextval ,4, 'order_no9', '상품id2', 5, 2 , 3);

SELECT * FROM cart



select * FROM orders;
select * FROM seller
drop table order_product
create sequence order_product_seq nocache;

update order_product 
SET order_product_status = 10
WHERE orders_no = 'order_no6';

CREATE TABLE order_product  (
	order_seq_no number primary key ,  -- PK 
	order_amount number(4) not null, /* 상품수량  */
	orders_no VARCHAR2(10) not null, /* 주문번호 FK */
	product_id VARCHAR2(30) not null, /* 상품ID FK */
	option_id number not null ,      --  상품옵션ID_FK  
	seller_store_no number not null,     -- 판매자스토어NO_FK
	order_product_status number(2) NOT NULL ,  -- 상품상태 0 ~ 10 
	foreign key(orders_no) references orders(orders_no) on delete cascade,
	foreign key(product_id) references product(product_id) on delete set null ,
	foreign key(option_id) references product_option(option_id) on delete set null ,
	foreign key(seller_store_no) references seller(seller_store_no) on delete set null
);



-- 학원 
select * FROM seller
insert into product values ('productid1', '새우깡', 50000, 10, 'abc1.jpg', '상품정보1', 1, 15);
insert into product values ('productid2', '부여사과', 60000, 20, 'abc2.jpg', '상품정보2', 3, 16);
insert into product values ('productid3', '금산인삼', 70000, 30, 'abc3.jpg', '상품정보3', 2, 17);
insert into product values ('productid5', '북한냉면', 80000, 40, 'abc4.jpg', '상품정보4', 6, 18);
insert into product values ('productid4', '여수밤바다', 30000, 50, 'abc5.jpg', '상품정보5', 7, 15);
insert into product values ('productid6', '금사빠', 20000, 60, 'abc6.jpg', '상품정보6', 2, 16);
insert into product values ('productid7', '금도끼', 10000, 70, 'abc7.jpg', '상품정보7', 11,15);
insert into product values ('productid10', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 111,15);
insert into product values ('productid11', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 121,15);
insert into product values ('productid12', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 131,15);
insert into product values ('productid13', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 141,15);
insert into product values ('productid14', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 151,15);
insert into product values ('productid15', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 111,15);
insert into product values ('productid16', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 121,15);
insert into product values ('productid17', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 131,15);
insert into product values ('productid18', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 141,15);
insert into product values ('productid19', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 151,15);
insert into product values ('productid20', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 111,15);
insert into product values ('productid21', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 121,15);
insert into product values ('productid22', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 131,15);
insert into product values ('productid23', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 141,15);
insert into product values ('productid24', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 151,15);
insert into product values ('productid25', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 111,15);
insert into product values ('productid26', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 121,15);
insert into product values ('productid27', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 131,15);
insert into product values ('productid28', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 141,15);
insert into product values ('productid29', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 151,15);
insert into product values ('productid30', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 111,15);
insert into product values ('productid31', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 121,15);
insert into product values ('productid32', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 131,15);
insert into product values ('productid33', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 141,15);
insert into product values ('productid34', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 151,15);
insert into product values ('productid35', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 111,15);
insert into product values ('productid36', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 121,15);
insert into product values ('productid37', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 131,15);
insert into product values ('productid38', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 141,15);
insert into product values ('productid39', '새우깡', 10000, 70, 'abc7.jpg', '맛있는새우깡', 151,15);


  
select * FROM product_detail_image


--제품TB
                       --  상품아이디      상품명           가격     재고량     메인사진  상품정보     추천수    , 스토어번호   
insert into product values ('productid1', '새우깡', 50000, 10, 'abc1.jpg', '상품정보1', 1, 1);
insert into product values ('productid2', '부여사과', 60000, 20, 'abc2.jpg', '상품정보2', 3, 1);
insert into product values ('productid3', '금산인삼', 70000, 30, 'abc3.jpg', '상품정보3', 2, 1);
insert into product values ('productid5', '북한냉면', 80000, 40, 'abc4.jpg', '상품정보4', 6, 2);
insert into product values ('productid4', '여수밤바다', 30000, 50, 'abc5.jpg', '상품정보5', 7, 2);
insert into product values ('productid6', '금사빠', 20000, 60, 'abc6.jpg', '상품정보6', 2, 4);
insert into product values ('productid7', '금도끼', 10000, 70, 'abc7.jpg', '상품정보7', 11,4);

delete FROM product

INSERT INTO PRODUCT_DETAIL_IMAGE
VALUES ('abc1.jpg' , 'productid1'); 
INSERT INTO PRODUCT_DETAIL_IMAGE
VALUES ('abc2.jpg' , 'productid2'); 
INSERT INTO PRODUCT_DETAIL_IMAGE
VALUES ('abc3.jpg' , 'productid3'); 
INSERT INTO PRODUCT_DETAIL_IMAGE
VALUES ('abc4.jpg' , 'productid4'); 
INSERT INTO PRODUCT_DETAIL_IMAGE
VALUES ('abc5.jpg' , 'productid5'); 
INSERT INTO PRODUCT_DETAIL_IMAGE
VALUES ('abc6.jpg' , 'productid6'); 
INSERT INTO PRODUCT_DETAIL_IMAGE
VALUES ('abc7.jpg' , 'productid8'); 
INSERT INTO PRODUCT_DETAIL_IMAGE
VALUES ('abc8.jpg' , 'productid7'); 

select * FROM member;


SELECT * FROM product_option
--상품 옵션TB                        // 옵션아이디                옵션네임            옵션서브네임    수량       추가가격   , 상품ID  
insert into product_option values (option_id_seq.nextval, '사이즈/색상', '250/흰색', 10, 1000, 'productid7');
insert into product_option values (option_id_seq.nextval, '사이즈/색상', '240/검정색', 5, 5000, 'productid6');
insert into product_option values (option_id_seq.nextval, '사이즈/색상', '230/흰색', 10, 3000, 'productid5');
insert into product_option values (option_id_seq.nextval, '사이즈/색상', '220/흰색', 10, 0, 'productid4');
insert into product_option values (option_id_seq.nextval, '사이즈/색상', '210/검정색', 5, 0, 'productid3');
insert into product_option values (option_id_seq.nextval, '사이즈/색상', '260/흰색', 10, 2000, 'productid2');
insert into product_option values (option_id_seq.nextval, '사이즈/색상', '270/흰색', 10, 3000, 'productid1');


insert into product_option values (option_id_seq.nextval, '사이즈/색상', '210/검정색', 5, 0, '상품id5');

delete FROM 	product_option
WHERE  			option_id IN (16 ,26)


delete FROM order_product
WHERE    order_seq_no 152;

-------------- 나의주문
select * FROM member;
SELECT * FROM orders 
select * FROM seller;    
select * FROM product;  
SELECT * FROM order_product
SELECT * FROM product_option

update product 
SET product_main_image = 'abc4.png' 
WHERE product_id = '상품id4'





SELECT      o.orders_no , o.orders_receiver , o.orders_phone ,
			o.orders_zipcode , o.orders_address , o.orders_sub_address ,
			o.orders_total_price , o.orders_payment , o.orders_request ,
			o.payment_status , o.orders_date ,  o.member_id  ,
			
			op.order_amount  , op.orders_no ,  op.product_id  ,op.option_id , 
			op.seller_store_no , op.order_product_status , 
			
			p.product_Id, p.product_name, p.product_price, p.product_stock, 
			p.product_main_image, p.product_info, p.product_like, 
			p.seller_store_no ,
			
			s.seller_store_no, s.seller_store_name, s.seller_tax_id, s.seller_industry, 
			s.seller_sub_industry, s.seller_zipcode, s.seller_address, s.seller_sub_address, 
			s.seller_store_image, s.seller_product1, s.seller_product2, s.seller_product3, 
			s.seller_introduction, s.seller_assign, s.member_id  , 
		
			po.option_id , po.option_name , po.option_sub_name , po.option_stock , po.option_add_price , po.product_id 
			
	FROM   orders o ,  order_product op , product p  ,seller s  , product_option po
	
	WHERE  o.member_id =  'admin@admin.com'  
	AND    o.orders_no =  op.orders_no(+)
	AND    op.product_id =  p.product_Id
	AND    op.seller_store_no =  s.seller_store_no
	AND    op.option_id  =  po.option_id
	AND    p.product_Id = po.product_id
	ORDER BY o.orders_date DESC;
	
SELECT * FROM orders;
	




SELECT 		o.orders_no , o.orders_receiver , o.orders_phone ,
			o.orders_zipcode , o.orders_address , o.orders_sub_address ,
			o.orders_total_price , o.orders_payment , o.orders_request ,
			o.payment_status , o.orders_date ,  o.member_id buyer ,
			
			op.order_amount  , op.orders_no ,  op.product_id  ,op.option_id , 
			op.seller_store_no ,op.order_product_status ,
			
			p.product_Id, p.product_name, p.product_price, p.product_stock, 
			p.product_main_image, p.product_info, p.product_like, 
			p.seller_store_no , 
			
			s.seller_store_no, s.seller_store_name, s.seller_tax_id, s.seller_industry, 
			s.seller_sub_industry, s.seller_zipcode, s.seller_address, s.seller_sub_address, 
			s.seller_store_image, s.seller_product1, s.seller_product2, s.seller_product3, 
			s.seller_introduction, s.seller_assign, s.member_id  ,
			
			po.option_id , po.option_name , po.option_sub_name , po.option_stock , 
			po.option_add_price , po.product_id 
			
FROM   orders o ,  order_product op  ,product p  , seller s  ,product_option po

WHERE  o.member_id =  'admin@admin.com'  
AND    o.orders_no =  op.orders_no
AND    op.product_id =  p.product_Id
AND    op.seller_store_no =  s.seller_store_no
AND    op.option_id  =  po.option_id

ORDER BY op.orders_no 
	




SELECT 
		orders_no_1 , orders_receiver , orders_phone ,    orders_zipcode ,
		orders_address , orders_sub_address ,    orders_total_price ,
		orders_payment , orders_request , payment_status , orders_date ,  buyer ,    
		
		order_seq_no , order_amount  , orders_no_2 ,  product_id_1  ,option_id_1 , 
		seller_store_no_1 , order_product_status ,        
		
		product_Id_2 , product_name , product_price, product_stock,   
		product_main_image, product_info, product_like, seller_store_no ,  
		
		seller_store_no_2 , seller_store_name, seller_tax_id, seller_industry,    
		seller_sub_industry, seller_zipcode, seller_address, seller_sub_address,     
		seller_store_image, seller_product1, seller_product2, seller_product3,    
		seller_introduction, seller_assign, member_id  ,        
				
		option_id_2 , option_name , option_sub_name , option_stock , 
		option_add_price ,  product_id 
		
	FROM ( 
	
		SELECT   
		orders_no_1 , orders_receiver , orders_phone ,    orders_zipcode ,
		orders_address , orders_sub_address ,    orders_total_price ,
		orders_payment , orders_request , payment_status , orders_date ,  buyer ,    
		
		order_seq_no , order_amount  , orders_no_2 ,  product_id_1  ,option_id_1 , 
		seller_store_no_1 , order_product_status ,        
		
		product_Id_2 , product_name , product_price, product_stock,   
		product_main_image, product_info, product_like, seller_store_no ,  
		
		
		seller_store_no_2 , seller_store_name, seller_tax_id, seller_industry,    
		seller_sub_industry, seller_zipcode, seller_address, seller_sub_address,     
		seller_store_image, seller_product1, seller_product2, seller_product3,    
		seller_introduction, seller_assign, member_id  ,        
		
		option_id_2 , option_name , option_sub_name , option_stock , 
		option_add_price ,  product_id  ,  ceil(rownum / 3) page  
	
		FROM (   
		
		
			SELECT    o.orders_no orders_no_1 , o.orders_receiver , o.orders_phone ,
			o.orders_zipcode , o.orders_address , o.orders_sub_address ,   
			o.orders_total_price , o.orders_payment , o.orders_request ,    
			o.payment_status , o.orders_date ,    o.member_id buyer ,     
			
			op.order_seq_no  , op.order_amount  , op.orders_no orders_no_2 ,  
			op.product_id product_id_1  ,op.option_id option_id_1  ,    
			op.seller_store_no seller_store_no_1 , op.order_product_status ,   
			
		
			p.product_Id product_id_2 , p.product_name, p.product_price, p.product_stock,   
			p.product_main_image, p.product_info, p.product_like,   p.seller_store_no  ,       
			
			s.seller_store_no seller_store_no_2 , s.seller_store_name, s.seller_tax_id, s.seller_industry,    
			s.seller_sub_industry, s.seller_zipcode, s.seller_address, s.seller_sub_address,     
			s.seller_store_image, s.seller_product1, s.seller_product2, s.seller_product3,     
			s.seller_introduction, s.seller_assign, s.member_id  ,       
			
			po.option_id option_id_2,  po.option_name , po.option_sub_name ,
			po.option_stock , po.option_add_price , po.product_id        
		
		FROM   orders o ,  order_product op , product p  ,seller s  , product_option po 
		
		WHERE  o.member_id =   'admin@admin.com'   
		AND    o.orders_no =  op.orders_no(+)   
		AND    op.product_id =  p.product_Id  
		AND    op.seller_store_no =  s.seller_store_no   
		AND    op.option_id  =  po.option_id  
		AND    op.order_product_status IN (0,1,2,3,4)   
		ORDER BY o.orders_date DESC 
		) 
	)WHERE page = 4
	
	--
	
SELECT count(*) FROM order_product 
	WHERE order_product_status IN (0,1,2,3,4)    

	
	---buy!!-----------------------------------------
	
	
	
SELECT * FROM cart
SELECT * FROM product
SELECT * FROM product_option


/* 장바구니vvvvvvv */
CREATE TABLE cart (
	cart_no NUMBER primary key,/* 장바구니 번호 */
	cart_product_amount NUMBER(4) NOT NULL, /* 장바구니 상품수량 */
	cart_product_option VARCHAR2(100) NOT NULL, /* 장바구니 선택옵션 */
	product_id VARCHAR2(30) NOT NULL, /* 상품ID */
	member_id VARCHAR2(30) NOT NULL, /* 아이디 */
	foreign key(product_id) references product(product_id),
	foreign key(member_id) references member(member_id)
);


SELECT * FROM  notice
SELECT * FROM  product_detail_image




SELECT * FROM store_QnA_reply 
CREATE TABLE store_QnA_reply (
	store_reply_writer VARCHAR2(30) NOT NULL, /* 작성자 */
	store_reply_content varchar2(4000) NOT NULL, /* 내용 */
	store_reply_date DATE NOT NULL, /* 작성일 */
	storeQnA_no NUMBER primary key /* QnA번호 */,
	foreign key(storeQnA_no) references store_qna(storeQnA_no) on delete cascade
);



SELECT * FROM store_QnA  
CREATE TABLE store_QnA (
	storeQnA_no NUMBER primary key, /* QnA번호 */
	storeQnA_title VARCHAR2(30) NOT NULL, /* 문의 제목 */
	storeQnA_content VARCHAR2(4000) NOT NULL, /* 문의 내용 */
	storeQnA_hit NUMBER NOT NULL, /* 문의 조회수 */
	storeQnA_published number(1) NOT NULL, /* 문의 공개 여부 */
	storeQnA_writer VARCHAR2(30) NOT NULL,/*문의 작성자*/
	storeQnA_date DATE NOT NULL, /* 문의 작성일 */
	product_id VARCHAR2(30) not null, /* 상품ID */
	foreign key(product_id) references product(product_id) on delete cascade
);

SELECT * FROM review   

SELECT * FROM exchange_request 
SELECT * FROM  refund_request
SELECT * FROM  code

SELECT * FROM category
SELECT * FROM  seller_notice 

SELECT * FROM PRODUCT
select * FROM member;

SELECT product_stock 
FROM   product
WHERE product_id = '상품id4'

update PRODUCT
SET product_stock = 3
WHERE product_id = '상품id4'

SELECT * FROM orders
SELECT * FROM PRODUCT

SELECT  order_product_seq.nextval
FROM dual

	SELECT  option_id , option_name , option_sub_name ,
			product_id , option_stock , option_add_price
	FROM 	product_option
	WHERE 	option_sub_name = '220/흰색'

SELECT * FROM member;
 ALTER TABLE member ADD  member_mileage number

 UPDATE MEMBER
 SET member_mileage = 15000
 WHERE member_id ='admin@admin.com' 
 
 
 update orders 
 SET  orders_date = '2011-11-23'
 WHERE orders_no = 'order_no8'
 
SELECT  rownum ,orders_no, orders_receiver, orders_phone, orders_zipcode, orders_address, orders_sub_address,
		orders_total_price, orders_payment,orders_request, payment_status, member_id ,orders_date 
FROM    orders  
WHERE   orders_date = (  
	SELECT MAX(orders_date) FROM orders WHERE member_id ='admin@admin.com' 
);



SELECT  	option_id , option_name , option_sub_name ,
			product_id , option_stock , option_add_price
			
FROM 		product_option
WHERE 		option_sub_name = '270/흰색'


DELETE FROM PRODUCT_OPTION
WHERE option_id = 18;

  SELECT * FROM  order_product
  WHERE  option_id = 18;

DELETE FROM order_product
WHERE order_seq_no = 154


ALTER TABLE  product_option  
MODIFY option_sub_name 

SELECT * FROM member;
SELECT * FROM product_option;

SELECT * FROM  seller

UPDATE member 
SET member_mileage =  15000
WHERE member_id = 'admin@admin.com'



-----------
SELECT  *
FROM cart
WHERE cart_no = #{cartNo} 

SELECT  *
FROM cart
WHERE member_id = 'admin@admin.com'

SELECT  *
FROM product
WHERE product_id ='productid1'

SELECT * FROM product_option
WHERE product_id ='productid1'

SELECT * FROM member;


SELECT   product_id , product_name ,product_price ,product_stock ,
	     product_main_image  , product_info , product_like , p.seller_store_no ,
	     s.seller_store_no , seller_store_name , seller_tax_id , seller_industry ,
		 seller_sub_industry , seller_zipcode , seller_address , seller_sub_address ,
		 seller_store_image , seller_product1  , seller_product2, seller_product3 , 
		 seller_introduction , seller_assign ,  member_id 

FROM   
(
	SELECT  product_id , product_name ,product_price ,product_stock ,
	     	product_main_image  , product_info , product_like , p.seller_store_no
	FROM 	product p  
	WHERE   product_stock > 0 	
) p , seller s

WHERE     p.seller_store_no = s.seller_store_no 
AND     product_name LIKE '%새우깡%' 
OR 	   product_info LIKE '%새우깡%' 
OR    seller_store_name LIKE '%새우깡%' 
OR    seller_product1 LIKE '%새우깡%' 
OR    seller_product2 LIKE '%새우깡%' 
OR    seller_product3 LIKE '%새우깡%' 
 

select * FROM product
WHERE  product_name LIKE '%생새우%' 

select 	*
FROM 	seller 
WHERE 	seller_product1 LIKE '%새우깡%' 
OR 		seller_product2 LIKE '%새우깡%' 
OR 		seller_product3 LIKE '%새우깡%' 


productid1 새우깡
productid2 새우깡
productid3 새우깡
해물나라 


SELECT  product_id , product_name ,product_price ,product_stock ,
		product_main_image  , product_info , product_like , p_seller_store_no ,
		s_seller_store_no , seller_store_name , seller_tax_id , seller_industry ,
		seller_sub_industry , seller_zipcode , seller_address , seller_sub_address ,
		seller_store_image , seller_product1  , seller_product2, seller_product3 , 
		seller_introduction , seller_assign ,  member_id 
FROM (

SELECT 	product_id , product_name ,product_price ,product_stock ,
		product_main_image  , product_info , product_like , p_seller_store_no ,
		s_seller_store_no , seller_store_name , seller_tax_id , seller_industry ,
		seller_sub_industry , seller_zipcode , seller_address , seller_sub_address ,
		seller_store_image , seller_product1  , seller_product2, seller_product3 , 
		seller_introduction , seller_assign ,  member_id  , ceil(rownum / 1) page 
FROM (
		SELECT    product_id , product_name ,product_price ,product_stock ,
		product_main_image  , product_info , product_like , p.seller_store_no p_seller_store_no ,
		s.seller_store_no s_seller_store_no , seller_store_name , seller_tax_id , seller_industry ,
		seller_sub_industry , seller_zipcode , seller_address , seller_sub_address ,
		seller_store_image , seller_product1  , seller_product2, seller_product3 , 
		seller_introduction , seller_assign ,  member_id 
		FROM   
		(
			SELECT     product_id , product_name ,product_price ,product_stock ,
			     	   product_main_image  , product_info , product_like , p.seller_store_no ,rownum
			FROM 	   product p  
			WHERE      product_stock > 0 
			ORDER BY   product_like DESC	
		) p , seller s
		WHERE     p.seller_store_no = s.seller_store_no 
		AND       product_name LIKE '%생새우%'
)

) WHERE page = 1







select member_id 
	FROM 
	(
		select member_id , ceil(rownum / 2) page
		FROM 
		(
			select * 
			FROM  member
		)	
)where page = 1



select * FROM product



SELECT  count(*)
		FROM   
		(
			SELECT     product_id , product_name ,product_price ,product_stock ,
			     	   product_main_image  , product_info , product_like , p.seller_store_no ,rownum
			FROM 	   product p  
			WHERE      product_stock > 0 
			ORDER BY   product_like DESC	
		) p , seller s
		WHERE     p.seller_store_no = s.seller_store_no 
		AND       product_name LIKE '%새우깡%'
		
		
select * FROM ADMIN_QNA
select * FROM code

	SELECT  	option_id , option_name , option_sub_name ,
				product_id , option_stock , option_add_price
				
	FROM 		product_option
	WHERE 		option_sub_name = '250g/딸기'

