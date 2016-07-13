package com.hwangdang.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.SessionScope;

import com.hwangdang.common.util.PagingBean;
import com.hwangdang.serviceimpl.BoardQnAServiceImpl;
import com.hwangdang.serviceimpl.MemberServiceImpl;
import com.hwangdang.vo.AdminQnA;
import com.hwangdang.vo.AdminQnAReply;
import com.hwangdang.vo.Member;

@Controller
@RequestMapping("/admin")
public class QnABoardController {

	@Autowired
	private BoardQnAServiceImpl service;
	@Autowired
	private MemberServiceImpl memberService;
	
	/**
	 * QnA게시판 글등록 
	 */
	@RequestMapping("/register.go")
	public String registerQnAContent( String loginId , String title , 
				@RequestParam(value="password",required=false) String password , 
				@RequestParam(value="published",required=false) String published ,String content  ){
		String url = "/";
		//System.out.println("로그인아이디 :" + loginId +" ,제목 : "+title+", 작성자 :" + published + "글내용: " + content);
		int seq = service.getQnABoardSeq();
		//Member member = memberService.selectById(loginId);															//조회수 ,작성자 , 비밀번호 
		AdminQnA newQnA = new AdminQnA(seq , title, content, loginId , new Date(), 1, published, password);
		int flag = service.registerNewQnA(newQnA);
		if(flag == 1){
			//System.out.println("글등록 성공!!!");
			url = "/admin/boardQnADetail.go?page="+1 +"&no="+seq;
		}
		
	return url;
	} 
	
	/**
	 *  QnA게시판 전체목록조회 
	 */
	@RequestMapping("/boardQnAList.go")
	public String noticeQnAList(Model model, int page){
		//System.out.println("page: " + page);
		PagingBean pasingBean = new PagingBean(service.getTotalItems() ,page);
		ArrayList<AdminQnA> list = (ArrayList<AdminQnA>) service.getBoardList(page);
		model.addAttribute("list", list);
		model.addAttribute("pasingBean",pasingBean);
	return "admin/boardQnA_list.tiles";
	}
	
	/**
	 *  QnA게시판  비공개글에 비밀번호 불일치하면 이곳으로 이동
	 */
	@RequestMapping("/boardQnADetailBefore.go")
	public String boardQnADetailBefore(int page , int no , Model model , HttpSession session){
		String url = "";
		AdminQnA findQnA = service.getAdminQnAByNo(no);
		if(findQnA!= null && findQnA.getAdminQnaPublished().equals("t")){
			//문의글의 공개 
			url ="/admin/boardQnADetail.go"; 
		}else{
			//문의글의 비공개
			Member member = (Member) session.getAttribute("login_info");
			if(member != null && member.getMemberId().equals("kinghwang@gmail.com")){
				//스토어관리자이면 :프리패쓰 
				url ="/admin/boardQnADetail.go?password="+findQnA.getAdminQnaPassword();
				model.addAttribute("password" , findQnA.getAdminQnaPassword());
			}else{
				//일반사용자이면 : 비밀번호 입력 폼으로 이동 
				//System.out.println("비밀번호:" + findQnA.getAdminQnaPassword()); 
				model.addAttribute("password" , findQnA.getAdminQnaPassword());
				url="admin/boardQnA_detail_before.tiles";
			}
		}
	return url;
	}
	
	/**
	 *  QnA게시판 NO번호로 세부조회  
	 */
	@RequestMapping("/boardQnADetail.go")
	public String boardQnADetail(int page , int no , Model model , HttpSession session ,
					@RequestParam(value="password" , required=false) String password ){
	
		System.out.println("디테일메소드:" + "페이지 :"+page +",NO: " +no + "password :" + password); 
		String url = "";
		AdminQnA findQnA = service.getAdminQnAByNo(no);
		//System.out.println("파람패스워드:"+password +" , 객체패스워드:" + findQnA.getAdminQnaPassword());
		Member member =(Member) session.getAttribute("login_info");
		
		if(findQnA != null && findQnA.getAdminQnaPublished().equals("f")){
			if( (password != null && password.equals(findQnA.getAdminQnaPassword())) ||  member.getMemberId().equals("kinghwang@gmail.com")   ){
				//비공개에 비밀번호가 일치하면 
				model.addAttribute("findQnA",findQnA);
				model.addAttribute("page",page);
				url = "admin/boardQnA_detail.tiles";
			}else{
				//비공개에 비밀번호가 불일치
				//System.out.println("비밀번호가 틀렸습니다.");
				url="admin/boardQnA_detail_before.tiles";
				model.addAttribute("errorMsg","비밀번호가 틀렸습니다.");
			}
		}else{
			//공개이면
			model.addAttribute("findQnA",findQnA);
			model.addAttribute("page",page);
			url = "admin/boardQnA_detail.tiles";
		}
		
	return url;  
	}   
	
