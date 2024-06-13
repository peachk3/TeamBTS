package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;
import com.itwillbs.service.AnnouncementService;
import com.itwillbs.service.CommunityService;

@Controller
@RequestMapping(value="/announcement/*")
public class AnnouncementController {
	
	private static final Logger logger = LoggerFactory.getLogger(AnnouncementController.class);

	// 서비스 객체 주입
	@Inject
	private AnnouncementService aService;

	@RequestMapping(value="/announcement",method=RequestMethod.GET)
	public void AnnouncementMain() {
		logger.debug("공지 게시판 호출");

	}
	
	
	@RequestMapping(value="/bulletin",method=RequestMethod.GET)
	public void announcementBulletin_GET(Model model) throws Exception {
		logger.debug("문의 게시판 호출");

		// 서비스 -> DB의 정보를 가져오기
		List<Question_boardDTO> qBoaardList = aService.QuestionList();
		logger.debug("size : "+ qBoaardList.size());
		logger.debug("size : "+ qBoaardList);
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("qBoaardList", qBoaardList);
		
	}
	
	@RequestMapping(value="/bulletinWrite",method=RequestMethod.GET)
	public void announcementBulletinWrite_GET() {
		logger.debug("문의 게시판 글쓰기 호출");
		logger.debug(" /adminScheduleUpload -> adminScheduleUpload_GET() 호출");

	}
	
	@RequestMapping(value="/bulletinWrite",method=RequestMethod.POST)
	public String announcementBulletinWrite_POST(Question_boardDTO dto) {
		logger.debug("문의 게시판 글쓰기 호출");
		logger.debug(" /adminScheduleUpload -> adminScheduleUpload_POST() 호출");
		
		logger.debug("dto : "+ dto);
		
		aService.QuestionJoin(dto);
		
		return "redirect:/community/community";
		
	}
	
	
}
