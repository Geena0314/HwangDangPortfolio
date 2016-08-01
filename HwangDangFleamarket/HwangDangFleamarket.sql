
/* 회원 */
DROP TABLE member 
	CASCADE CONSTRAINTS;

	DROP TABLE cart 
	CASCADE CONSTRAINTS;
	
/* 판매자 */
DROP TABLE seller 
	CASCADE CONSTRAINTS;

/* 상품 */
DROP TABLE product 
	CASCADE CONSTRAINTS;

/* 리뷰 */
DROP TABLE review 
	CASCADE CONSTRAINTS;

/* 스토어QnA */
DROP TABLE store_QnA 
	CASCADE CONSTRAINTS;

/* 장바구니 */
DROP TABLE cart 
	CASCADE CONSTRAINTS;

/* 주문 */
DROP TABLE orders 
	CASCADE CONSTRAINTS;

/* 상품옵션 */
DROP TABLE product_option 
	CASCADE CONSTRAINTS;

delete from seller_NOTICE

/* 소식통(관리자) */
DROP TABLE notice 
	CASCADE CONSTRAINTS;

/* 관리자QnA */
DROP TABLE admin_QnA 
	CASCADE CONSTRAINTS;

/* 관리자QnA댓글 */
DROP TABLE admin_QnA_reply 
	CASCADE CONSTRAINTS;

/* 교환신청 */
DROP TABLE exchange_request 
	CASCADE CONSTRAINTS;

/* 환불신청 */
DROP TABLE refund_request
	CASCADE CONSTRAINTS;

/* 상품상세사진 */
DROP TABLE product_detail_image 
	CASCADE CONSTRAINTS;

/* 스토어QnA댓글 */
DROP TABLE store_QnA_reply 
	CASCADE CONSTRAINTS;

/* 주문상품 */
DROP TABLE order_product 
	CASCADE CONSTRAINTS;

/* 코드 */
DROP TABLE code 
	CASCADE CONSTRAINTS;

/* 카테고리 */
DROP TABLE category 
	CASCADE CONSTRAINTS;
	
/* 스토어 게시판 */	
DROP TABLE seller_notice 
	CASCADE CONSTRAINTS;
	
select * from member;
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

insert into member values ('eeeeeeee', '52545856', '이성준', '010-9977-2905', '123-456',
										   '전라북도 익산시 신동', '신동아파트', 0);
insert into member values ('ffffffff', '52545856', '이선영', '010-9977-2905', '123-456',
'전북 익산시 마동.', '명서점슈퍼', 0);
insert into member values ('cccccccc', '52545856', '김종미', '010-9977-2905', '123-456',
'전북 군산시 나운동.', '우진아파트 6동 203호', 0);
insert into member values ('dddddddd', '52545856', '이종엽', '010-9977-2905', '123-456',
'경기도 성남시 정자동.', '음 무슨 아파트였드라', 0);
insert into member values ('lsj4216', '52545856', '판매자', '010-9977-2905', '123-456',
   										   '경기도 성남시 분당구 야탑동.', '노블리치오피스텔 B동 313호', 1);
insert into member values ('hwangg@gmail.com', 'dangdang', '황경희매니저', '010-9977-2905', '123-456',
   										   '경기도 성남시 판교동 판교로', '유스페이스 B동 8층', 0, 1000);
insert into member values ('lsj42167', '52545856', '판매자', '010-9977-2905', '123-456',
   										   '경기도 성남시 분당구 야탑동.', '노블리치오피스텔 B동 313호', 1);
insert into member values ('lsj421678', 'dangdang', '황경희매니저', '010-9977-2905', '123-456',
   										   '경기도 성남시 판교동 판교로.', '유스페이스 B동 8층', 1); 
insert into member values ('hwanghwang@naver.com', 'dangdang', '황경희매니저', '010-9977-2905', '123-466',
   										   '경기도 성남시 판교동 판교로.', '유스페이스 B동 7층', 1, 900000);
   						
   										   
insert into member values ('hwang@naver.com','dangdang', '황경희', '010-2387-0073','456-888','경기도 안산시 상록구','어디동 21번지',1) 

