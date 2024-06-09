package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/admin/*")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@RequestMapping(value="/admin",method=RequestMethod.GET)
	public void adminMain() {
		logger.debug("관리자 페이지 호출");

	}
	
	@RequestMapping(value="/adminBulletin",method=RequestMethod.GET)
	public void adminWithdrawBulletin() {
		logger.debug("관리자 페이지 호출");

	}
	
	@RequestMapping(value="/adminBulletinWrite",method=RequestMethod.GET)
	public void adminBulletinWrite() {
		logger.debug("관리자 페이지 호출");

	}	
	@RequestMapping(value="/adminGeneralMember",method=RequestMethod.GET)
	public void adminGeneralMember() {
		logger.debug("관리자 페이지 호출");

	}	
	@RequestMapping(value="/adminMember",method=RequestMethod.GET)
	public void adminMember() {
		logger.debug("관리자 페이지 호출");

	}
	
	@RequestMapping(value="/adminNotice",method=RequestMethod.GET)
	public void adminNotice() {
		logger.debug("관리자 페이지 호출");

	}	
	@RequestMapping(value="/adminNoticeWrite",method=RequestMethod.GET)
	public void adminNoticeWrite() {
		logger.debug("관리자 페이지 호출");

	}	
	@RequestMapping(value="/adminSchedule",method=RequestMethod.GET)
	public void adminSchedule() {
		logger.debug("관리자 페이지 호출");

	}	
	@RequestMapping(value="/adminScheduleUpload",method=RequestMethod.GET)
	public void adminScheduleUpload() {
		logger.debug("관리자 페이지 호출");

	}
	
	@RequestMapping(value="/adminWithdrawMember",method=RequestMethod.GET)
	public void adminWithdrawMember() {
		logger.debug("관리자 페이지 호출");

	}
	
	
}
