package com.hwangdang.dao;

import java.util.HashMap;
import java.util.List;

import com.hwangdang.vo.Category;
import com.hwangdang.vo.Product;
import com.hwangdang.vo.ProductDetailImage;
import com.hwangdang.vo.ProductOption;
import com.hwangdang.vo.Review;
import com.hwangdang.vo.StoreQnA;

public interface ProductDao 
{
	//상품 리스트 조회.  페이징 처리.
	List<Product> selectAllProduct(HashMap<String, Object> map);
	
	//상품 전체 갯수 조회.
	int selectCountProduct();
	
	//판매자번호로 상품갯수 조회.
	int selectCountProductByNo(int sellerStoreNo);
	
	//상품 메인 상품ID로 상품검색.
	Product selectProductDetailById(String productId);
	
	//상품 ID로 옵션 검색.
	List<ProductOption> selectOptionById(String productId);
	
	String selectDetailImageById(String productId);
	
	//옵션 상세 이름으로 추가가격과, 재고량 조회.
	ProductOption selectOptionStockByName(HashMap<String, Object> map);
	
	//상품ID로 등록된 리뷰갯수 조회.
	int selectCountById(String productId);
	
	//상품ID로 등록된 리뷰 조회.
	List<Review> selectReviewById(HashMap<String, Object> map);
	
	//(리뷰, 상품QnA 등록시 구매한 회원인지 확인)
	//회원 id로 주문내역 검색.(주문번호조회.)
	List<String> selectOrderNo(String memberId);
	//주문번호로 주문상품 여부확인(상품id 비교.)
	int selectOrderProduct(HashMap<String, Object> map);
	
	//리뷰 등록.
	int insertReview(Review review);
	
	//리뷰 등록시 이미 리뷰를 등록한 아이디인지 확인.(아이디와 상품ID)
	int reviewRegisterCheck(HashMap<String, Object> map);
	
	//리뷰 등록시 추천, 비추천 반영.
	int updateProductLikes(HashMap<String, Object> map);
	
	//추천반영 후 추천수 조회.
	int selectProductLike(String productId);
	
	//리뷰 삭제.
	int deleteReview(HashMap<String, Object> map);
	
	//상품 ID로 스토어QnA조회.
	List<StoreQnA> selectQnAById(HashMap<String, Object> map);
	
	//상품ID로 등록된 QnA갯수 조회.
	int selectQnACountById(String productId);
	
	//QnA번호로 QnA조회.
	StoreQnA selectQnAByNo(int storeQnANo);
	
	//QnA Join
	StoreQnA selectQnAJoin(int storeQnANo);
	
	//QnA댓글등록
	int insertQnAReply(HashMap<String, Object> map);
	
	//스토어번호로 판매자 조회.(QnA 댓글 등록.)
	String selectSellerByNo(int storeQnANo);
	
	//first 카테고리(업종) 조회
	List<Category> selectFirstCategory();
	
	//second 카테고리조회.
	List<Category> selectSecondCategory(String categoryIdRef);
	
	//상품 - 판매자 조인
	Product selectProductSellerJoin(HashMap<String, Object> map);
	
	//상품 등록
	int insertProduct(Product product);
	
	//상품 id로 상품 조회
	Product selectProductById(String productId);
	
	//옵션아이디로 옵션 수정
	int updateProductOptionById(ProductOption productOption);
	
	// 상품아이디로 상품 수정
	int updateProductById(Product product);
	
	//상품아이디로 상세 이미지 수정
	int updateDetailImageById(ProductDetailImage productDetailImage);
	
	//상품아이디로 상품 삭제
	int deleteProductById(String productId);
}