package com.hwangdang.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hwangdang.common.util.Constants;
import com.hwangdang.common.util.PagingBean;
import com.hwangdang.service.ProductService;
import com.hwangdang.service.StoreQnAService;
import com.hwangdang.vo.Category;
import com.hwangdang.vo.Member;
import com.hwangdang.vo.Product;
import com.hwangdang.vo.ProductDetailImage;
import com.hwangdang.vo.ProductOption;
import com.hwangdang.vo.StoreQnA;

@Controller
@RequestMapping("/product/")
public class ProductController
{
	@Autowired
	private ProductService service;
	
	@Autowired
	private StoreQnAService qnaService;
	
	public ProductController()
	{
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("list")
	//상품 리스트 조회.
	public ModelAndView productList(int page, int sellerStoreNo)
	{
		HashMap<String, Object> map = service.selectAllProduct(page, sellerStoreNo);
		return new ModelAndView("seller/seller/product_list.tiles", map);
	}
	
	@RequestMapping("detail")
	public ModelAndView productDetail(int page, String productId, int sellerStoreNo, String sellerStoreImage)
	{
		return new ModelAndView("seller/seller/product_detail.tiles", service.selectProductDetailById(page, productId, sellerStoreNo));
	}
	
	@RequestMapping("optionStock")
	@ResponseBody
	public ProductOption optionStock(String optionName, String productId)
	{
		return service.selectOptionStockByName(optionName, productId);
	}
	
	@RequestMapping("reviewPaging")
	@ResponseBody
	public HashMap<String, Object> reviewPaging(int page, String productId)
	{
		return service.selectReviewPaging(page, productId);
	}
	
	@RequestMapping("reviewWriteCheck")
	@ResponseBody
	public boolean reviewWriteCheck(String memberId, String productId, HttpSession session)
	{
		memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		return service.reviewWriteCheck(memberId, productId);
	}
	
	@RequestMapping("reviewRegister")
	@ResponseBody
	public HashMap<String, Object> reviewRegister(String memberId, String reviewContent, String productId, int productLike, HttpSession session)
	{
		//session에서 로그인한 회원의 정보를 가져옴.(멤버객체 or 멤버아이디 보내주기.(작성자));
		memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		if(reviewContent == null || reviewContent.trim().length() < 3 || reviewContent.length() > 20)
		{
			return null;
		}
		int productLikes = service.insertReview(memberId, reviewContent, productId, productLike);
		HashMap<String, Object> map = reviewPaging(1, productId);
		map.put("productLike", productLikes);
		return map;
	}
	
	@RequestMapping("reviewDelete")
	@ResponseBody
	public HashMap<String, Object> reviewDelete(String memberId, String productId, HttpSession session)
	{
		HashMap<String, Object> map = new HashMap<>();
		try
		{
			memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		}
		catch (Exception e)
		{
			map.put("reviewDelete", 3);
			return map;
		}
		int reviewDelete = service.deleteReview(memberId, productId);
		map = reviewPaging(1, productId);
		map.put("reviewDelete", reviewDelete);
		return map;
	}
	
	@RequestMapping("qnaPaging")
	@ResponseBody
	public HashMap<String, Object> qnaPaging(int page, String productId)
	{
		return service.selectStoreQnAPaging(page, productId);
	}
	
	/*@RequestMapping("qnaShow")
	@ResponseBody
	public StoreQnA qnaShow(int storeQnANo)
	{
		return service.selectQnAByNo(storeQnANo);
	}*/
	
	@RequestMapping("qnaShow")
	@ResponseBody
	public StoreQnA qnaShow(int storeQnANo, int sellerStoreNo, HttpSession session)
	{
		//공개여부 체크.
		if(qnaService.selectQnAPublished(storeQnANo) == 0)
		{
			//비공개인경우.
			try
			{
				if(((Member)session.getAttribute("login_info")).getMemberId().equals(qnaService.selectSellerByNo(sellerStoreNo)) || 
						((Member)session.getAttribute("login_info")).getMemberId().equals(qnaService.selectQnAWriterByNo(storeQnANo)))
				{
					//스토어넘버로 조회해서 얻은 판매자 아이디와 내아이디가 같은경우(판매자인경우.)
					//						로그인한 회원의 아이디와 작성자가 같은경우.
					StoreQnA qna = service.selectQnAJoin(storeQnANo);
					if(qna == null)
					{
						return service.selectQnAByNo(storeQnANo);
					}
					return qna;
				}
				else
				{
					//아이디가 다른경우(판매자가 아니거나... 등록한회원이 아닌경우.)
					StoreQnA qna = service.selectQnAByNo(storeQnANo);
					qna.setStoreQnAPublished(3);
					return qna;
				}
			}
			catch(Exception e)
			{
				//로그인 안한경우.
				//아이디가 다른경우(판매자가 아니거나... 등록한회원이 아닌경우.)
				StoreQnA qna = service.selectQnAByNo(storeQnANo);
				qna.setStoreQnAPublished(3);
				return qna;
			}
		}
		else
		{
			StoreQnA qna = service.selectQnAJoin(storeQnANo);
			if(qna == null)
			{
				return service.selectQnAByNo(storeQnANo);
			}
			return qna;
		}
	}
	
	@RequestMapping("qnaReplyRegister")
	@ResponseBody
	public StoreQnA qnaReplyRegister(int sellerStoreNo, String storeReplyContent, int storeQnANo, HttpSession session)
	{
		try
		{
			if(((Member)session.getAttribute("login_info")).getMemberId().equals(qnaService.selectSellerByNo(sellerStoreNo)))
			{
				int result = service.insertQnAReply(sellerStoreNo, storeReplyContent, storeQnANo);
				if(result == 0)
				{
					return null;
				}
				return service.selectQnAJoin(storeQnANo);
			}
			else
			{
				return null;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping("sellerSubIndustry")
	@ResponseBody
	public List<Category> sellerSubIndustry(String categoryIdRef)
	{
		return service.selectSecondCategory(categoryIdRef);
	}
	
	// 상품 등록 폼
	@RequestMapping("registerProductForm")
	public String registerProductForm(){
		return "seller/seller/product_register.tiles";
	}
	
	// 상품 등록
	@RequestMapping("registerProduct") 
	public ModelAndView registerProduct(@ModelAttribute Product product, ProductOption productOption, HttpServletRequest request, String sellerStoreImage) throws UnsupportedEncodingException {
		
		String mainImage = "";
		String detailImage = "";
		List<MultipartFile>images = product.getImages();
		
		for(int idx=0; idx<images.size()	; idx++){
			String originalFileName = images.get(idx).getOriginalFilename();//업로드 된 파일명
		
			//임시 저장소에 저장된 업로드 된 파일을 최종 저장소로 이동.
			//최종 저장소 디렉토리 조회.
			//new File(디렉토리, 파일)
			String path = "C:\\Users\\kosta\\git\\HwangDangPortfolio\\HwangDangFleamarket\\WebContent\\image_storage";
			File imageFile = new File(path, originalFileName);
		
			//file중복체크
		    if (imageFile.exists()) {
				originalFileName = System.currentTimeMillis() + originalFileName;
				imageFile = new File(path, originalFileName);
		    }
		    
		    //톰캣 경로의 image_storage로 파일복사.
    		String imageStorage = request.getServletContext().getRealPath("/image_storage");
				try {
					FileCopyUtils.copy(images.get(idx).getInputStream(), new FileOutputStream(imageStorage+"/"+originalFileName));
					images.get(idx).transferTo(imageFile);
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				if(idx==0){
					mainImage = originalFileName;
				}else{
					detailImage = detailImage + originalFileName + "/";
				}
		}
		
		List<ProductOption> optionList = productOption.getOptionList();
	
		int productStock = 0;
		for(ProductOption option : optionList){
				productStock = productStock + option.getOptionStock();
		}

		product.setProductStock(productStock);
		product.setProductMainImage(mainImage);
		service.insertProduct(product);
		
		ProductDetailImage detailImages = new ProductDetailImage(detailImage, product.getProductId());
		service.insertDetailImage(detailImages);

		service.insertOption(productOption.getOptionList(), product.getProductId());
		
		HashMap<String, Object> map = service.selectAllProduct(1, product.getSellerStoreNo());
		int pages = (int) Math.ceil((double)((int)map.get("allItems"))/Constants.ITEMS_PER_PAGE);
		return new ModelAndView("redirect:/product/list.go?page="+ pages +"&sellerStoreNo="+product.getSellerStoreNo()
														+"&sellerStoreImage="+URLEncoder.encode(sellerStoreImage,"UTF-8"));
	}
	
	// 상품 수정 폼
	@RequestMapping("editProductForm")
	public ModelAndView editProductForm(String productId){
		 return new ModelAndView("seller/seller/product_edit_form.tiles", service.selectProductById(productId));
	}
	
	// 상품 수정
	@RequestMapping("editProduct")
	public ModelAndView editProduct(@ModelAttribute Product product, ProductOption productOption, HttpServletRequest request, String sellerStoreImage) throws UnsupportedEncodingException{
		
		String mainImage = "";
		String detailImage = "";
		
		List<MultipartFile>images = product.getImages();
		for(int idx=0; idx<images.size()	; idx++){
			if(images.get(0).getOriginalFilename().equals("") && idx == 0){
				mainImage = ((Product)service.selectProductById(product.getProductId()).get("product")).getProductMainImage();
			}else if(images.get(1).getOriginalFilename().equals("") && idx != 0){
				break;
			}
			
			String originalFileName = images.get(idx).getOriginalFilename();//업로드 된 파일명
		
			//임시 저장소에 저장된 업로드 된 파일을 최종 저장소로 이동.
			//최종 저장소 디렉토리 조회.
			//new File(디렉토리, 파일)
			String path = "C:\\Users\\kosta\\git\\HwangDangPortfolio\\HwangDangFleamarket\\WebContent\\image_storage";
			File imageFile = new File(path, originalFileName);
		
			//file중복체크
		    if (imageFile.exists()) {
				originalFileName = System.currentTimeMillis() + originalFileName;
				imageFile = new File(path, originalFileName);
		    }
		    
		    //톰캣 경로의 image_storage로 파일복사.
    		String imageStorage = request.getServletContext().getRealPath("/image_storage");
				try {
					FileCopyUtils.copy(images.get(idx).getInputStream(), new FileOutputStream(imageStorage+"/"+originalFileName));
					images.get(idx).transferTo(imageFile);
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				if(mainImage.equals("")){
					mainImage = originalFileName;
				}
				
				if(idx!=0){
					detailImage = detailImage + originalFileName + "/";
				}
		}

		product.setProductMainImage(mainImage);
		HashMap<String, Object> map = new HashMap<>();
		map.put("product", product);
		//map.put("productOption", productOption);
		if(!images.get(1).getOriginalFilename().equals("")){
			map.put("image", new ProductDetailImage(detailImage, product.getProductId()));
		}
		
		List<ProductOption> list = (List<ProductOption>)service.selectProductById(product.getProductId()).get("optionList");
		
		ArrayList<ProductOption> oldList = new ArrayList<>();
		ArrayList<ProductOption> newList = new ArrayList<>();
		
		for(int idx=0; idx<productOption.getOptionList().size(); idx++){
			if(idx < list.size()){
				oldList.add(productOption.getOptionList().get(idx));
			}else{
				newList.add(productOption.getOptionList().get(idx));
			}
		}
		map.put("oldList", oldList);

		if(newList.size() != 0){
			map.put("newList", newList);
		}
		service.updateProductById(map);
		return new ModelAndView("redirect:/product/detail.go?page="+request.getParameter("page")+"&sellerStoreNo="+product.getSellerStoreNo()
														+"&productId="+product.getProductId()+"&sellerStoreImage="+URLEncoder.encode(sellerStoreImage,"UTF-8")); //파라미터 값 넘겨주기
	}
	
	// 상품 삭제
	@RequestMapping("deleteProduct")
	public ModelAndView deleteProduct(String productId, String sellerStoreImage, HttpServletRequest request) throws UnsupportedEncodingException{
		service.deleteProductById(productId);
		return new ModelAndView("redirect:/product/list.go?page="+request.getParameter("page")+"&sellerStoreNo="+request.getParameter("sellerStoreNo")
													+"&sellerStoreImage="+URLEncoder.encode(sellerStoreImage,"UTF-8"));
	}
	
	//상품ID 중복 체크
	@RequestMapping("productIdCheck")
	@ResponseBody
	public int productIdCheck(String productId)
	{
		return service.selectProductIdCheck(productId);
	}
}