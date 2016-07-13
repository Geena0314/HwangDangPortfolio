

--일반회원 INSERT : Member TB

insert into member values ('member1@gmail.com', '12341234', '김회원', '010-9411-3222', '123-456',
   										'경기도 성남시 분당구 야탑동', '노블리치오피스텔 B동 313호', 0 , 1000);
insert into member values ('member2@gmail.com', '12341234', '박회원', '010-9417-2525', '112-112',
   										   '서울시 강남구 역삼동', '안드로아파트 101동 8층', 0,2000); 
insert into member values ('member3@gmail.com', '12341234' , '유회원', '010-9911-2405', '111-476',
   										   '경기도 수원시 팔달구', '유스페이스 B동 7층', 0, 5000);
   										   
 
-- 셀러회원 INSERT : Member TB 
insert into member values ('seller1@gmail.com', '12341234', '김판매자', '010-9411-3222', '123-456',
   										'경기도 성남시 분당구 야탑동', '노블리치오피스텔 B동 313호', 1 , 1110);
insert into member values ('seller2@gmail.com', '12341234', '이셀러', '010-9417-2525', '112-112',
   										   '서울시 강남구 역삼동', '안드로아파트 101동 8층', 1,2000); 
insert into member values ('seller3@gmail.com', '12341234' , '홍판매원', '010-9911-2405', '111-476',
   										   '경기도 수원시 팔달구', '유스페이스 B동 7층', 1, 5000);
   			
 --셀러정보  INSERT :seller TB   극동 6 / 꿈꾸는 8 , 마켓어스 9
insert into seller 
values(seller_store_no_seq.nextval, '극동시장', '12345-67890', '생활용품', '가정용품', '123-456', 
							'경기도 성남시 분당구 야탑동.', '노블리치오피스텔 B동 313호', '극동시장대표사진.jpg', '딸기쨈', '방향제', '비누', 
							'생활용품을 팝니다. 직접만든 핸드메이드 방향제 와 비누 싱싱한 원료로 만든 딸기쨈을 팝니다',1 ,'seller1@gmail.com');

insert into seller 
values(seller_store_no_seq.nextval, '꿈꾸는마켓', '13415-66789', '사치품', '악세사리', '123-654', 
							'경기도 성남시 분당구 삼평동.', '유스페이스 B동 313호', '꿈꾸는마켓 대표사진.jpg', '시계', '귀걸이', '주머니', 
							'튼튼하고 정확한 시계와 핸드메이드 귀걸이를 팝니다. 직접 제작한 저렴한 주머니도 팝니다.',1, 'seller2@gmail.com');
							
insert into seller 
values(seller_store_no_seq.nextval, '마켓어스', '12345-66789', '공산품', '문구류', '123-654', 
							'경기도 성남시 분당구 삼평동.', '유스페이스 B동 313호', '마켓어스대표사진.jpg', '수제인형', '장난감', '털가방', 
							'40년 장인이 만든장난감 털가방 수제인형 팝니다.',1 , 'seller3@gmail.com'); 
							
 
--  판매할 상품 INSERT    ,  FK  극동 20 / 꿈꾸는 21 , 마켓어스 22					
insert into product values ('productno100', '싱싱한딸기잼', 5000, 10, '딸기쨈대표사진.jpg', '맛조은딸기쨈', 90, 20);
insert into product values ('productno200', '핸드메이드방향제', 25000, 20, '방향제대표사진.jpg', '냄새엔 천연방향제', 310, 20);
insert into product values ('productno300', '천연비누', 1500, 20, '비누대표사진.jpg', '천연재료로만든 비누', 222, 20);


insert into product values ('productno400', '편안한귀걸이', 5000, 30, '귀걸이메인사진.jpg', '이쁘고 편안합니다.', 16, 21);
insert into product values ('productno500', '정확한시계', 30000, 40, '시계메인사진.jpg', '최고로 정확합니다.', 347, 21);
insert into product values ('productno600', '아름다운주머니', 15000, 20, '주머니대표img.jpg', '디자인이 아름답습니다.', 142, 21);

insert into product values ('productno700', '재미난 인형', 5000, 60, '털가방메인사진.jpg', '귀여운 인형', 111, 22);
insert into product values ('productno800', '즐거운 장난감', 10000, 20, '장난감대표사진.jpg', '조이조이 장남감', 913, 22);
insert into product values ('productno900', '복실복실 털가방', 20000, 20, '인형대표사진.jpg', '겨울용 털가방', 441, 22);
												


-- 상품옵션 INSERT productno100
insert into product_option
values (option_id_seq.nextval, '용량/잼종류', '250g/딸기', 4, 0, 'productno100');
insert into product_option 
values (option_id_seq.nextval, '용량/잼종류', '250g/사과', 3, 3000, 'productno100');
insert into product_option 
values (option_id_seq.nextval, '용량/잼종류', '250g/한라봉', 3, 8000, 'productno100');
-- 상품옵션 INSERT productno200
insert into product_option 
values (option_id_seq.nextval, '사이즈/색상', '100/흰색', 10,  500, 'productno200');
insert into product_option 
values (option_id_seq.nextval, '사이즈/색상', '100/검정색', 5, 2000, 'productno200');
insert into product_option 
values (option_id_seq.nextval, '사이즈/색상', '100/은색', 5, 3000, 'productno200');
-- 상품옵션 INSERT productno300
insert into product_option 
values (option_id_seq.nextval, '용량/성분', '100g/아로마', 10, 0, 'productno300');
insert into product_option 
values (option_id_seq.nextval, '용량/성분', '150g/아로마', 5, 500, 'productno300');
insert into product_option 
values (option_id_seq.nextval, '용량/성분', '180g/아로마', 5, 1000, 'productno300');