insert into member values ('kinghwang@gmail.com', 'kingdang', '퐝경', '010-9977-2905', '123-466',
   										   '경기도 성남시 판교동 판교로.', '유스페이스 B동 7층', 0, 2000000);
   										   
insert into member values ('admin@admin.com', '12341234', '관리자', '010-9977-2905', '123-466',
   										   '경기도 성남시 판교동 판교로.', '유스페이스 B동 7층', 1);


delete from member where member_id = 'hwanghwang'					
select * from member


select 	s.seller_store_no, s.seller_store_name, s.seller_tax_id, s.seller_industry, 
			s.seller_sub_industry, s.seller_zipcode, s.seller_address, s.seller_sub_address, 
			s.seller_store_image, s.seller_product1, s.seller_product2, s.seller_product3, 
			s.seller_introduction, s.seller_assign, s.member_id, 
			m.member_id, m.member_password, m.member_name, 
			m.member_phone, m.member_zipcode, m.member_address, 
			m.member_sub_address, m.member_assign
from 		seller s, member m
where 	s.seller_store_no=1
and		s.member_id=m.member_id

/* 판매자vvvvvvvvvvv */
CREATE TABLE seller (
	seller_store_no number primary key,
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
							'경기도 성남시 분당구 야탑동.', '노블리치오피스텔 B동 313호', '해물찜.jpg', '#전복', '#냉동문어', '#낙지', 
							'아주아주 싱싱하고 맛있는 해산물을 산지직송해드립니다.',1 ,'hwang88@gmail.com');
insert into seller values(seller_store_no_seq.nextval, '통영대표꿀빵', '12345-66789', '대분류업종', '소분류업종', '123-654', 
							'경기도 성남시 분당구 삼평동.', '유스페이스 B동 313호', '꿀빵.jpg', '원조꿀빵', '유자꿀빵', '고구마꿀빵', 
							'넘나 맛있는 꿀빵을 만드는 꿀빵집입니다.',1, 'hwanghwang@naver.com');
							
insert into seller values(seller_store_no_seq.nextval, '매머드', '12345-66789', '대분류업종', '소분류업종', '123-654', 
							'경기도 성남시 분당구 삼평동.', '유스페이스 B동 313호', '꿀빵.jpg', '#빅커피', '#꿀라떼', '#고구마라떼', 
							'넘나 맛있는 커피를 만드는 카페입니다.',0, 'hwang3'); 
   		
select * FROM member;
select * from seller
delete from seller where member_id = 'hwanghwang'

select count(seller_store_no) from seller where seller_assign = 1

select 	seller_store_no, seller_store_name, seller_tax_id, seller_industry, seller_sub_industry, seller_zipcode, seller_address, seller_sub_address,
				 	seller_store_image, seller_product1, seller_product2, seller_product3, seller_introduction, member_id
from		seller
where		member_id='lsj4216'

select count(seller_store_name) from seller where seller_store_name = '황당마켓1'

/* 상품vvvvvvvvv */
drop table product
CREATE TABLE product (
	product_id VARCHAR2(30) primary key, /* 상품ID */
	product_name VARCHAR2(30) NOT NULL, /* 상품명 */
	product_price NUMBER(7) NOT NULL, /* 가격 */
	product_stock NUMBER(4) NOT NULL, /* 총재고량 */
	product_main_image VARCHAR2(90) NOT NULL, /* 상품메인사진 */
	product_info CLOB NOT NULL, /* 상품정보 */
	product_like NUMBER NOT NULL, /* 추천수 */
	seller_store_no number not null,
	foreign key(seller_store_no) references seller(seller_store_no) on delete cascade
);
--연습용 시퀀스
drop sequence product_id_seq
create sequence product_id_seq nocache;
insert into product values ('상품id135', '상품명', 50000, 20, 'shoes1', '상품정보클롭8', 1, 15);
insert into product values ('상품id134', '상품명', 60000, 20, 'shoes3', '상품정보클롭9', 3, 15);
insert into product values ('상품id133', '상품명', 70000, 20, 'shoes2', '상품정보클롭10', 2, 15);
insert into product values ('상품id132', '상품명', 80000, 20, 'shoes4', '상품정보클롭11', 6,15);
insert into product values ('상품id131', '상품명', 30000, 20, 'shoes6', '상품정보클롭12', 7, 8);
insert into product values ('상품id130', '상품명', 20000, 20, 'shoes7', '상품정보클롭13', 2, 8);
insert into product values ('상품id129', '상품명', 10000, 20, 'shoes8', '상품정보클롭14', 11, 8);

