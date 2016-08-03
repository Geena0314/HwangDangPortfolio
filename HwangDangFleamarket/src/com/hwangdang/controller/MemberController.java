package com.hwangdang.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hwangdang.common.util.MailSender;
import com.hwangdang.service.MemberService;
import com.hwangdang.service.ProductService;
import com.hwangdang.service.SellerService;
import com.hwangdang.vo.Code;
import com.hwangdang.vo.Member;
import com.hwangdang.vo.Seller;
import com.hwangdang.vo.Zipcode;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/register") //회원가입 창이 나오게 함
	public ModelAndView register(){
		//이메일 셀렉트.
		return new ModelAndView("member/register.tiles", "emailList", service.selectEmailList());
	}
	
	@RequestMapping("/registerIdCheck")
	@ResponseBody
	public String registerIdCheck(String memberId)
	{
		if(service.selectById(memberId) == null)
			return "success";//가입가능(회원아이디 중복아님.)
		return "fail";//가입불가(회원아이디 중복.)
	}
	 
	@RequestMapping("/registerresult") //DB에 내용을 기입하고 회원가입을 완료함
	public ModelAndView member(@ModelAttribute @Valid Member member, BindingResult result, HttpSession session, String domain,String hp1, String hp2, String hp3) throws Exception{
		
		
		member.setMemberPhone(hp1+"-"+hp2+"-"+hp3);
		member.setMemberId(member.getMemberId()+"@"+domain);
		service.add(member);
		return new ModelAndView("redirect:/member/registerSuccess.go");
	}
	
	@RequestMapping("/registerSuccess") //DB에 내용을 저장하고 회원가입을 완료함
	public String registerSuccess()
	{
		return "member/register_success.tiles";
	}
	
	@RequestMapping("/login") //로그인 화면폼이 나오게 함
	public ModelAndView login()
	{
		return new ModelAndView("/WEB-INF/view/member/login_form.jsp", "emailList", service.selectEmailList());
	}
	
	@RequestMapping("/loginResult.go") //로그인 후 화면
	public ModelAndView loginResult(String memberId, String domain, String memberPassword, String location, HttpSession session, HttpServletRequest request)
	{
		String memberIds = memberId + "@" + domain;
		Member member = service.findById(memberIds);
		if(member!=null){
			//아이디가 존재함.
			if(memberPassword.equals(member.getMemberPassword())){ //아이디와 패스워드가 맞는 경우
				if(member.getMemberAssign() == 1)
				{
					//판매자인경우
					session.setAttribute("seller", service.selectSellerById(memberIds));
				}
				else
				{
					//판매자가 아닌데 셀러신청을 한경우.
					if(service.selectSellerById(memberIds) != null)
					{
						session.setAttribute("sellerRegister", 1);
						session.setAttribute("seller", service.selectSellerById(memberIds));
					}
				}
				session.setAttribute("login_info", member);
				/*if(location.equals("mypage"))
					request.setAttribute("location", "../member/passwordConfirm.go");
				else if(location.equals("order"))
					request.setAttribute("location", "../order/diliveryStatus.go?page=1");
				else if(location.equals("cart"))
					request.setAttribute("location", "../cart/cartList.go?memberId="+memberId);*/
				return new ModelAndView("member/login_success.tiles");
			}else{//패스워드가 틀린 경우
				request.setAttribute("loginId", memberId);
				request.setAttribute("domain", domain);
				return new ModelAndView("/member/login.go", "passwordError", "패스워드가 일치하지 않습니다.");
			}
		}else{//id가 없는 경우
			return new ModelAndView("/member/login.go", "idError", "아이디가 존재하지 않습니다.");
		}
	}
	
	//로그인 이후 상품 디테일페이지로 이동 
	@RequestMapping("/loginAfterProductDetailPage.go") //로그인 후 화면
	public String loginAfterProductDetailPage(String memberId ,String domain, String memberPassword, HttpSession session , @RequestParam(value="page" ,defaultValue="1") int page  ,
		 String productId , String sellerStoreNo   , String sellerStoreImage , String amount , String option , Model model){
		memberId = memberId +"@" + domain;
		//System.out.println(productId + ","  + sellerStoreNo + ", " + amount + ", " + option);
		
		Member member = service.findById(memberId);
		String url ="";   
		if(member!=null){
			if(memberPassword.equals(member.getMemberPassword())){ 
				//아이디와 패스워드가 일치 : 로그인상태 
				session.setAttribute("login_info", member);
				//바로구매 상품 조회  컨트롤러 메소드에게 요청 
				//url = "/buy/moveBuyPage.go?sellerStoreNo="+sellerStoreNo +"&sellerStoreImage="+sellerStoreImage +"&amount="+amount+"&memberId="+memberId;
				url = "/buy/moveBuyPage.go";
			}else{
				url ="member/login_form.tiles";
				model.addAttribute("idError" ,"패스워드가 틀렸습니다!");
			}
		}else{
			//아이디 비존재 
			url ="member/login_form.tiles";
			model.addAttribute("errorMsg" ,"아이디를 잘못입력하였습니다!");
		}
		 
		// 구매페이지로 이동 
		return url;
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();   
		return "redirect:/main.go";
	}
	
	//패스워드 확인 페이지로 이동 
	@RequestMapping("/passwordConfirm")
	public String passwordConfirm()
	{	
		return "member/passwordConfirm.tiles";
	}
	//3가지 옵션 선택페이지 이동 
	@RequestMapping("/mypage")
	public String mypage(String memberPassword, HttpSession session , Model model)
	{	
		String url = "";
		//입력한 비밀번호와 로그인한 회원의 실제 비밀번호가맞는지 검증 로직  
		Member member = (Member) session.getAttribute("login_info");
		if(member != null && member.getMemberPassword().equals(memberPassword)){
			//패스워드 일치 
			url = "member/mypage.tiles";
		}else{
			//패스워드 불일치
			model.addAttribute("errorMsg" , "패스워드가 일치 하지 않습니다. 다시확인해주세요!");
			url = "/member/passwordConfirm.go";
		}
		return url;
	}	
	
	//회원정보 수정 페이지로 이동 
	@RequestMapping("/member_info_update.go")
	public String memberInfoUpdatePageMove(String memberPassword, HttpSession session , Model model)
	{	
		model.addAttribute("emailList", service.selectEmailList());
		model.addAttribute("bank", service.selectBankCode());
		return "member/member_info_update.tiles";
	}
	//비밀번호  수정 : 예전 비밀번호 검증
	@RequestMapping("/oldPasswordChecked.go")
	@ResponseBody
	public boolean oldPasswordChecked(String oldPassword , HttpSession session){	
		boolean flag = false;
		//System.out.println(oldPassword);
		Member member = (Member) session.getAttribute("login_info");
		if(member!=null && member.getMemberPassword().equals(oldPassword)){
			 flag = true;
		}else{
			flag = false;
		}
		return flag;
	}
	
	
	@RequestMapping("/sellerRegister")
	public ModelAndView sellerRegister()
	{
		//여기서 업종카테고리 가지고가기. + 은행코드
		return new ModelAndView("member/seller_register.tiles", productService.selectFirstCategory());
	}
	
	@RequestMapping("/sellerStoreNameCheck")
	@ResponseBody
	public int sellerStoreNameCheck(String sellerStoreName)
	{
		return service.selectSellerStoreName(sellerStoreName);
	}
	
	@RequestMapping("/sellerRegisterRequest")
	public ModelAndView sellerRegisterRequest(Seller seller, MultipartFile sellerMainImage, HttpServletRequest request, HttpSession session, String[] sellerTaxIds)
	{
		//사업자번호 등록
		if(sellerTaxIds.length == 3)
		{
			seller.setSellerTaxId(sellerTaxIds[0] + "-" + sellerTaxIds[1] + "-" + sellerTaxIds[2]);
		}
		//셀러 등록 신청.
		//대표이미지 저장처리.(sellerMainImage -> setSellerStoreImage)이름만 저장.
	    String originalFileName = sellerMainImage.getOriginalFilename();//업로드 된 파일명.
		
		//임시 저장소에 저장된 업로드 된 파일을 최종 저장소로 이동.
		//최종 저장소 디렉토리 조회.
		//new File(디렉토리, 파일)
		String path = "C:\\Users\\kosta\\git\\HwangDangPortfolio\\HwangDangFleamarket\\WebContent\\image_storage";
		File image = new File(path, originalFileName);
		
	    //file중복체크
	    if (image.exists())
	    {
			originalFileName = System.currentTimeMillis() + originalFileName;
			image = new File(path, originalFileName);
	    }
	    // /는 application의 루트경로 => 파일경로로 알려준다.
	    try
		{
	    	//톰캣 경로의 image_storage로 파일복사.
	    	String imageStorage = request.getServletContext().getRealPath("/image_storage");
	    	FileCopyUtils.copy(sellerMainImage.getInputStream(), new FileOutputStream(imageStorage+"/"+originalFileName));
	    	
	    	//gits경로로 이미지 이동.
 			sellerMainImage.transferTo(image);
		} catch (IllegalStateException | IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	    seller.setSellerStoreImage(originalFileName);
	    int result = sellerService.insertSeller(seller);
	    if(result == 1)
	    {
	    	session.setAttribute("sellerRegister", 1);
		    return new ModelAndView("redirect:/member/sellerRegisterSuccess.go?result=1");
	    }
	    else
	    	return new ModelAndView("redirect:/member/sellerRegisterSuccess.go?result=0");
	}
	
	@RequestMapping("sellerRegisterSuccess")
	public String sellerRegisterSuccess(int result, HttpServletRequest request)
	{
		if(result == 0)
			request.setAttribute("result", "등록에 실패했습니다.");
		else
			request.setAttribute("result", "등록에 성공했습니다.");
		return "member/seller_register_success.tiles";
	}
	
	@RequestMapping("findAddress")
	public String findAddress()
	{
		return "/WEB-INF/view/member/address.jsp";
	}
	
	@RequestMapping("findZipcode")
	@ResponseBody
	public List<Zipcode> findZipcode(String dong)
	{
		return service.selectZipcode(dong);
	}
	
	@RequestMapping("findSellerAddress")
	public String findSellerAddress()
	{
		return "/WEB-INF/view/member/seller_address.jsp";
	}
	
	//회원 탈퇴
	@RequestMapping("memberWithdrawal")
	public String memberWithdrawal(String memberId, HttpSession session){	
		session.invalidate();
		service.deleteMemberByMemberId(memberId);
		return "redirect:/main.go";
	}
	
	//회원정보수정
	@RequestMapping("/setMember.go")
	public String setMember(@RequestParam(value="memberName",required=false) String memberName ,
			@RequestParam(value="oldPassword",required=false) String oldPassword,
			@RequestParam(value="newPassword1",required=false) String newPassword1,
			@RequestParam(value="newPassword2",required=false) String newPassword2 , 
			@RequestParam(value="hp1",required=false) String hp1 ,
			@RequestParam(value="hp2",required=false) String hp2 , 
			@RequestParam(value="hp3",required=false) String hp3 , 
			@RequestParam(value="memberZipcode",required=false) String memberZipcode ,
			@RequestParam(value="memberAddress",required=false) String memberAddress ,  Model model ,
			@RequestParam(value="memberSubAddress",required=false) String memberSubAddress ,HttpSession session, HttpServletRequest request,
			@RequestParam(value="sellerStoreImage",required=false) MultipartFile storeMainImage,
			String sellerStoreName, String sellerTaxId, String sellerZipcode, String sellerAddress, String sellerSubAddress, 
			String sellerProduct1, String sellerProduct2, String sellerProduct3, String sellerIntroduction, String sellerBank, String sellerAccount
			){
		String url = "/";
		String memberPhone = hp1+"-"+hp2+"-"+hp3;
		//System.out.printf("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s%n",memberName ,oldPassword ,newPassword1 ,newPassword2, hp1,hp2,hp3,memberZipcode , memberAddress, memberSubAddress);
		Member oldMember = (Member) session.getAttribute("login_info");
		
		if(memberName.isEmpty() && oldMember !=null){
			memberName = oldMember.getMemberName();
		}
		if(!oldPassword.isEmpty() && oldMember !=null && !oldPassword.equals(oldMember.getMemberPassword())){
			model.addAttribute("passwordError1" , "기존 비밀번호가 틀렸습니다.");
			url = "member/member_info_update.go";
		}
		if(oldMember !=null && !newPassword1.isEmpty() && !newPassword2.isEmpty() && !newPassword1.equals(newPassword2)){
			model.addAttribute("passwordError2" , "비밀번호1과 비밀번호2과 같지않습니다.");
			url = "member/member_info_update.go";
		}
		if(oldMember !=null && newPassword1.isEmpty()){
			newPassword1 = oldMember.getMemberPassword();
		}
		if(oldMember !=null && (hp1.isEmpty() ||  hp2.isEmpty()|| hp3.isEmpty())){
			memberPhone = oldMember.getMemberPhone();
		}
		if(oldMember !=null && memberZipcode.isEmpty()){
			memberZipcode = oldMember.getMemberZipcode();
		}
		if(oldMember !=null && memberAddress.isEmpty() ){
			memberAddress = oldMember.getMemberAddress();
		}
		if(oldMember !=null && memberSubAddress.isEmpty()){
			memberSubAddress =oldMember.getMemberSubAddress();
		}
		Member setMember = null;
		if(oldMember !=null ){
			setMember = new Member(oldMember.getMemberId(), newPassword1, memberName, memberPhone, memberZipcode, memberAddress, memberSubAddress , oldMember.getMemberAssign(), oldMember.getMemberMileage());
		}
		if(setMember != null){
			int flag = service.setMemberInfoByMemberId(setMember);
			if(flag == 1){ //회원정보 수정 
				session.setAttribute("login_info", setMember);
				url = "redirect:/member/editInfo.go";
			}
		}else {
			url = "/";
		}  
		
		//셀러 정보수정
		//System.out.println(seller);
		Seller seller = (Seller)session.getAttribute("seller");
		String sellerStoreImage;
		Seller newSeller;
		if(sellerIntroduction.equals(""))
		{
			sellerIntroduction = seller.getSellerIntroduction();
		}
		newSeller = new Seller(seller.getSellerStoreNo(), sellerStoreName, sellerTaxId, seller.getSellerIndustry(), seller.getSellerSubIndustry(), sellerZipcode, sellerAddress, sellerSubAddress, "", sellerProduct1, sellerProduct2, sellerProduct3, sellerIntroduction, seller.getSellerAssign(), seller.getMemberId(), sellerBank, sellerAccount);
		if(storeMainImage.getOriginalFilename().equals(""))
		{
			sellerStoreImage = seller.getSellerStoreImage();
			newSeller.setSellerStoreImage(sellerStoreImage);
		}
		else
		{
			//셀러 등록 신청.
			//대표이미지 저장처리.(sellerMainImage -> setSellerStoreImage)이름만 저장.
		    String originalFileName = storeMainImage.getOriginalFilename();//업로드 된 파일명.
			
			//임시 저장소에 저장된 업로드 된 파일을 최종 저장소로 이동.
			//최종 저장소 디렉토리 조회.
			//new File(디렉토리, 파일)
			String path = "C:\\Users\\kosta\\git\\HwangDangPortfolio\\HwangDangFleamarket\\WebContent\\image_storage";
			File image = new File(path, originalFileName);
			
		    //file중복체크
		    if (image.exists())
		    {
				originalFileName = System.currentTimeMillis() + originalFileName;
				image = new File(path, originalFileName);
		    }
		    // /는 application의 루트경로 => 파일경로로 알려준다.
		    try
			{
		    	//톰캣 경로의 image_storage로 파일복사.
		    	String imageStorage = request.getServletContext().getRealPath("/image_storage");
		    	FileCopyUtils.copy(storeMainImage.getInputStream(), new FileOutputStream(imageStorage+"/"+originalFileName));
		    	
		    	//gits경로로 이미지 이동.
		    	storeMainImage.transferTo(image);
		    	sellerStoreImage = originalFileName;
		    	newSeller.setSellerStoreImage(sellerStoreImage);
		    	session.removeAttribute("seller");
		    	session.setAttribute("seller", newSeller);
			} catch (IllegalStateException | IOException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		service.updateSellerInfo(newSeller);
		return url;
	}
	
	@RequestMapping("/editInfo")
	public String editInfo()
	{
		return "member/updateSuccess.tiles";
	}
	
	//멤버아이디찾기폼으로 이동.
	@RequestMapping("/findMemberForm")
	public ModelAndView findMemberForm()
	{
		return new ModelAndView("member/find_member_service.tiles", "emailList", service.selectEmailList());
	}
	
	//멤버 아이디 찾기.
	@RequestMapping("/findMemberId")
	@ResponseBody
	public String findMemberId(String memberName, String memberPhone)
	{
		String memberId = "";
		try
		{
			memberId = service.selectMemeberByName(memberName, memberPhone);
		}
		catch(Exception e)
		{
			return memberId;
		}
		return memberId;
	}
	//멤버 패스워드 찾기.
	@RequestMapping("/findMemberPassword")
	@ResponseBody
	public String findMemberPassword(String memberId)
	{
		String password = "";
		password = service.selelctPasswordById(memberId);
		try
		{
			if(password.equals(""))
			{
			}
		}
		catch(Exception e)
		{
			return password;
		}
		MailSender mail = new MailSender();
		mail.mailSender(memberId, "비밀번호입니다.", "<h2>" + memberId + "님의 비밀번호는</h2><h2>" + password + "입니다.</h2> <br><a href='http://192.168.0.119:4444/HwangDangFleamarket'><h2>황당플리마켓 메인으로...</h2></a>");
		password = "고객님의 메일로 비밀번호를 전송해 드렸습니다.\n 감사합니다.";
		return password;
	}
}