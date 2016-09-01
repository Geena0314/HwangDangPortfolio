package com.hwangdang.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hwangdang.dao.ProductDao;
import com.hwangdang.vo.Category;
import com.hwangdang.vo.Product;
import com.hwangdang.vo.ProductDetailImage;
import com.hwangdang.vo.ProductOption;
import com.hwangdang.vo.Review;
import com.hwangdang.vo.StoreQnA;

@Repository
public class ProductDaoImpl implements ProductDao
{
	@Autowired
	private SqlSessionTemplate session;
	
	public ProductDaoImpl() 
	{

	}

	@Override
	//상품 리스트 조회.
	public List<Product> selectAllProduct(HashMap<String, Object> map)
	{
		// TODO Auto-generated method stub
		return session.selectList("productMapper.selectAll", map);
	}

	@Override
	public int selectCountProduct()
	{
		return session.selectOne("productMapper.selectCount");
	}

	@Override
	public int selectCountProductByNo(int sellerStoreNo)
	{
		// TODO Auto-generated method stub
		return session.selectOne("productMapper.selectCountByNo", sellerStoreNo);
	}

	@Override
	public Product selectProductDetailById(String productId)
	{
		// TODO Auto-generated method stub
		return session.selectOne("productMapper.selectProductById", productId);
	}

	@Override
	public List<ProductOption> selectOptionById(String productId)
	{
		// TODO Auto-generated method stub
		return session.selectList("productMapper.selectOptionById", productId);
	}

	@Override
	public ProductOption selectOptionStockByName(HashMap<String, Object> map)
	{
		// TODO Auto-generated method stub
		return session.selectOne("productMapper.selectOptionStockByName", map);
	}

	@Override
	public String selectDetailImageById(String productId)
	{
		// TODO Auto-generated method stub
		return session.selectOne("productMapper.selectDetailImageById", productId);
	}

	@Override
	public int selectCountById(String productId)
	{
		// TODO Auto-generated method stub
		return session.selectOne("productMapper.selectCountById", productId);
	}

	@Override
	public List<Review> selectReviewById(HashMap<String, Object> map)
	{
		// TODO Auto-generated method stub
		return session.selectList("productMapper.selectReviewById", map);
	}

	@Override
	public List<String> selectOrderNo(String memberId)
	{
		// TODO Auto-generated method stub
		return session.selectList("productMapper.selectOrderNo", memberId);
	}

	@Override
	public int selectOrderProduct(HashMap<String, Object> map)
	{
		// TODO Auto-generated method stub
		return session.selectOne("productMapper.selectOrderProduct", map);
	}

	@Override
	public int insertReview(Review review)
	{
		// TODO Auto-generated method stub
		return session.insert("productMapper.insertReview", review);
	}

	@Override
	public int reviewRegisterCheck(HashMap<String, Object> map)
	{
		// TODO Auto-generated method stub
		return session.selectOne("productMapper.reviewRegisterCheck", map);
	}

	@Override
	public int updateProductLikes(HashMap<String, Object> map)
	{
		// TODO Auto-generated method stub
		return session.update("productMapper.updateProductLikes", map);
	}

	@Override
	public int selectProductLike(String productId)
	{
		// TODO Auto-generated method stub
		return session.selectOne("productMapper.selectProductLike", productId);
	}

	@Override
	public int deleteReview(HashMap<String, Object> map)
	{
		// TODO Auto-generated method stub
		return session.delete("productMapper.deleteReview", map);
	}

	@Override
	public List<StoreQnA> selectQnAById(HashMap<String, Object> map)
	{
		// TODO Auto-generated method stub
		return session.selectList("productMapper.selectQnAById", map);
	}

	@Override
	public int selectQnACountById(String productId)
	{
		// TODO Auto-generated method stub
		return session.selectOne("productMapper.selectQnACountById", productId);
	}

	@Override
	public StoreQnA selectQnAByNo(int storeQnANo)
	{
		// TODO Auto-generated method stub
		return session.selectOne("productMapper.selectQnAByNo", storeQnANo);
	}

	@Override
	public StoreQnA selectQnAJoin(int storeQnANo)
	{
		// TODO Auto-generated method stub
		return session.selectOne("productMapper.selectQnAJoin", storeQnANo);
	}

	@Override
	public int insertQnAReply(HashMap<String, Object> map)
	{
		// TODO Auto-generated method stub
		return session.insert("productMapper.insertQnAReply", map);
	}

	@Override
	public String selectSellerByNo(int storeQnANo)
	{
		// TODO Auto-generated method stub
		return session.selectOne("productMapper.selectSellerByNo", storeQnANo);
	}

	@Override
	public List<Category> selectFirstCategory()
	{
		// TODO Auto-generated method stub
		return session.selectList("productMapper.selectFirstCategory");
	}

	@Override
	public List<Category> selectSecondCategory(String categoryIdRef)
	{
		// TODO Auto-generated method stub
		return session.selectList("productMapper.selectSecondCategory", categoryIdRef);
	}

	@Override
	public Product selectProductSellerJoin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectOne("productMapper.selectProductSellerJoin", map);
	}

	@Override
	public int insertProduct(Product product) {
		// TODO Auto-generated method stub
		return session.insert("productMapper.insertProduct", product);
	}
	

	@Override
	public Product selectProductById(String productId) {
		// TODO Auto-generated method stub
		return session.selectOne("productMapper.selectProductById", productId);
	}

	@Override
	public int updateProductOptionById(ProductOption productOption) {
		// TODO Auto-generated method stub
		return session.update("productMapper.updateProductOptionById", productOption);
	}

	@Override
	public int updateProductById(Product product) {
		// TODO Auto-generated method stub
		return session.update("productMapper.updateProductById", product);
	}

	@Override
	public int updateDetailImageById(ProductDetailImage productDetailImage) {
		// TODO Auto-generated method stub
		return session.update("productMapper.updateDetailImageById", productDetailImage);
	}

	@Override
	public int deleteProductById(String productId) {
		// TODO Auto-generated method stub
		return session.delete("productMapper.deleteProductById", productId);
	}

	@Override
	public List<Product> selectSearchProductByName(HashMap<String, Object> map)
	{
		// TODO Auto-generated method stub
		return session.selectList("productMapper.selectSearchProductByName", map);
	}

	@Override
	public List<Product> selectSearchProductById(HashMap<String, Object> map)
	{
		// TODO Auto-generated method stub
		return session.selectList("productMapper.selectSearchProductById", map);
	}

	@Override
	public int selectCountByKeyword(String keyword)
	{
		// TODO Auto-generated method stub
		return session.selectOne("productMapper.selectCountByKeyword", keyword);
	}

	@Override
	public int selectProductIdCheck(String productId)
	{
		// TODO Auto-generated method stub
		return session.selectOne("productMapper.selectProductIdCheck", productId);
	}
}