insert into product values ('상품id119', '상품명', 40000, 2222, 'shoes2', '상품정보클롭', 2, 1);
insert into product values ('상품id1121', '상품명', 3000, 3333, 'shoes3', '상품정보클롭', 3, 1);
insert into product values ('상품id1132', '상품명', 50000, 4444, 'shoes4', '상품정보클롭', 4, 1);
insert into product values ('상품id1143', '상품명', 40000, 2222, 'shoes5', '상품정보클롭', 5, 1);
insert into product values ('상품id1154', '상품명', 3000, 3333, 'shoes6', '상품정보클롭', 6, 1);
insert into product values ('상품id1165', '상품명', 40000, 2222, 'shoes7', '상품정보클롭', 7, 1);
insert into product values ('상품id1176', '상품명', 3000, 3333, 'shoes8', '상품정보클롭', 8, 1);

insert into product values ('상품id29', '상품명', 3000, 3333, 'shoes8', '상품정보클롭', 12, 1);

select * from PRODUCT order by product_like desc

/* 리뷰 vvvvvv*/
CREATE TABLE review (
	review_no NUMBER NOT NULL, /* 리뷰번호 */
	review_content VARCHAR2(60) NOT NULL, /* 리뷰 내용 */
	review_date DATE NOT NULL, /* 작성일 */
	review_writer VARCHAR2(30) NOT NULL, /* 작성자 */
	product_id VARCHAR2(30) not null, /* 상품ID */
	foreign key(product_id) references product(product_id) on delete cascade
);
drop sequence review_no_seq
create sequence review_no_seq nocache;
insert into review values (review_no_seq.nextval, '너무나 잘 받았습니다...', sysdate, 'posese4@hanmail.net', 'ironMan07');
insert into review values (review_no_seq.nextval, '감사감사합니다.', sysdate, 'susu222@naver.com', 'ironMan07');
insert into review values (review_no_seq.nextval, '기스가 나있어요 ㅜㅜ', sysdate, 'sasuy2@gmail.com', 'ironMan07');
insert into review values (review_no_seq.nextval, '좋아좋아좋아좋아', sysdate, 'aaong77@naver.com', 'ironMan07');
insert into review values (review_no_seq.nextval, '굳굳굳굳굳!', sysdate, 'geena321@gmail.com', 'ironMan07');
insert into review values (review_no_seq.nextval, '아주 좋군요~~', sysdate, 'saloko22@gmail.com', 'ironMan07');
insert into review values (review_no_seq.nextval, '좋습니다~ 좋구요~', sysdate, 'hololo@gmail.com', 'ironMan07');
insert into review values (review_no_seq.nextval, '또 사고싶어요.', sysdate, 'bumbumpow@gmail.com', 'ironMan07');
insert into review values (review_no_seq.nextval, '너무너무 이쁘네요~', sysdate, 'sirundae2@gmail.com', 'ironMan07');

select count(REVIEW_no) from REVIEW
select count(review_no) from review where review_writer = 'isj4216' and product_id='상품id5'
update 	product
		set			product_like = product_like+-1
		where		product_id = '상품id29'
delete from review where review_writer = 'isj4216'

