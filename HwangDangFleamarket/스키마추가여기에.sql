
--스키마 추가있으면 sql 여기에 !!

--QnA게시판 비밀번호 컬럼추가 
ALTER TABLE admin_QnA ADD admin_QnA_password char(4)

--QnA게시판 답변여부 컬럼추가 
ALTER TABLE admin_QnA ADD admin_QnA_reply_exist char(1)
ALTER TABLE admin_QnA DROP COLUMN  admin_QnA_reply_exist 

--order_product 테이블에 주문현황 컬럼 추가.
ALTER TABLE order_product ADD order_product_status number(1)
ALTER TABLE order_product DROP COLUMN order_product_status
ALTER TABLE orders DROP COLUMN orders_status

--order_product 테이블 order_product_status 타입변경
ALTER TABLE order_product MODIFY (order_product_status number(2))

--orders 에 date추가.
ALTER TABLE orders ADD orders_date date
ALTER TABLE orders DROP COLUMN orders_date


	--배송완료 -  구매확정 : 10 
	--배송현황 - 입금대기중 : 0 
	--배송현황 - 결제완료 : 1
	--배송현황 - 배송준비중 : 2
	--배송현황 - 배송중 : 3
	--배송현황  - 배송완료 : 4
	--교환/환불/취소 -  교환신청 : 5
	--교환/환불/취소 -  환불신청 :  6 
	--교환/환불/취소 - 구매취소(배송전) :  7 
	--교환/환불/취소 -   교환신청 승인 : 8 
	--교환/환불/취소 -   환불신청 승인  : 9

ALTER TABLE orders MODIFY  orders_status number(1);
    
ALTER TABLE order_product MODIFY order_product_status number(2);

-- order_product TB 스키마 변경 
--1
drop table order_product
--2
CREATE TABLE order_product  (
	order_seq_no number primary key ,  -- PK 
	order_amount number(4) not null, /* 상품수량  */
	orders_no VARCHAR2(10) not null, /* 주문번호 FK */
	product_id VARCHAR2(30) not null, /* 상품ID FK */
	option_id number not null ,      --  상품옵션ID_FK  
	seller_store_no number not null,     -- 판매자스토어NO_FK
	foreign key(orders_no) references orders(orders_no) on delete cascade,
	foreign key(product_id) references product(product_id) on delete set null ,
	foreign key(option_id) references product_option(option_id) on delete set null ,
	foreign key(seller_store_no) references seller(seller_store_no) on delete set null
);
--3
insert into order_product values (order_product_seq.nextval , 5, 'order_no43', '상품id1', 12 , 15 );
insert into order_product values (order_product_seq.nextval ,4, 'order_no17', '상품id2', 13, 15 );
insert into order_product values (order_product_seq.nextval ,4, 'order_no37', '상품id3', 14, 15 );
insert into order_product values (order_product_seq.nextval ,1, 'order_no28', '상품id4', 15, 16);
insert into order_product values (order_product_seq.nextval ,2, 'order_no13', '상품id5', 16, 16);
insert into order_product values (order_product_seq.nextval ,1, 'order_no11', '상품id6', 17, 16);
insert into order_product values (order_product_seq.nextval , 1, 'order_no42', '상품id7', 18, 17);
insert into order_product values (order_product_seq.nextval ,4, 'order_no34', '상품id1', 12, 17);

select order_product_seq.nextval FROM dual


order_seq_no_seq


order_seq_no_seq

-- cart TB 변경
drop sequence cart_no_seq;
create sequence cart_no_seq nocache;

-- cart TB에 seller_store_no 추가
-- cart TB에 seller_store_name 추가
drop table cart
CREATE TABLE cart (
	cart_no NUMBER primary key,/* 장바구니 번호 */
	cart_product_amount NUMBER(4) NOT NULL, /* 장바구니 상품수량 */
	cart_product_option VARCHAR2(100) NOT NULL, /* 장바구니 선택옵션 */
	product_id VARCHAR2(30) NOT NULL, /* 상품ID */
	member_id VARCHAR2(30) NOT NULL, /* 아이디 */
	option_id NUMBER NOT NULL, /* 상품 옵션 아이디 */
	foreign key(product_id) references product(product_id),
	foreign key(member_id) references member(member_id),
	foreign key(option_id) references PRODUCT_OPTION(option_id)
);

select * from cart
insert into cart values(cart_no_seq.nextval,2,'230/검','상품id133','hwang',6)
insert into cart values(cart_no_seq.nextval,2,'230/검','상품id1','hwang',14)
insert into cart values(cart_no_seq.nextval,2,'230/검','상품id1','hwang',1)


select c.cart_no, c.cart_product_amount, c.cart_product_option, c.product_id, c.member_id, c.option_id,
			   p.product_Id, p.product_name, p.product_price, p.product_stock, p.product_main_image, p.product_info, p.product_like, p.seller_store_no, 
			   s.seller_store_no, s.seller_store_name, s.seller_tax_id, s.seller_industry, s.seller_sub_industry, s.seller_zipcode, s.seller_address, 
			   s.seller_sub_address, s.seller_store_image, s.seller_product1, s.seller_product2, s.seller_product3, s.seller_introduction, s.seller_assign, s.member_id
		from   cart c, product p, seller s
		where  c.product_id = p.product_id
		and    p.seller_store_no = s.seller_store_no
		and    p.product_id = '상품id133'
		and    s.seller_store_no = 8
		and    c.member_id = 'hwang'
		
----------
--Member TB  마일리지 컬럼 추가
 ALTER TABLE member ADD  member_mileage number

 drop table product_option cascade constraints
CREATE TABLE product_option (
	option_id NUMBER primary key, /* 상품옵션ID */
	option_name VARCHAR2(30) NOT NULL, /* 옵션명 */
	option_sub_name VARCHAR2(60) NOT NULL, /* 세부 옵션명 */
	option_stock NUMBER(4) NOT NULL, /* 재고량 */
	option_add_price NUMBER(7) not null, /* 추가가격 */
	product_id VARCHAR2(30) NOT NULL, /* 상품ID */
	foreign key(product_id) references product(product_id) on delete cascade
);

-- 상품 상세이미지 경로 크기 최대치로 늘려줌
ALTER TABLE PRODUCT_DETAIL_IMAGE modify image_path varchar2(4000);