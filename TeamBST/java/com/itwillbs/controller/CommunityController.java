package com.itwillbs.controller;

import java.util.List;



import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.service.AdminService;
import com.itwillbs.service.CommunityService;

@Controller
@RequestMapping(value="/community/*")
public class CommunityController {

	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	// 서비스 객체 주입
	@Inject
	private CommunityService cService;
	
	@RequestMapping(value="/community",method=RequestMethod.GET)
	public void coummnityMain_GET(Model model) throws Exception {
		logger.debug("거래 게시판 메인 호출");
		logger.debug(" /community -> coummnityMain_GET() 호출");
		
		// 서비스 -> DB의 정보를 가져오기
		List<Post_boardDTO> pBoardList = cService.PostList();
		logger.debug("size : "+ pBoardList.size());
		logger.debug("pBoardList : "+ pBoardList);
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("pBoardList", pBoardList);

	}
	
	@RequestMapping(value="/communityWrite",method=RequestMethod.GET)
	public String coummnityWrite_GET(HttpSession session) {
		
        String user_id = (String) session.getAttribute("user_id");
        logger.debug("user_id : "+ user_id);
		
		  if(user_id != null) {
			  logger.debug("거래 게시판 글쓰기 호출");
			  logger.debug(" /adminScheduleUpload -> adminScheduleUpload_GET() 호출");
	        
	        	return "/community/communityWrite";
	        } else {
	        	
	        	logger.debug("로그인을 해야 예매하기를 할 수 있습니다");
	        	
	        	return "redirect:/login/loginPage";
	        }
		

	}
	
	@RequestMapping(value="/communityWrite",method=RequestMethod.POST)
	public String coummnityWrite_POST(Post_boardDTO dto,HttpSession session) {
        String user_id = (String) session.getAttribute("user_id");
		logger.debug("거래 게시판 글쓰기 호출");
		logger.debug(" /adminScheduleUpload -> adminScheduleUpload_POST() 호출");
		dto.setPost_writer_id(user_id);
		logger.debug("dto : "+ dto);
		
		cService.PostJoin(dto);
		
		return "redirect:/community/community";
	}
	
	//  거래 게시판 본문 확인하기
	@GetMapping(value="/communityContent")
	public void communityContent_GET(@RequestParam("post_id") int post_id, Model model) throws Exception{
		logger.debug("거래 게시판 본문 내용 호출");
		logger.debug(" /communityContent -> communityContent_GET() 호출");
    	logger.debug(" post_id : " + post_id);

    	// 본문 내용 호출
    	List<Post_boardDTO> PostOneList = cService.PostOneList(post_id);

    	// 조회수 증가
    	cService.updateCount(post_id);
    	
    	
		logger.debug("size : "+ PostOneList.size());
		logger.debug("size : "+ PostOneList);
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("PostOneList", PostOneList);
    	
	}
	
//  게시판 글 수정하기(기존의 글정보 확인) - GET
	@GetMapping(value="/communityModify")
	public String communityModify_GET(Post_boardDTO pbdto,HttpSession session,Model model,@RequestParam("post_id") int post_id,@RequestParam("post_writer_id") String post_writer_id) throws Exception{
		logger.debug("거래 게시판 본문 수정 호출");
		logger.debug(" /communityModify -> communityModify_GET() 호출");
			// 전달정보 bno 저장
			logger.debug(" post_id : "+ post_id);
			String user_id = (String) session.getAttribute("user_id");
	        logger.debug("user_id : "+ user_id);
	        logger.debug("post_writer_id : "+ post_writer_id);
	        
	        if (user_id == null) {
	            logger.debug("로그인을 해야 수정을 할 수 있습니다");
	            return "redirect:/login/loginPage";
	        }
	        
	        if (user_id.equals(pbdto.getPost_writer_id())) {
	            List<Post_boardDTO> PostOneList = cService.PostOneList(post_id);
	            logger.debug("size : " + PostOneList.size());
	            logger.debug("PostOneList : " + PostOneList);
	            
	            // 연결된 뷰페이지로 정보 전달
	            model.addAttribute("PostOneList", PostOneList);
	            return "/community/communityModify";
	        } else {
	        	logger.debug("본인이 작성한 글이 아닙니다");
	            return "redirect:/community/communityContent?post_id="+post_id;
	        }
	    }
			  
		
	
	
//  게시판 글 수정하기(기존의 글정보 확인) - POST
	@PostMapping(value="/communityModify")
	public String communityModify_POST(Post_boardDTO pbdto,@RequestParam("post_id") int post_id) throws Exception{
		logger.debug("거래 게시판 본문 수정 호출");
		logger.debug(" /communityModify -> communityModify_POST() 호출");
		// 한글처리 인코딩(필터)
		// 전달 정보 저장
		logger.debug("수정할 내용, {} ",pbdto);
		
		// 서비스 - DAO 글내용을 수정
		cService.modifyContent(pbdto);
		
        return "redirect:/community/communityContent?post_id="+post_id;
	}
	
	

//  게시판 글 삭제하기(기존의 글정보 확인) - POST
	@PostMapping(value="/communityDelete")
	public String communityDelete_GET(Post_boardDTO pbdto,HttpSession session,Model model,@RequestParam("post_id") int post_id,@RequestParam("post_writer_id") String post_writer_id) throws Exception{
		logger.debug("거래 게시판 글 삭제 호출");
		logger.debug(" /communityDelete -> communityDelete_GET() 호출");
			// 전달정보 post_id 저장
			logger.debug(" post_id : "+ post_id);
			String user_id = (String) session.getAttribute("user_id");
	        logger.debug("user_id : "+ user_id);
	        logger.debug("post_writer_id : "+ post_writer_id);
	        
	        if (user_id == null) {
	            logger.debug("로그인을 해야 삭제를 할 수 있습니다");
	            return "redirect:/login/loginPage";
	        }
	        
	        if (user_id.equals(pbdto.getPost_writer_id())) {
	        	// 게시글 삭제하기
	        	cService.deleteContent(post_id);
	        	
	            return "redirect:/community/community";
	        } else {
	        	logger.debug("본인이 작성한 글이 아닙니다");
	            return "redirect:/community/communityContent?post_id="+post_id;
	        }
	    }
			  
		
	
	
	
	
	
	
}