/* 스토어QnA vvvvvvvv*/
drop table store_QnA
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
drop sequence storeQnA_no_seq
create sequence storeQnA_no_seq nocache;
insert into store_qna values (storeQnA_no_seq.nextval, '재입고 문의', '재고는 언제 들어오나요???????', 11, 0, 'sayong@gmail.com', sysdate, 'ironMan07');
insert into store_qna values (storeQnA_no_seq.nextval, '재고관련 문의', '재고가 언제 들어오나요??', 1, 1, 'sayong@gmail.com', sysdate, 'ironMan07');
insert into store_qna values (storeQnA_no_seq.nextval, '상품 관련 문의', '기스난 제품은 어떻게 하나요?', 21, 1, 'sajonn@gmail.com', sysdate, 'ironMan07');
insert into store_qna values (storeQnA_no_seq.nextval, '가격관련 문의', '할인은 안되나요?', 11, 0, 'rayong@naver.com', sysdate, 'ironMan07');
insert into store_qna values (storeQnA_no_seq.nextval, '문의드립니다.', '단체주문 하고싶은데, 어떻게 해야하나요?', 1, 1, 'tyyong@gmail.com', sysdate, 'ironMan07');
insert into store_qna values (storeQnA_no_seq.nextval, '문의드립니다.', '단체주문 하고싶은데, 어떻게 해야하나요?', 21, 1, 'aasung@naver.com', sysdate, 'ironMan07');

select storeQnA_no, storeQnA_title, storeQnA_content, storeQnA_hit, storeQnA_published, storeQnA_writer, storeQnA_date, product_id
		from (select ceil(rownum/6) page, storeQnA_no, storeQnA_title, storeQnA_content, storeQnA_hit, storeQnA_published, storeQnA_writer, storeQnA_date, product_id
				from (select storeQnA_no, storeQnA_title, storeQnA_content, storeQnA_hit, storeQnA_published, storeQnA_writer, storeQnA_date, product_id
						from store_QnA where product_id='상품id29' order by storeQnA_no desc))
		where page = 1

select 	storeQnA_no, storeQnA_title, storeQnA_content, storeQnA_hit, storeQnA_published, storeQnA_writer, storeQnA_date, product_id
		from		store_QnA
		where 	storeQnA_no=1

select 	q.storeQnA_no, q.storeQnA_title, q.storeQnA_content, q.storeQnA_hit, q.storeQnA_published, q.storeQnA_writer, q.storeQnA_date, q.product_id,
			r.store_reply_writer, r.store_reply_content, r.store_reply_date, r.storeQnA_no
from 		store_QnA q, store_QnA_reply r
where 	q.storeQnA_no = 30
and 		r.storeQnA_no = q.storeQnA_no
		
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
drop sequence cart_no_seq;
create sequence cart_no_seq nocache;

/* 주문vvvvvvvvvvvvvv */
drop table orders cascade constraints

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
	orders_date date not null,
	member_id VARCHAR2(30) NOT NULL,/* 아이디 */
	foreign key(member_id) references member(member_id)
);

insert into orders values ('a', '수취인', '010-9977-2905', '123-123', '주소', '세부주소', 5000, '카드', '없음', 1, sysdate, 'isj4216@gmail.com');
insert into orders values ('b', '수신인', '010-9977-2905', '123-123', '주소', '세부주소', 5000, '카드', '없음', 1, sysdate, 'isj4216@gmail.com');
insert into orders values ('c', '이성준', '010-9977-2905', '123-123', '주소', '세부주소', 5000, '카드', '없음', 0, sysdate, 'isj4216@gmail.com');
insert into orders values ('d', '주변인', '010-9977-2905', '123-123', '주소', '세부주소', 5000, '카드', '없음', 0, sysdate, 'isj4216@gmail.com');
insert into orders values ('e', '너', '010-9977-2905', '123-123', '주소', '세부주소', 5000, '카드', '없음', 0, sysdate, 'isj4216@gmail.com');
insert into orders values ('f', '나', '010-9977-2905', '123-123', '주소', '세부주소', 5000, '카드', '없음', 1, sysdate, 'isj4216@gmail.com');
insert into orders values ('ggg', '수취인', '010-9977-2905', '123-123', '주소', '세부주소', 5000, '카드', '없음', 1, '19901126', 'hwang3');
insert into orders values ('hhh', '수신인', '010-9977-2905', '123-123', '주소', '세부주소', 5000, '카드', '없음', 1, '19901126', 'hwang3');
insert into orders values ('iii', '이성준', '010-9977-2905', '123-123', '주소', '세부주소', 5000, '카드', '없음', 0, '19901126', 'hwang3');
insert into orders values ('jjj', '주변인', '010-9977-2905', '123-123', '주소', '세부주소', 5000, '카드', '없음', 0, '19901126', 'hwang3');
insert into orders values ('kkk', '너', '010-9977-2905', '123-123', '주소', '세부주소', 5000, '카드', '없음', 0, '19901126', 'hwang3');
insert into orders values ('lll', '나', '010-9977-2905', '123-123', '주소', '세부주소', 5000, '카드', '없음', 1, '19901126', 'hwang3');

