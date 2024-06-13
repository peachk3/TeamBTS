package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		List<Post_boardDTO> gScheduleList = cService.PostList();
		logger.debug("size : "+ gScheduleList.size());
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("gScheduleList", gScheduleList);

	}
	
	@RequestMapping(value="/communityWrite",method=RequestMethod.GET)
	public void coummnityWrite_GET() {
		logger.debug("거래 게시판 호출");
		logger.debug(" /adminScheduleUpload -> adminScheduleUpload_GET() 호출");

	}
	
	@RequestMapping(value="/communityWrite",method=RequestMethod.POST)
	public String coummnityWrite_POST(Post_boardDTO dto) {
		logger.debug("거래 게시판 호출");
		logger.debug(" /adminScheduleUpload -> adminScheduleUpload_POST() 호출");
		
		logger.debug("dto : "+ dto);
		
		cService.PostJoin(dto);
		
		return "redirect:/admin/adminSchedule";
		
	}
	
}
