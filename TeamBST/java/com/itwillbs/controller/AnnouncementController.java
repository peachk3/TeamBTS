package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.Notice_boardDTO;
import com.itwillbs.domain.Question_boardDTO;
import com.itwillbs.service.AnnouncementService;

@Controller
@RequestMapping(value="/announcement/*")
public class AnnouncementController {
	
	private static final Logger logger = LoggerFactory.getLogger(AnnouncementController.class);

	// 서비스 객체 주입
	@Inject
	private AnnouncementService aService;

	@RequestMapping(value="/announcement",method=RequestMethod.GET)
	public void AnnouncementMain_GET(Model model) throws Exception {
		logger.debug("공지 게시판 호출");

		// 서비스 -> DB의 정보를 가져오기
		List<Notice_boardDTO> nBoardList = aService.NoticeList();
		logger.debug("size : "+ nBoardList.size());
		logger.debug("size : "+ nBoardList);
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("nBoardList", nBoardList);
		
	}
	
	
	@RequestMapping(value="/bulletin",method=RequestMethod.GET)
	public void announcementBulletin_GET(Model model) throws Exception {
		logger.debug("문의 게시판 호출");

		// 서비스 -> DB의 정보를 가져오기
		List<Question_boardDTO> qBoardList = aService.QuestionList();
		logger.debug("size : "+ qBoardList.size());
		logger.debug("size : "+ qBoardList);
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("qBoaardList", qBoardList);
		
	}
	
	@RequestMapping(value="/bulletinWrite",method=RequestMethod.GET)
	public String announcementBulletinWrite_GET(HttpSession session) {
        String user_id = (String) session.getAttribute("user_id");
        
        logger.debug("user_id : "+ user_id);
        if(user_id != null) {
        	logger.debug("문의 게시판 글쓰기 호출");
        	logger.debug(" /adminScheduleUpload -> adminScheduleUpload_GET() 호출");
        
        	return "/announcement/bulletinWrite";
        } else {
        	
        	logger.debug("로그인을 해야 예매하기를 할 수 있습니다");
        	
        	return "/login/loginPage";
        }
        
        

	}
	
	@RequestMapping(value="/bulletinWrite",method=RequestMethod.POST)
	public String announcementBulletinWrite_POST(Question_boardDTO dto) {
		logger.debug("문의 게시판 글쓰기 호출");
		logger.debug(" /adminScheduleUpload -> adminScheduleUpload_POST() 호출");
		
		logger.debug("dto : "+ dto);
		
		aService.QuestionJoin(dto);
		
		return "redirect:/announcement/bulletin";
		
	}
	
	
}