DROP TABLE product_option 
	CASCADE CONSTRAINTS;
/* 상품옵션vvvvvvvv */
drop table product_option
CREATE TABLE product_option (
	option_id NUMBER primary key, /* 상품옵션ID */
	option_name VARCHAR2(30) NOT NULL, /* 옵션명 */
	option_sub_name VARCHAR2(60) NOT NULL, /* 세부 옵션명 */
	option_stock NUMBER(4) NOT NULL, /* 재고량 */
	option_add_price NUMBER(7) not null, /* 추가가격 */
	product_id VARCHAR2(30) NOT NULL, /* 상품ID */
	foreign key(product_id) references product(product_id) on delete cascade
);
drop sequence option_id_seq
create sequence option_id_seq nocache;

insert into product_option values (option_id_seq.nextval, '사이즈/색상', '250/흰색', 10, 0, '상품id135');
insert into product_option values (option_id_seq.nextval, '사이즈/색상', '240/검정색', 5, 0, '상품id134');
insert into product_option values (option_id_seq.nextval, '사이즈/색상', '230/흰색', 10, 0, '상품id133');
insert into product_option values (option_id_seq.nextval, '사이즈/색상', '220/흰색', 10, 0, '상품id133');
insert into product_option values (option_id_seq.nextval, '사이즈/색상', '210/검정색', 5, 0, '상품id133');
insert into product_option values (option_id_seq.nextval, '사이즈/색상', '260/흰색', 10, 2000, '상품id132');
insert into product_option values (option_id_seq.nextval, '사이즈/색상', '270/흰색', 10, 3000, '상품id132');

update 	product_option
set			option_stock = option_stock+2
where		option_id = 2

select * from PRODUCT_OPTION
/* 소식통(관리자) vvvvvvvv*/
CREATE TABLE notice (
	notice_no NUMBER primary key, /* 소식글 no */
	notice_title VARCHAR2(30) NOT NULL, /* 소식글 제목 */
	notice_content CLOB NOT NULL, /* 소식글 내용 */
	notice_date DATE NOT NULL, /* 소식글 작성일 */
	notice_hit NUMBER NOT NULL /* 소식글 조회수 */
);
drop sequence notice_no_seq
create sequence notice_no_seq nocache;

insert into notice values (notice_no_seq.nextval, '오픈 기념 소실글', '황당 플리마켓을 오픈하였습니다.', '20160621', 0);
insert into notice values (notice_no_seq.nextval, '오픈 할인 행사', '오픈 기념 할인 행사 이벤트를 진행할 예정입니다.', '20160622',0);
insert into notice values (notice_no_seq.nextval, '오픈 기념 소실글2', '황당 플리마켓을 오픈하였습니다.', '20160622', 0);
insert into notice values (notice_no_seq.nextval, '오픈 기념 소실글3', '황당 플리마켓을 오픈하였습니다.', '20160622', 0);
insert into notice values (notice_no_seq.nextval, '오픈 기념 소실글4', '황당 플리마켓을 오픈하였습니다.', '20160622', 0);
insert into notice values (notice_no_seq.nextval, '오픈 기념 소실글5', '황당 플리마켓을 오픈하였습니다.', '20160622', 0);
insert into notice values (notice_no_seq.nextval, '오픈 기념 소실글6', '황당 플리마켓을 오픈하였습니다.', '20160622', 0);
insert into notice values (notice_no_seq.nextval, '오픈 기념 소실글7', '황당 플리마켓을 오픈하였습니다.', '20160622', 0);
insert into notice values (notice_no_seq.nextval, '오픈 기념 소실글8', '황당 플리마켓을 오픈하였습니다.', '20160622', 0);
insert into notice values (notice_no_seq.nextval, '오픈 기념 소실글9', '황당 플리마켓을 오픈하였습니다.', '20160622', 0);

