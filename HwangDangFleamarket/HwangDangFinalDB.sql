/* 회원 */
DROP TABLE member 
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

/* 판매자 공지사항 */
DROP TABLE seller_notice 
	CASCADE CONSTRAINTS;

/* 우편번호 */
DROP TABLE zipcode 
	CASCADE CONSTRAINTS;

/* 회원 */
CREATE TABLE member (
	member_id VARCHAR2(30) PRIMARY KEY, /* 아이디 */
	member_password VARCHAR2(20) NOT NULL, /* 비밀번호 */
	member_name VARCHAR2(18) NOT NULL, /* 이름 */
	member_phone CHAR(13) NOT NULL, /* 전화번호 */
	member_zipcode VARCHAR2(7) NOT NULL, /* 우편번호 */
	member_address VARCHAR2(180) NOT NULL, /* 주소 */
	member_sub_adress VARCHAR2(90) NOT NULL, /* 세부주소 */
	member_assign NUMBER(1) NOT NULL, /* 판매자등록여부 */
	member_mileage NUMBER /* 마일리지 */
);

/* 판매자 */
CREATE TABLE seller (
	seller_store_no NUMBER PRIMARY KEY, /* 스토어넘버 */
	seller_store_name VARCHAR2(60) unique NOT NULL, /* 상호명 */
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
	seller_introduction CLOB NOT NULL, /* 소개글 */
	seller_assign NUMBER(1) NOT NULL, /* 승인여부 */
	member_id VARCHAR2(30) NOT NULL, /* 아이디 */
	FOREIGN KEY(member_id) REFERENCES member(member_id) ON DELETE CASCADE
);

/* 상품 */
CREATE TABLE product (
	product_id VARCHAR2(30) PRIMARY KEY, /* 상품ID */
	product_name VARCHAR2(30) NOT NULL, /* 상품명 */
	product_price NUMBER(7) NOT NULL, /* 가격 */
	product_stock NUMBER(4) NOT NULL, /* 재고량 */
	product_main_image VARCHAR2(90) NOT NULL, /* 상품메인사진 */
	product_info CLOB NOT NULL, /* 상품정보 */
	product_like NUMBER NOT NULL, /* 추천수 */
	seller_store_no NUMBER NOT NULL,  /* 스토어넘버 */
	FOREIGN KEY(seller_store_no) REFERENCES seller(seller_store_no) ON DELETE CASCADE
);

/* 리뷰 */
CREATE TABLE review (
	review_no NUMBER PRIMARY KEY, /* 리뷰번호 */
	review_content VARCHAR2(60) NOT NULL, /* 리뷰 내용 */
	review_date DATE NOT NULL, /* 작성일 */
	review_writer VARCHAR2(30) NOT NULL, /* 작성자 */
	product_id VARCHAR2(30) NOT NULL, /* 상품ID */
	FOREIGN KEY(product_id) REFERENCES product(product_id) ON DELETE CASCADE
);

/* 스토어QnA */
CREATE TABLE store_QnA (
	storeQnA_no NUMBER PRIMARY KEY, /* QnA번호 */
	storeQnA_title VARCHAR2(30) NOT NULL, /* 문의 제목 */
	storeQnA_content CLOB NOT NULL, /* 문의 내용 */
	storeQnA_hit NUMBER NOT NULL, /* 문의 조회수 */
	storeQnA_published NUMBER(1) NOT NULL, /* 문의 공개 여부 */
	storeQnA_writer VARCHAR2(30) NOT NULL, /* 문의 작성자 */
	storeQnA_date DATE NOT NULL, /* 문의 작성일 */
	product_id VARCHAR2(30) NOT NULL, /* 상품ID */
	FOREIGN KEY(product_id) REFERENCES product(product_id) ON DELETE CASCADE
);

