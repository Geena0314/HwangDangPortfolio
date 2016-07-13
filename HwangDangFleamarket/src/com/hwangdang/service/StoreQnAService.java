package com.hwangdang.service;

import com.hwangdang.vo.StoreQnA;

public interface StoreQnAService
{
	//스토어 QnA 등록.
	int insertStoreQnA(StoreQnA qna);
	
	//스토어 QnA 공개여부.
	int selectQnAPublished(int storeQnANo);
	
	//스토어번호로 판매자id조회.
	String selectSellerByNo(int sellerStoreNo);
	
	//스토어QnA번호로 작성자 조회.
	String selectQnAWriterByNo(int storeQnANo);
	
	//스토어QnA번호로 삭제.
	int deleteQnAByno(int storeQnANo);
}