	/**
	 *  QnA게시판 수정페이지로 이동 
	 */
	@RequestMapping("/boardQnASetMove.go")
	public String boardQnASetMove( int no , int page , Model model){
		//System.out.println(no +", " + page);
		AdminQnA adminQnA = service.getAdminQnAByNo(no);
		model.addAttribute("adminQnA" ,adminQnA);
		return "admin/boardQnASetForm.tiles";
	}
	
	/**
	 *  QnA게시판 No번호로 글 수정 기능 - 작성자만 가능  
	 */
	@RequestMapping("/boardQnASet.go")
	public String boardQnASet( int no , int page , String title , String content,
			@RequestParam(value="password",required=false) String password ,
			@RequestParam(value="privated",required=false) String privated ,Model model){
		   
		//System.out.println(no +", " + page +", " + title +" ," +content);
		//System.out.println("privated : " + privated + ",pass: "+password);
		String url ="/";
		HashMap<String,Object> param = new HashMap<>();
		param.put("no", no);
		param.put("content", content);
		param.put("title", title);
		param.put("password", password);
		param.put("setDate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		if(privated != null && privated.equals("publiced")){
			//공개글
			//System.out.println("공개글");
			param.put("publiced", "t");
		}else{
			//비공개글
			//System.out.println("비공개");
			param.put("publiced", "f");
		}
		//수정처리
		int flag = service.setAdminQnAByNo(param);
		if(flag ==1){
			//System.out.println("수정성공"); +"&password="+password
			url = "/admin/boardQnADetail.go?no="+no+"&page="+page;
		}
		return url;  
	}
	/**
	 *  QnA게시판 No번호로 질문글 삭제 - 작성자만 가능  
	 */
	@RequestMapping("/boardQnARemove.go")
	public String boardQnARemove( int no , int page , Model model){
		service.removeAdminQnAByNo(no);
	return "/admin/boardQnAList.go";
	}
	
	/**
	 *  QnA게시판 댓글달기 add - 관리자만가능  
	 */			
	@RequestMapping("/addBoardQnAReply.go")
	public String addBoardQnAReply( int contentNo , int contentPage ,
			@RequestParam(value="replyTa" ,defaultValue=" ") String replyTa , Model model){
		
		String url = "/";
		System.out.println("글번호:"+ contentNo + ", 댓글내용: " + replyTa+",page : "+ contentPage);
		String writeDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		AdminQnAReply reply = new AdminQnAReply(replyTa, writeDate, "관리자", contentNo);
		int flag = service.addReply(reply);
		if(flag == 1){
			//댓글달기 성공
			model.addAttribute("reply", reply);
			url = "/admin/boardQnADetail.go?no="+contentNo+"&page="+contentPage;
		}else{
			System.out.println("댓글달기 실패!");
		}
	return url;
	}
	  /**
	   * QnA게시판 관리자 댓글삭제
	   */
	@RequestMapping("/removeBoardQnAReply.go")
	public String removeBoardQnAReply( @RequestParam(value="contentNo", defaultValue="0") int contentNo ,
					@RequestParam(value="replyNo", defaultValue="0") int replyNo ,
					@RequestParam(value="contentPage", defaultValue="0") int contentPage ){
		
		//System.out.println("cententNO : " + contentNo+" ,replyNo:" +replyNo) ;
		String url ="/";
		//댓글삭제
		service.removeReplyByNo(replyNo , contentNo); 
		
		AdminQnA adminQnA = service.getAdminQnAByNo(contentNo);
		//System.out.println("adminQnA 댓글삭제 : " + adminQnA);
		if(adminQnA != null){
			url = "/admin/boardQnADetail.go?page="+contentPage +"&no="+contentNo+"&password="+adminQnA.getAdminQnaPassword();
		}     
		return url;
	}
	 /**
	   * QnA게시판 관리자 댓글수정
	   */
	@RequestMapping("/setBoardQnAReply.go")
	public String setBoardQnAReply( int contentNo , int replyNo ,int contentPage ,
		@RequestParam(value="replyTa" ,defaultValue=" ") String replyTa ){
		/*System.out.println("댓글수정 -  댓글번호:" + replyNo + " , 글번호 no :" +contentNo +"페이지번호:" + contentPage);
		System.out.println("수정한 댓글내용" + replyTa);*/
		
		HashMap<String,Object> param = new HashMap<>();
		param.put("replyNo", replyNo);
		param.put("replyTa", replyTa);
		param.put("setDate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		//댓글수정
		service.setReplyByNo(param);
		//글의 비밀번호 찾는 로직
		AdminQnA adminQnA = service.getAdminQnAByNo(contentNo);
		
	return "/admin/boardQnADetail.go?page="+contentPage +"&no="+contentNo+"&password="+adminQnA.getAdminQnaPassword();
	}
	

	
}