select * from notice

/* 관리자QnA vvvvvvv*/
CREATE TABLE admin_QnA (
	admin_qna_no NUMBER primary key, /* 관리자QnA no */
	admin_qna_title VARCHAR2(30) NOT NULL, /* 관리자QnA 제목 */
	admin_qna_content CLOB NOT NULL, /* 관리자QnA 내용 */
	admin_qna_writer VARCHAR2(30) NOT NULL, /* 관리자QnA 작성자id */
	admin_qna_date DATE NOT NULL, /* 관리자QnA 작성일 */
	admin_qna_hit NUMBER NOT NULL, /* 관리자QnA 조회수 */
	admin_qna_published VARCHAR2(3) NOT NULL /* 관리자QnA 공개여부 */
);

drop sequence admin_qna_no_seq
create sequence admin_qna_no_seq nocache;

INSERT INTO ADMIN_QNA  VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목1'  ,'임시글내용ABC1' ,'scott12','2015-02-12',0 , 't');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목2'  ,'임시글내용ABC12' ,'scott12','2015-02-11',0 , 't');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목3'  ,'임시글내용ABC123' ,'scott123','2015-02-04',0 , 'f');
INSERT INTO ADMIN_QNA VALUES(  admin_qna_no_seq.nextval ,'임시QnA제목4'  ,'임시글내용ABC1234' ,'scott124','2015-02-02',0 , 't');

-- 페이징처리 쿼리 테스트
SELECT 
admin_qna_no , 
	    admin_qna_title , 
	    admin_qna_content ,
		admin_qna_writer ,
		admin_qna_date ,
		admin_qna_hit ,
		admin_qna_published ,page
FROM (
SELECT  admin_qna_no , 
	    admin_qna_title , 
	    admin_qna_content ,
		admin_qna_writer ,
		admin_qna_date ,
		admin_qna_hit ,
		admin_qna_published  , 
		ceil(rownum / 10 ) page
FROM  ADMIN_QNA
ORDER BY  admin_qna_no DESC
)WHERE page = 3

/* 관리자QnA댓글 vvvvvvv*/
CREATE TABLE admin_QnA_reply (
	admin_reply_no NUMBER primary key, /* 댓글번호 */
	admin_reply_content varchar2(4000) NOT NULL, /* 내용 */
	admin_reply_date DATE NOT NULL, /* 작성일 */
	admin_reply_writer VARCHAR2(30) NOT NULL, /* 작성자 */
	admin_qna_no NUMBER not null, /* 관리자QnA no */
	foreign key(admin_qna_no) references admin_qna(admin_qna_no) on delete cascade
);



drop sequence admin_reply_no_seq
create sequence admin_reply_no_seq nocache;

/* 교환신청vvvvvvvvvv */
drop table exchange_request
CREATE TABLE exchange_request (
	exchage_title VARCHAR2(60) NOT NULL, /* 신청제목 */
	exchange_content VARCHAR2(4000) NOT NULL, /* 신청내용 */
	order_seq_no number not null, /* 주문번호 */
	foreign key(order_seq_no) references order_product(order_seq_no) on delete cascade
);

/* 환불신청vvvvvvvvvvvv */
drop table refund_request
CREATE TABLE refund_request (
	refund_title VARCHAR2(60) NOT NULL, /* 신청제목 */
	refund_content VARCHAR2(4000) NOT NULL, /* 신청내용 */
	order_seq_no number not null, /* 주문상품번호 */
	foreign key(order_seq_no) references order_product(order_seq_no) on delete cascade
);

/* 상품상세사진 vvvvvvv*/
CREATE TABLE product_detail_image (
	image_path VARCHAR2(90) NOT NULL, /* 이미지경로 */
	product_id VARCHAR2(30) not null, /* 상품ID */
	foreign key(product_id) references product(product_id) on delete cascade
);

insert into PRODUCT_DETAIL_IMAGE values ('nike/nike1/nike2', '상품id29')

