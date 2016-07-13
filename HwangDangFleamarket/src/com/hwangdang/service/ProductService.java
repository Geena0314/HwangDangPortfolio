package com.hwangdang.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.hwangdang.vo.Category;
import com.hwangdang.vo.Product;
import com.hwangdang.vo.ProductDetailImage;
import com.hwangdang.vo.ProductOption;
import com.hwangdang.vo.StoreQnA;

public interface ProductService 
{
	//상품 리스트 조회. 페이징 처리.
	HashMap<String, Object> selectAllProduct(int page, int sellerStoreNo);
	
	//상품 상세정보 조회. 아이디로.
	HashMap<String, Object> selectProductDetailById(int page, String productId, int sellerStoreNo);
	
	//옵션세부내용으로 재고량과 추가가격 조회.(상품명도 가져가야함.)
	ProductOption selectOptionStockByName(String optionName, String productId);
	
	//리뷰 페이징.
	HashMap<String, Object> selectReviewPaging(int page, String productId);
	
	//리뷰등록하기전 구매여부 체크.
	boolean reviewWriteCheck(String memberId, String productId);
	
	//리뷰 등록하기. 멤버객체or멤버아이디가져와서 작성자 입력해주기.
	int insertReview(String memberId, String reviewContent, String productId, int productLike);
	
	//리뷰 삭제하기.
	int deleteReview(String memberId, String productId);
	
	//스토어QnA 페이징.
	HashMap<String, Object> selectStoreQnAPaging(int page, String productId);
	
	//QnA번호로 QnA조회.
	StoreQnA selectQnAByNo(int storeQnANo);
	
	//QnA Join
	StoreQnA selectQnAJoin(int storeQnANo);
	
	//QnA댓글 등록하기.
	int insertQnAReply(int sellerStoreNo, String storeReplyContent, int storeQnANo);
	
	//first 카테고리(업종) 조회
	List<Category> selectFirstCategory();
	
	//second 카테고리조회.
	List<Category> selectSecondCategory(String categoryIdRef);
	
	//상품 등록하기
	int insertProduct(Product product);
	
	//상품 옵션 등록하기
	int insertOption(List<ProductOption> productOptionList, String productId);
	
	//상품 상세 이미지 등록하기
	int insertDetailImage(ProductDetailImage productDetailImage);
	
	//상품 ID로 상품 조회하기
	HashMap<String, Object> selectProductById(String productId);
	
	//옵션아이디로 옵션 수정
	int updateProductById(HashMap<String, Object> map);
	
	//상품ID로 상품 삭제
	int deleteProductById(String productId);
}