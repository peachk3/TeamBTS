package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.Notice_boardDTO;
import com.itwillbs.domain.Post_boardDTO;
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
		model.addAttribute("qBoardList", qBoardList);
		
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
        	
        	return "redirect:/login/loginPage";
        }
        
        

	}
	
	@RequestMapping(value="/bulletinWrite",method=RequestMethod.POST)
	public String announcementBulletinWrite_POST(Question_boardDTO dto,HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		logger.debug("문의 게시판 글쓰기 호출");
		logger.debug(" /adminScheduleUpload -> adminScheduleUpload_POST() 호출");
		
		dto.setQuest_writer_id(user_id);
		
		logger.debug("dto : "+ dto);
		
		aService.QuestionJoin(dto);
		
		return "redirect:/announcement/bulletin";
		
	}
	
//  공지사항 게시판 본문 확인하기
	@GetMapping(value="/announcementContent")
	public void communityContent_GET(@RequestParam("notice_id") String notice_id, Model model) throws Exception{
		logger.debug("본문 내용 호출");
    	logger.debug(" notice_id : " + notice_id);

    	List<Post_boardDTO> noticeOneList = aService.noticeOneList(notice_id);
    	
		logger.debug("size : "+ noticeOneList.size());
		logger.debug("size : "+ noticeOneList);
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("noticeOneList", noticeOneList);
    	
	}
	
//  문의 게시판 본문 확인하기
	@GetMapping(value="/bulletinContent")
	public void bulletinContent_GET(@RequestParam("quest_id") String quest_id, Model model) throws Exception{
		logger.debug("본문 내용 호출");
    	logger.debug(" quest_id : " + quest_id);

    	List<Post_boardDTO> QuestionOneList = aService.QuestionOneList(quest_id);
    	
		logger.debug("size : "+ QuestionOneList.size());
		logger.debug("size : "+ QuestionOneList);
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("QuestionOneList", QuestionOneList);
    	
	}
	
	
	
	
	
}
