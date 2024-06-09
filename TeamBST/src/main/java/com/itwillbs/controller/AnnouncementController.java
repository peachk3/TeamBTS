package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/announcement/*")
public class AnnouncementController {
	
	private static final Logger logger = LoggerFactory.getLogger(AnnouncementController.class);

	@RequestMapping(value="/announcement",method=RequestMethod.GET)
	public void AnnouncementMain() {
		logger.debug("거래게시판 호출");

	}
	
	
	@RequestMapping(value="/bulletin",method=RequestMethod.GET)
	public void announcementBulletin() {
		logger.debug("문의게시판 호출");

	}
	@RequestMapping(value="/bulletinWrite",method=RequestMethod.GET)
	public void announcementBulletinWrite() {
		logger.debug("문의게시판 호출");

	}
	
}
