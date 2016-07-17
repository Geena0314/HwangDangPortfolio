/* 게시판 */
CREATE TABLE notice_board (
	NUM NUMBER(10) NOT NULL, /* 번호 */
	TITLE VARCHAR2(100), /* 제목 */
	R_DATE DATE, /* 공지일 */
	HIT NUMBER(10), /* 조회수 */
	CONTENT VARCHAR2(800), /* 내용 */
	CATEGORY VARCHAR2(10) /* 말머리 */
);

/* 코드 */
CREATE TABLE CODE (
	CODE VARCHAR2(10) NOT NULL, /* 코드 */
	CODE_TYPE VARCHAR2(10) NOT NULL /* 코드타입 */
);

/* 회원 */
CREATE TABLE member (
	member_id VARCHAR2(30) NOT NULL, /* 아이디 */
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
	seller_store_no NUMBER NOT NULL, /* 스토어넘버 */
	seller_store_name VARCHAR2(60) DEFAULT unique NOT NULL, /* 상호명 */
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
	seller_assign NUMBER(1) NOT NULL, /* 승인여부 */
	member_id VARCHAR2(30) /* 아이디 */
);

/* 상품 */
CREATE TABLE product (
	product_id VARCHAR2(30) NOT NULL, /* 상품ID */
	product_name VARCHAR2(30) NOT NULL, /* 상품명 */
	product_price NUMBER(7) NOT NULL, /* 가격 */
	product_stock NUMBER(4) NOT NULL, /* 재고량 */
	product_main_image VARCHAR2(90) NOT NULL, /* 상품메인사진 */
	product_info CLOB NOT NULL, /* 상품정보 */
	product_like NUMBER NOT NULL, /* 추천수 */
	seller_store_no NUMBER NOT NULL /* 스토어넘버 */
);

/* 리뷰 */
CREATE TABLE review (
	review_no NUMBER NOT NULL, /* 리뷰번호 */
	review_content VARCHAR2(60) NOT NULL, /* 리뷰 내용 */
	review_date DATE NOT NULL, /* 작성일 */
	review_writer VARCHAR2(30) NOT NULL, /* 작성자 */
	product_id VARCHAR2(30) NOT NULL /* 상품ID */
);

/* 스토어QnA */
CREATE TABLE store_QnA (
	storeQnA_no NUMBER NOT NULL, /* QnA번호 */
	storeQnA_title VARCHAR2(30) NOT NULL, /* 문의 제목 */
	storeQnA_content VARCHAR2(4000) DEFAULT 
 NOT NULL, /* 문의 내용 */
	storeQnA_hit NUMBER NOT NULL, /* 문의 조회수 */
	storeQnA_published NUMBER(1) NOT NULL, /* 문의 공개 여부 */
	storeQnA_writer VARCHAR2(30) NOT NULL, /* 문의 작성자 */
	storeQnA_date DATE NOT NULL, /* 문의 작성일 */
	product_id VARCHAR2(30) NOT NULL /* 상품ID */
);

/* 장바구니 */
CREATE TABLE cart (
	cart_no NUMBER NOT NULL, /* 장바구니 번호 */
	cart_product_amount NUMBER(4) NOT NULL, /* 장바구니 상품수량 */
	cart_product_option VARCHAR2(100) NOT NULL, /* 장바구니 선택옵션 */
	product_id VARCHAR2(30) NOT NULL, /* 상품ID */
	member_id VARCHAR2(30) NOT NULL, /* 아이디 */
	option_id NUMBER /* 상품옵션ID */
);

/* 주문 */
CREATE TABLE orders (
	orders_no VARCHAR2(10) NOT NULL, /* 주문번호 */
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
	member_id VARCHAR2(30) NOT NULL /* 아이디 */
);

/* 상품옵션 */
CREATE TABLE product_option (
	option_id NUMBER NOT NULL, /* 상품옵션ID */
	option_name VARCHAR2(30) NOT NULL, /* 옵션명 */
	option_sub_name VARCHAR2(60) NOT NULL, /* 세부 옵션 */
	option_stock NUMBER(4) NOT NULL, /* 재고량 */
	option_add_price NUMBER(7) NOT NULL, /* 추가가격 */
	product_id VARCHAR2(30) NOT NULL /* 상품ID */
);

/* 카드결제 */
CREATE TABLE pay_card (
	pay_card_no VARCHAR2(19) NOT NULL, /* 카드번호 */
	pay_card_company VARCHAR2(21) NOT NULL, /* 카드사 */
	orders_no VARCHAR2(10) NOT NULL /* 주문번호 */
);

/* 실시간 계좌 이체 */
CREATE TABLE pay_account_transfer (
	pay_account_transfer_account_holder VARCHAR2(18) NOT NULL, /* 예금주 */
	pay_account_transfer_bank VARCHAR2(21) NOT NULL, /* 은행 */
	orders_no VARCHAR2(10) /* 주문번호 */
);