-- 상품옵션 INSERT productno400
insert into product_option
values (option_id_seq.nextval, '종류', '실버', 3, 5000, 'productno400');
insert into product_option 
values (option_id_seq.nextval, '종류', '18K', 3, 25000, 'productno400');
insert into product_option 
values (option_id_seq.nextval, '종류', '백금', 4, 30000, 'productno400');
-- 상품옵션 INSERT productno500
insert into product_option 
values (option_id_seq.nextval, '종류', '은메탈', 10, 5000, 'productno500');
insert into product_option 
values (option_id_seq.nextval, '종류', '소가죽', 10, 3000, 'productno500');
insert into product_option 
values (option_id_seq.nextval, '종류', '말가죽', 20, 8000, 'productno500');
-- 상품옵션 INSERT productno600
insert into product_option 
values (option_id_seq.nextval, '색상/크기', '핑크/100', 10, 0, 'productno600');
insert into product_option 
values (option_id_seq.nextval, '색상/크기', '블루/150', 5, 500, 'productno600');
insert into product_option 
values (option_id_seq.nextval, '색상/크기', '그린/200', 5, 1000, 'productno600');


-- 상품옵션 INSERT productno700
insert into product_option
values (option_id_seq.nextval, '생산년도', '2011', 20, 0, 'productno700');
insert into product_option 
values (option_id_seq.nextval, '생산년도', '2013', 20, 3000, 'productno700');
insert into product_option 
values (option_id_seq.nextval, '생산년도', '2016', 20, 5000, 'productno700');
-- 상품옵션 INSERT productno800
insert into product_option 
values (option_id_seq.nextval, '넓이/높이', '10cm/5cm', 20,  2500, 'productno800');
insert into product_option
values (option_id_seq.nextval,  '넓이/높이', '20cm/15cm', 10, 6000, 'productno800');
insert into product_option 
values (option_id_seq.nextval,  '넓이/높이', '30cm/25cm', 10, 9000, 'productno800');
-- 상품옵션 INSERT productno900
insert into product_option 
values (option_id_seq.nextval, '실종류', '일반실', 10, 0, 'productno900');
insert into product_option 
values (option_id_seq.nextval, '실종류', '고급실', 5, 500, 'productno900');
insert into product_option 
values (option_id_seq.nextval, '실종류', '최고급실', 5, 1000, 'productno900');



-- 상품상세자진
insert into PRODUCT_DETAIL_IMAGE values ('딸기잼세부사진.jpg', 'productno100');
insert into PRODUCT_DETAIL_IMAGE values ('방향제세부사진.jpg', 'productno200');
insert into PRODUCT_DETAIL_IMAGE values ('비누세부사진.jpg', 'productno300');
insert into PRODUCT_DETAIL_IMAGE values ('귀걸이세부사진.jpg', 'productno400');
insert into PRODUCT_DETAIL_IMAGE values ('시계세부사진.jpg', 'productno500');
insert into PRODUCT_DETAIL_IMAGE values ('주머니세부사진.jpg', 'productno600');

insert into PRODUCT_DETAIL_IMAGE values ('털가방상세사진.jpg', 'productno700');
insert into PRODUCT_DETAIL_IMAGE values ('장난감세부사진.jpg', 'productno800');
insert into PRODUCT_DETAIL_IMAGE values ('인형2세부사진.jpg', 'productno900');
  


--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
--**********************************************************************
-- 장난감 상품 추가                                                                                                                                                            극동storeNO 등록바람
insert into product values ('productno911', '어니언 장난감', 5000, 30, '어니언메인사진.jpg', '어니언케릭터입니다.', 50, 1);
insert into product_option 
values (option_id_seq.nextval, '넓이/높이', '10cm/5cm', 20,  2500, 'productno911');
insert into product_option
values (option_id_seq.nextval,  '넓이/높이', '20cm/15cm', 10, 6000, 'productno911');
insert into product_option 
values (option_id_seq.nextval,  '넓이/높이', '30cm/25cm', 10, 9000, 'productno911');
insert into PRODUCT_DETAIL_IMAGE values ('어니언 세부사진.jpg', 'productno911');


--꿈꾸는 스토어 등록 
insert into product values ('productno912', '동물장난감', 10000, 0, '동물장난감메인.jpg', '조이조이 장남감', 901, 2);
insert into product_option 
values (option_id_seq.nextval, '넓이/높이', '10cm/5cm', 0,  1500, 'productno912');
insert into product_option
values (option_id_seq.nextval,  '넓이/높이', '20cm/15cm', 0, 3000, 'productno912');
insert into product_option 
values (option_id_seq.nextval,  '넓이/높이', '30cm/25cm', 0, 5000, 'productno912');


insert into PRODUCT_DETAIL_IMAGE values ('동물장난감세부사진.jpg', 'productno912');
  


   										   