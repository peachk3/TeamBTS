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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		logger.debug("거래 게시판 호출");
		
		// 서비스 -> DB의 정보를 가져오기
		List<Post_boardDTO> pBoardList = cService.PostList();
		logger.debug("size : "+ pBoardList.size());
		logger.debug("size : "+ pBoardList);
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("pBoardList", pBoardList);

	}
	
	@RequestMapping(value="/communityWrite",method=RequestMethod.GET)
	public String coummnityWrite_GET(HttpSession session) {
		
        String user_id = (String) session.getAttribute("user_id");
        logger.debug("user_id : "+ user_id);
		
		  if(user_id != null) {
			  logger.debug("거래 게시판 호출");
			  logger.debug(" /adminScheduleUpload -> adminScheduleUpload_GET() 호출");
	        
	        	return "/community/communityWrite";
	        } else {
	        	
	        	logger.debug("로그인을 해야 예매하기를 할 수 있습니다");
	        	
	        	return "/login/loginPage";
	        }
		

	}
	
	@RequestMapping(value="/communityWrite",method=RequestMethod.POST)
	public String coummnityWrite_POST(Post_boardDTO dto) {
		logger.debug("거래 게시판 호출");
		logger.debug(" /adminScheduleUpload -> adminScheduleUpload_POST() 호출");
		
		logger.debug("dto : "+ dto);
		
		cService.PostJoin(dto);
		
		return "redirect:/community/community";
	}
	
	//  거래 게시판 본문 확인하기
	@GetMapping(value="/communityContent")
	public void communityContent_GET(@RequestParam("post_id") String post_id, Model model) throws Exception{
		logger.debug("본문 내용 호출");
    	logger.debug(" post_id : " + post_id);

    	List<Post_boardDTO> PostOneList = cService.PostOneList(post_id);
    	
		logger.debug("size : "+ PostOneList.size());
		logger.debug("size : "+ PostOneList);
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("PostOneList", PostOneList);
    	
	}
	
	
	
	
}