/* 스토어QnA댓글 vvvvvv */
drop table store_QnA_reply
CREATE TABLE store_QnA_reply (
	store_reply_writer VARCHAR2(30) NOT NULL, /* 작성자 */
	store_reply_content varchar2(4000) NOT NULL, /* 내용 */
	store_reply_date DATE NOT NULL, /* 작성일 */
	storeQnA_no NUMBER primary key /* QnA번호 */,
	foreign key(storeQnA_no) references store_qna(storeQnA_no) on delete cascade
);
select member_id from seller where seller_store_no = 1

/* 주문상품 vvvvvvv*/
drop table order_product
CREATE TABLE order_product  (
	order_seq_no number primary key ,  -- PK 
	order_amount number(4) not null, /* 상품수량  */
	orders_no VARCHAR2(10) not null, /* 주문번호 FK */
	product_id VARCHAR2(30) not null, /* 상품ID FK */
	option_id number not null ,      --  상품옵션ID_FK  
	seller_store_no number not null,     -- 판매자스토어NO_FK
	order_product_status number(2) not null,
	foreign key(orders_no) references orders(orders_no) on delete cascade,
	foreign key(product_id) references product(product_id) on delete set null ,
	foreign key(option_id) references product_option(option_id) on delete set null ,
	foreign key(seller_store_no) references seller(seller_store_no) on delete set null
);
create sequence order_product_seq 
drop sequence order_seq_no_seq
create sequence order_seq_no_seq nocache;

select refund_title, refund_content, order_seq_no from refund_request


SELECT * FROM product_option;
SELECT * FROM order_product
insert into order_product values (order_seq_no_seq.nextval , 'order_no43', '상품id135', 7);
insert into order_product values (4, 'order_no37', '상품id134', 8);
insert into order_product values (1, 'order_no28', '상품id133', 9);
insert into order_product values (2, 'order_no13', '상품id132', 10);
insert into order_product values (1, 'order_no17', '상품id132', 11);
insert into order_product values (1, 'order_no43', '상품id133', 6);

insert into order_product values (order_seq_no_seq.nextval, 5, 'a', '상품id29', 2, 3, 1);
insert into order_product values (order_seq_no_seq.nextval, 2, 'a', '상품id34', 9, 3, 1);
insert into order_product values (order_seq_no_seq.nextval, 3, 'a', '상품id33', 8, 3, 1);
insert into order_product values (order_seq_no_seq.nextval, 1, 'a', '상품id33', 8, 3, 1);
insert into order_product values (order_seq_no_seq.nextval, 1, 'a', '상품id34', 3, 3, 1);
insert into order_product values (order_seq_no_seq.nextval, 1, 'a', '상품id34', 9, 3, 1);

select count(orders_no)
		from order_product
		where orders_no='a'
select orders_no from orders
		where member_id = 'isj4216'
		and payment_status = 1

select 	count(op.orders_no)
	from 		order_product op, orders o, product p 
	where		op.orders_no = o.orders_no
	and		op.product_id = p.product_id
	and		p.seller_store_no = 1
		
/* 코드 vvvvvvvv*/
CREATE TABLE code (
	code VARCHAR2(30) NOT NULL, /* 코드 */
	code_name VARCHAR2(30) NOT NULL /* 코드명 */
);

/* 카테고리 vvvvvvv*/
CREATE TABLE category (
	category_id NUMBER primary key, /* 카테고리아이디 */
	category_name VARCHAR2(30) NOT NULL, /* 카테고리명 */
	category_id_ref varchar2(30) NOT NULL, /* 참조아이디 */
	category_type VARCHAR2(6) NOT NULL /* 분류 */
);
drop sequence category_id_seq
create sequence category_id_seq nocache;
insert into category values (category_id_seq.nextval, '의류', '0', 'first');
insert into category values (category_id_seq.nextval, '공예', '0', 'first');
insert into category values (category_id_seq.nextval, '남성의류', '의류', 'second');
insert into category values (category_id_seq.nextval, '도자기', '공예', 'second');
insert into category values (category_id_seq.nextval, '여성의류', '의류', 'second');
insert into category values (category_id_seq.nextval, '팔찌', '공예', 'second');

select category_id, category_name, category_id_ref, category_type from category where category_id_ref = '의류'