/* 장바구니 */
CREATE TABLE cart (
	cart_no NUMBER PRIMARY KEY, /* 장바구니 상품 번호 */
	cart_product_amount NUMBER(4) NOT NULL, /* 장바구니 상품 수량 */
	cart_product_option VARCHAR2(100) NOT NULL, /* 장바구니 선택 옵션 */
	product_id VARCHAR2(30) NOT NULL, /* 상품ID */
	member_id VARCHAR2(30) NOT NULL, /* 아이디 */
	option_id NUMBER NOT NULL, /* 상품 옵션ID */
	FOREIGN KEY(product_id) REFERENCES product(product_id),
	FOREIGN KEY(member_id) REFERENCES member(member_id),
	FOREIGN KEY(option_id) REFERENCES product_option(option_id)
);

/* 주문 */
CREATE TABLE orders (
	orders_no VARCHAR2(10) PRIMARY KEY, /* 주문번호 */
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
	member_id VARCHAR2(30) NOT NULL, /* 아이디 */
	FOREIGN KEY(member_id) REFERENCES member(member_id)
);

/* 상품옵션 */
CREATE TABLE product_option (
	option_id NUMBER PRIMARY KEY, /* 상품옵션ID */
	option_name VARCHAR2(30) NOT NULL, /* 옵션명 */
	option_sub_name VARCHAR2(60) NOT NULL, /* 세부 옵션 */
	option_stock NUMBER(4) NOT NULL, /* 재고량 */
	option_add_price NUMBER(7) NOT NULL, /* 추가가격 */
	product_id VARCHAR2(30) NOT NULL, /* 상품ID */
	FOREIGN KEY(product_id) REFERENCES product(product_id) ON DELETE CASCADE
);

/* 소식통(관리자) */
CREATE TABLE notice (
	notice_no NUMBER NOT NULL, /* 소식글 no */
	notice_title VARCHAR2(30) NOT NULL, /* 소식글 제목 */
	notice_content CLOB NOT NULL, /* 소식글 내용 */
	notice_date DATE NOT NULL, /* 소식글 작성일 */
	notice_hit NUMBER NOT NULL /* 소식글 조회수 */
);

/* 관리자QnA */
CREATE TABLE admin_QnA (
	admin_qna_no NUMBER PRIMARY KEY, /* 관리자QnA no */
	admin_qna_title VARCHAR2(30) NOT NULL, /* 관리자QnA 제목 */
	admin_qna_content CLOB NOT NULL, /* 관리자QnA 내용 */
	admin_qna_writer VARCHAR2(30) NOT NULL, /* 관리자QnA 작성자id */
	admin_qna_date DATE NOT NULL, /* 관리자QnA 작성일 */
	admin_qna_hit NUMBER NOT NULL, /* 관리자QnA 조회수 */
	admin_qna_published NUMBER(1) NOT NULL, /* 관리자QnA 공개여부 */
	admin_qna_password CHAR(4), /* 관리자QnA비밀번호 */
	admin_qna_reply_exist CHAR(1) /* 댓글존재여부 */
);

/* 관리자QnA댓글 */
CREATE TABLE admin_QnA_reply (
	admin_reply_no NUMBER NOT NULL, /* 댓글번호 */
	admin_reply_content CLOB NOT NULL, /* 내용 */
	admin_reply_date DATE NOT NULL, /* 작성일 */
	admin_reply_writer VARCHAR2(30) NOT NULL, /* 작성자 */
	admin_qna_no NUMBER NOT NULL, /* 관리자QnA no */
	FOREIGN KEY(admin_qna_no) REFERENCES admin_qna(admin_qna_no) ON DELETE CASCADE
);

/* 교환신청 */
CREATE TABLE exchange_request (
	exchage_title VARCHAR2(60) NOT NULL, /* 신청제목 */
	exchange_content CLOB NOT NULL, /* 신청내용 */
	order_seq_no NUMBER NOT NULL, /* 주문상품번호 */
	FOREIGN KEY(order_seq_no) REFERENCES order_product(order_seq_no) ON DELETE CASCADE
);

/* 환불신청 */
CREATE TABLE refund_request (
	refund_title VARCHAR2(60) NOT NULL, /* 신청제목 */
	refund_content CLOB NOT NULL, /* 신청내용 */
	order_seq_no NUMBER NOT NULL, /* 주문상품번호 */
	FOREIGN KEY(order_seq_no) REFERENCES order_product(order_seq_no) ON DELETE CASCADE
);

