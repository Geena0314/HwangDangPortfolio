package com.hwangdang.serviceimpl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hwangdang.common.util.PagingBean;
import com.hwangdang.dao.ProductDao;
import com.hwangdang.dao.ProductDetailImageDao;
import com.hwangdang.dao.ProductOptionDao;
import com.hwangdang.service.ProductService;
import com.hwangdang.vo.Category;
import com.hwangdang.vo.Product;
import com.hwangdang.vo.ProductDetailImage;
import com.hwangdang.vo.ProductOption;
import com.hwangdang.vo.Review;
import com.hwangdang.vo.StoreQnA;

@Service
public class ProductServiceImpl implements ProductService
{
	@Autowired
	private ProductDao dao;
	
	@Autowired
	private ProductOptionDao optionDao;
	
	@Autowired
	private ProductDetailImageDao detailImageDao;
	
	public ProductServiceImpl()
	{
		// TODO Auto-generated constructor stub
	}

	@Override
	//상품 리스트 조회.
	public HashMap<String, Object> selectAllProduct(int page, int sellerStoreNo)
	{
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		PagingBean bean = new PagingBean(dao.selectCountProductByNo(sellerStoreNo), page);
		map.put("itemPerPage", 6);//한 페이지에 표시할 갯수.
		map.put("page", page);//현재 페이지.
		map.put("sellerStoreNo", sellerStoreNo);
		map.put("productList", dao.selectAllProduct(map));
		map.put("bean", bean);
		map.put("allItems", dao.selectCountProductByNo(sellerStoreNo));
		
		return map;
	}

	@Override
	//상품 ID로 조회.
	public HashMap<String, Object> selectProductDetailById(int page, String productId, int sellerStoreNo)
	{
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("productId", productId);
		map.put("sellerStoreNo", sellerStoreNo);
		Product product = dao.selectProductSellerJoin(map);
		product.setProductInfo(product.getProductInfo().replaceAll(">", "&gt;"));
		product.setProductInfo(product.getProductInfo().replaceAll("<", "&lt;"));
		product.setProductInfo(product.getProductInfo().replaceAll("\n", "<br>"));
		product.setProductInfo(product.getProductInfo().replaceAll(" ", "&nbsp;"));
		
		map.put("product", product);
		map.put("optionList", dao.selectOptionById(productId));
		String image = dao.selectDetailImageById(productId);
		try
		{
			String[] detailImage = image.split("/");
			map.put("detailimage", detailImage);
		}
		catch (Exception e)
		{
			
		}
		
		//Review조회 및 페이징.
		PagingBean bean = new PagingBean(dao.selectCountById(productId), page);
		map.put("itemPerPage", 6);
		map.put("page", page);
		map.put("productId", productId);
		map.put("reviewList", dao.selectReviewById(map));
		map.put("bean", bean);
		
		//Store_QnA조회 및 페이징.
		map.put("qnaMap", selectStoreQnAPaging(page, productId));
		return map;
	}

	@Override
	public ProductOption selectOptionStockByName(String optionName, String productId)
	{
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("optionName", optionName);
		map.put("productId", productId);
		return dao.selectOptionStockByName(map);
	}

	@Override
	public HashMap<String, Object> selectReviewPaging(int page, String productId)
	{
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		PagingBean bean = new PagingBean(dao.selectCountById(productId), page);
		map.put("itemPerPage", 6);
		map.put("page", page);
		map.put("productId", productId);
		map.put("review", dao.selectReviewById(map));
		map.put("bean", bean);
		return map;
	}
	
	@Override
	public HashMap<String, Object> selectStoreQnAPaging(int page, String productId)
	{
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		PagingBean qnaBean = new PagingBean(dao.selectQnACountById(productId), page);
		map.put("itemPerPage", 6);
		map.put("page", page);
		map.put("productId", productId);
		map.put("qna", dao.selectQnAById(map));
		map.put("qnaBean", qnaBean);
		return map;
	}

