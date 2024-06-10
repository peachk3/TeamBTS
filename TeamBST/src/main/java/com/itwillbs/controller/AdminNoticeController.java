package com.itwillbs.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.service.AdminNoticeService;

@Controller
@RequestMapping(value = "/admin/notice/*")
public class AdminNoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);
	
	@Inject
	private AdminNoticeService anService;
	
	// http://localhost:8088/admin/notice
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public void mainGet() {
		logger.debug("/main -> mainGET() 호출");
		logger.debug("/member/main.jsp 페이지 이동");
		
	}

	// http://localhost:8088/admin/notice
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listGet() {
		
		
	}
	
}