/* 상품상세사진 */
CREATE TABLE product_detail_image (
	image_path CLOB NOT NULL, /* 이미지경로 */
	product_id VARCHAR2(30) NOT NULL, /* 상품ID */
	FOREIGN KEY(product_id) REFERENCES product(product_id) ON DELETE CASCADE
);

/* 스토어QnA댓글 */
CREATE TABLE store_QnA_reply (
	store_reply_writer VARCHAR2(30) NOT NULL, /* 작성자 */
	store_reply_content CLOB NOT NULL, /* 내용 */
	store_reply_date DATE NOT NULL, /* 작성일 */
	storeQnA_no NUMBER NOT NULL /* QnA번호 */
);

/* 주문상품 */
CREATE TABLE order_product (
	order_seq_no NUMBER PRIMARY KEY, /* 주문상품번호 */
	order_amount NUMBER(4) NOT NULL, /* 주문상품수량 */
	order_product_status NUMBER(2) NOT NULL, /* 주문상품상태 */
	orders_no VARCHAR2(10) NOT NULL, /* 주문번호 */
	product_id VARCHAR2(30) NOT NULL, /* 상품ID */
	option_id NUMBER NOT NULL, /* 상품옵션ID */
	seller_store_no NUMBER NOT NULL, /* 스토어넘버 */
	FOREIGN KEY(orders_no) REFERENCES orders(orders_no) ON DELETE CASCADE,
	FOREIGN KEY(product_id) REFERENCES product(product_id) ON DELETE SET NULL,
	FOREIGN KEY(option_id) REFERENCES product_option(option_id) ON DELETE SET NULL,
	FOREIGN KEY(seller_store_no) REFERENCES seller(seller_store_no) ON DELETE SET NULL
);

/* 코드 */
CREATE TABLE code (
	code VARCHAR2(30) NOT NULL, /* 코드 */
	code_name VARCHAR2(30) NOT NULL /* 코드명 */
);

/* 카테고리 */
CREATE TABLE category (
	category_id NUMBER NOT NULL, /* 카테고리아이디 */
	category_name VARCHAR2(30) NOT NULL, /* 카테고리명 */
	category_id_ref NUMBER NOT NULL, /* 참조아이디 */
	category_type VARCHAR2(6) NOT NULL /* 분류 */
);

/* 판매자 공지사항 */
CREATE TABLE seller_notice (
	seller_notice_no NUMBER NOT NULL, /* 판매자 소식글 번호 */
	seller_notice_title VARCHAR2(300) NOT NULL, /* 새 컬럼 */
	seller_notice_content CLOB NOT NULL, /* 새 컬럼2 */
	seller_notice_date DATE NOT NULL, /* 새 컬럼3 */
	seller_notice_hit NUMBER NOT NULL, /* 새 컬럼4 */
	seller_store_no NUMBER NOT NULL, /* 스토어넘버 */
	FOREIGN KEY(seller_store_no) REFERENCES seller(seller_store_no) ON DELETE SET NULL
);

/* 우편번호 */
CREATE TABLE zipcode (
	seq NUMBER(10) NOT NULL, /* 번호 */
	zipcode VARCHAR2(50), /* 우편번호 */
	sido VARCHAR2(50), /* 시도 */
	gugun VARCHAR2(50), /* 구군 */
	dong VARCHAR2(50), /* 동 */
	bunji VARCHAR2(50) /* 번지 */
);

/*수정 사항*/
/*사업자번호 000-00-00000*/
ALTER TABLE seller MODIFY (seller_tax_id CHAR(12));
/*교환테이블*/
ALTER TABLE exchange_request rename column exchage_title to exchange_title;
ALTER TABLE exchange_request ADD exchange_stock NUMBER(4);
ALTER TABLE exchange_request ADD option_id NUMBER;
ALTER TABLE exchange_request ADD FOREIGN KEY (option_id) REFERENCES product_option(option_id)
ON DELETE SET NULL;
