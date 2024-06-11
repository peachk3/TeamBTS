package com.itwillbs.controller;

import javax.inject.Inject;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.Notice_boardDTO;
import com.itwillbs.service.AdminService;

@Controller
@RequestMapping(value="/admin/*")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	// 서비스 객체 주입
	@Inject
	private AdminService aService;

	//http://localhost:8088/admin/admin
	@RequestMapping(value="/admin",method=RequestMethod.GET)
	public void adminMain_GET() {
		logger.debug("관리자 페이지 호출");

	}
	
	
	
	@RequestMapping(value="/adminNotice",method=RequestMethod.GET)
	public void adminNotice_GET() {
		logger.debug("관리자 공지사항 호출");

	}
	
	@RequestMapping(value="/adminNoticeWrite",method=RequestMethod.GET)
	public void adminNoticeWrite_GET() {
		logger.debug("관리자 공지사항 글쓰기 호출");
		logger.debug(" /adminNoticeWrite -> adminNoticeWrite_GET() 호출");
	}	
	
	@RequestMapping(value="/adminNoticeWrite",method=RequestMethod.POST)
	public String adminNoticeWrite_POST(Notice_boardDTO dto) {
		logger.debug("관리자 공지사항 글쓰기 호출");
		logger.debug(" /adminNoticeWrite -> adminNoticenWrite_POST() 호출");
		
		logger.debug("dto : "+ dto);
		
		aService.NoticeJoin(dto);
		
		return "redirect:/admin/adminNotice";
	}	
	
	
	
	@RequestMapping(value="/adminMember",method=RequestMethod.GET)
	public void adminMember_GET() {
		logger.debug("관리자 회원현황 호출");

	}
	
	@RequestMapping(value="/adminGeneralMember",method=RequestMethod.GET)
	public void adminGeneralMember_GET() {
		logger.debug("관리자 일반회원 호출");
		
	}	
	
	@RequestMapping(value="/adminWithdrawMember",method=RequestMethod.GET)
	public void adminWithdrawMember_GET() {
		logger.debug("관리자 탈퇴회원 호출");
		
	}

	
	
	@RequestMapping(value="/adminSchedule",method=RequestMethod.GET)
	public void adminSchedule_GET() {
		logger.debug("관리자 경기일정 호출");

	}	
	
	@RequestMapping(value="/adminScheduleUpload",method=RequestMethod.GET)
	public void adminScheduleUpload_GET() {
		logger.debug("관리자 경기일정 업로드 호출");

	}
	
	@RequestMapping(value="/adminScheduleUpload",method=RequestMethod.POST)
	public void adminScheduleUpload_POST() {
		logger.debug("관리자 경기일정 업로드 호출");
		
	}
	
	
	
	@RequestMapping(value="/adminBulletin",method=RequestMethod.GET)
	public void adminWithdrawBulletin_GET() {
		logger.debug("관리자 문의 게시판 호출");

	}
	
	@RequestMapping(value="/adminBulletinWrite",method=RequestMethod.GET)
	public void adminBulletinWrite_GET() {
		logger.debug("관리자 문의 게시판 답변 글쓰기 호출");
	}	
	
	
}