	@Override
	public boolean reviewWriteCheck(String memberId, String productId)
	{
		// TODO Auto-generated method stub
		List<String> list = dao.selectOrderNo(memberId);
		HashMap<String, Object> map = new HashMap<>();
		for(int i = 0; i < list.size(); i++)
		{
			map.put("ordersNo", list.get(i));
			map.put("productId", productId);
			if(dao.selectOrderProduct(map) > 0)
			{
				return true;
			}
		}
		return false;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertReview(String memberId, String reviewContent, String productId, int productLike)
	{
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("productId", productId);
		map.put("productLike", productLike);
		if(dao.reviewRegisterCheck(map) == 0)
		{
			dao.updateProductLikes(map);
			dao.insertReview(new Review(0, reviewContent, new Date(), memberId, productId));
			return dao.selectProductLike(productId);
		}
		else 
			return 0;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteReview(String memberId, String productId)
	{
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("productId", productId);
		return dao.deleteReview(map);
	}

	@Override
	public StoreQnA selectQnAByNo(int storeQnANo)
	{
		// TODO Auto-generated method stub
		StoreQnA qna = dao.selectQnAByNo(storeQnANo);
		return dao.selectQnAByNo(storeQnANo);
	}

	@Override
	public StoreQnA selectQnAJoin(int storeQnANo)
	{
		// TODO Auto-generated method stub
		return dao.selectQnAJoin(storeQnANo);
	}

	@Override
	public int insertQnAReply(int sellerStoreNo, String storeReplyContent, int storeQnANo)
	{
		// TODO Auto-generated method stub
		//스토어 판매자 아이디 조회
		String memberId = dao.selectSellerByNo(sellerStoreNo);
		/*
		 * 세션에 등록되어있는(로그인한) 아이디와 조회한 아이디 비교 후 맞으면 등록해줌.(판매자만등록)
		 */
		HashMap<String, Object> map = new HashMap<>();
		map.put("storeReplyWriter", memberId);
		map.put("storeReplyContent", storeReplyContent);
		map.put("storeQnANo", storeQnANo);
		return dao.insertQnAReply(map);
	}

	@Override
	public List<Category> selectFirstCategory()
	{
		// TODO Auto-generated method stub
		return dao.selectFirstCategory();
	}

	@Override
	public List<Category> selectSecondCategory(String categoryIdRef)
	{
		// TODO Auto-generated method stub
		return dao.selectSecondCategory(categoryIdRef);
	}

	@Override
	public int insertProduct(Product product) {
		// TODO Auto-generated method stub
		return dao.insertProduct(product);
	}

	@Override
	public int insertOption(List<ProductOption> productOptionList, String productId) {
		for(ProductOption options : productOptionList){
			options.setProductId(productId);
			optionDao.insertOption(options);
		}
		return 0;
	}

	@Override
	public int insertDetailImage(ProductDetailImage productDetailImage) {
		// TODO Auto-generated method stub
		return detailImageDao.insertDetailImage(productDetailImage);
	}

	@Override
	public HashMap<String, Object> selectProductById(String productId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("product", dao.selectProductById(productId));
		map.put("optionList", dao.selectOptionById(productId));
		return map;
	}

	@Override
	public int updateProductById(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		Product product = (Product) map.get("product");
		dao.updateProductById(product);
		List<ProductOption> oldList = (List<ProductOption>) map.get("oldList");
		for(int idx=0; idx<oldList.size(); idx++){
			oldList.get(idx).setProductId(product.getProductId());
			dao.updateProductOptionById(oldList.get(idx));
		}
		List<ProductOption> newList = (List<ProductOption>) map.get("newList");
		if(map.get("newList")!=null){
			for(int idx=0; idx<newList.size(); idx++){
				newList.get(idx).setProductId(product.getProductId());
				optionDao.insertOption(newList.get(idx));
			}
		}
		if( map.get("image")!=null){
			ProductDetailImage image = ((ProductDetailImage) map.get("image"));
			dao.updateDetailImageById(image);
		}
		return 0;
	}

	@Override
	public int deleteProductById(String productId) {
		// TODO Auto-generated method stub
		return dao.deleteProductById(productId);
	}
}