/* 카카오 페이 */
CREATE TABLE pay_kakao (
	pay_kakao_id VARCHAR2(30) NOT NULL, /* 카카오ID */
	pay_kakao_pw VARCHAR2(20) NOT NULL, /* 카카오PW */
	pay_kakao_payment_pw NUMBER(7) NOT NULL, /* 결제비밀번호 */
	orders_no VARCHAR2(10) /* 주문번호 */
);

/* 무통장입금 */
CREATE TABLE pay_virtual_account (
	pay_virtual_account_virtual_account_ VARCHAR2(20) NOT NULL, /* 계좌 번호 */
	pay_virtual_account_account_holder VARCHAR2(18) NOT NULL, /* 예금주 */
	pay_virtual_account_bank VARCHAR2(21) NOT NULL, /* 은행명 */
	orders_no VARCHAR2(10) /* 주문번호 */
);

/* 배송현황 */
CREATE TABLE delivery_status (
	delivery_id VARCHAR2(10) NOT NULL, /* 배송id */
	delivery_status VARCHAR2(15) NOT NULL, /* 상태 */
	delivery_decision number(1) NOT NULL, /* 구매확정 */
	delivery_request_status number(1) NOT NULL, /* 요청현황 */
	delivery_order_no VARCHAR2(10) NOT NULL, /* 주문번호 */
	delivery_category varchar(12), /* 카테고리 */
	delivery_title VARCHAR2(30), /* 신청제목 */
	delivery_content varchar2(4000), /* 내용 */
	id <지정 되지 않음> /* id */
);

/* 환불/교환 */
CREATE TABLE TABLE2 (
	COL <지정 되지 않음>, /* 처리상태 */
	delivery_id VARCHAR2(10) /* 배송id */
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
	admin_qna_no NUMBER NOT NULL, /* 관리자QnA no */
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
	admin_reply_content varchar2(4000) NOT NULL, /* 내용 */
	admin_reply_date DATE NOT NULL, /* 작성일 */
	admin_reply_writer VARCHAR2(30) NOT NULL, /* 작성자 */
	admin_qna_no NUMBER NOT NULL /* 관리자QnA no */
);

/* 교환신청 */
CREATE TABLE exchange_request (
	exchage_title VARCHAR2(60) NOT NULL, /* 신청제목 */
	exchange_content VARCHAR2(4000) NOT NULL, /* 신청내용 */
	order_seq_no NUMBER NOT NULL /* 주문상품번호 */
);

/* 환불 */
CREATE TABLE TABLE (
);

/* 환불신청 */
CREATE TABLE refund_request (
	refund_title VARCHAR2(60) NOT NULL, /* 신청제목 */
	refund_content VARCHAR2(4000) NOT NULL, /* 신청내용 */
	order_seq_no NUMBER NOT NULL /* 주문상품번호 */
);

/* 상품상세사진 */
CREATE TABLE product_detail_image (
	image_path VARCHAR2(4000) NOT NULL, /* 이미지경로 */
	product_id VARCHAR2(30) NOT NULL /* 상품ID */
);

/* 스토어QnA댓글 */
CREATE TABLE store_QnA_reply (
	store_reply_writer VARCHAR2(30) NOT NULL, /* 작성자 */
	store_reply_content varchar2(4000) NOT NULL, /* 내용 */
	store_reply_date DATE NOT NULL, /* 작성일 */
	storeQnA_no NUMBER NOT NULL /* QnA번호 */
);

/* 주문상품 */
CREATE TABLE order_product (
	order_seq_no NUMBER NOT NULL, /* 주문상품번호 */
	order_amount NUMBER(4) NOT NULL, /* 주문상품수량 */
	order_product_status NUMBER(2) NOT NULL, /* 주문상품상태 */
	orders_no VARCHAR2(10) NOT NULL, /* 주문번호 */
	product_id VARCHAR2(30) NOT NULL, /* 상품ID */
	option_id NUMBER NOT NULL, /* 상품옵션ID */
	seller_store_no NUMBER /* 스토어넘버 */
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

/* seller_notice */
CREATE TABLE 판매자 공지사항 (
	seller_notice_no <지정 되지 않음> NOT NULL, /* 판매자 소식글 번호 */
	seller_notice_title VARCHAR2(300) NOT NULL, /* 새 컬럼 */
	seller_notice_content CLOB NOT NULL, /* 새 컬럼2 */
	seller_notice_date DATE NOT NULL, /* 새 컬럼3 */
	seller_notice_hit NUMBER NOT NULL, /* 새 컬럼4 */
	seller_store_no NUMBER NOT NULL /* 스토어넘버 */
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