select product_Id, product_name, product_price, product_stock, product_main_image, product_info, product_like, seller_store_no       
from (select ceil(rownum/6) page,        product_Id, product_name, product_price, product_stock, product_main_image, product_info, product_like, seller_store_no     
		from (select     product_Id, product_name, product_price, product_stock, product_main_image, product_info, product_like, seller_store_no         
				from product where seller_store_no=1
				order by product_like desc))   
where page = 7

select category_id, category_name, category_id_ref, category_type from category where category_type = 'first'

select count(product_id) from product where seller_store_no=1

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
drop table SELLER_NOTICE

delete SELLER_NOTICE where seller_notice_no = 12

select * from SELLER_NOTICE

drop sequence seller_notice_no_seq
create sequence seller_notice_no_seq nocache;

insert into seller_notice values(seller_notice_no_seq.nextval,'aaa','aaa',sysdate,0,1)



select 
		orders_no, orders_receiver, orders_phone, orders_zipcode, orders_address, orders_sub_address,
		orders_total_price, orders_payment, orders_request, payment_status, orders_status, member_id,
		product_Id, product_name, product_price, product_stock, product_main_image, 
		product_info, product_like, seller_store_no,
		order_amount, op_orders_no, op_product_id, option_id, order_product_status
from		(select ceil(rownum/6) page, orders_no, orders_receiver, orders_phone, orders_zipcode, orders_address, orders_sub_address,
		orders_total_price, orders_payment, orders_request, payment_status, orders_status, member_id,
		product_Id, product_name, product_price, product_stock, product_main_image, 
		product_info, product_like, seller_store_no,
		order_amount, op_orders_no, op_product_id, option_id, order_product_status
			from	(select o.orders_no, o.orders_receiver, o.orders_phone, o.orders_zipcode, o.orders_address, o.orders_sub_address,
		o.orders_total_price, o.orders_payment, o.orders_request, o.payment_status, o.orders_status, o.member_id,
		p.product_Id, p.product_name, p.product_price, p.product_stock, p.product_main_image, 
		p.product_info, p.product_like, p.seller_store_no,
		op.order_amount, op.orders_no as op_orders_no, op.product_id as op_product_id, op.option_id, op.order_product_status
					from 		orders o, product p, order_product op 
					where 	o.orders_no = op.orders_no
					and	 	op.product_id = p.product_id
					and		op.seller_store_no = 1 order by op.orders_no desc))
where		page = 1

select 	count(op.orders_no)
		from 		order_product op, orders o, product p 
		where		op.orders_no = o.orders_no
		and		op.product_id = p.product_id
		and		op.seller_store_no = 1

select 	count(op.orders_no)
		from 		order_product op, orders o, product p 
		where		op.orders_no = o.orders_no
		and		op.product_id = p.product_id

		and		op.seller_store_no = 1
		

		and		op.seller_store_no = 1

select orders_no from orders
where member_id = 'isj4216'
and payment_status = 1

select count(orders_no)
from order_product
where orders_no='aaa'
and	product_id='상품id29'


select * FROM product_detail_image;


INSERT INTO  product_detail_image
values (  '1466996325514김준현.jpg' , '상품id1')
INSERT INTO  product_detail_image
values (  '1466996488095alo.jpeg' , '상품id1')
INSERT INTO  product_detail_image
values (  '1467440050871nike.jpg' , '상품id1')
INSERT INTO  product_detail_image
values (  '1466996325514김준현.jpg' , '상품id2')
INSERT INTO  product_detail_image
values (  '1467159669150apple.jpg' , '상품id2')


INSERT INTO  product_detail_image
values (  '1466996325514김준현.jpg' , '상품id3');
INSERT INTO  product_detail_image
values (  '1467159669150apple.jpg' , '상품id3');


INSERT INTO  product_detail_image
values (  '1466996325514김준현.jpg' , '상품id4');
INSERT INTO  product_detail_image
values (  '1467159669150apple.jpg' , '상품id5');

INSERT INTO  product_detail_image
values (  '1466996325514김준현.jpg' , '상품id6');
INSERT INTO  product_detail_image
values (  '1467159669150apple.jpg' , '상품id7');


select * from all_constraints where table_name='PRODUCT_OPTION';

select product_id from cart where member_id = 'hwang1@gmail.com'