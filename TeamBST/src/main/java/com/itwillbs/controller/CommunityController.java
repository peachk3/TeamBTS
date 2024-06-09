package com.itwillbs.controller;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/community/*")
public class CommunityController {

	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	@RequestMapping(value="/community",method=RequestMethod.GET)
	public void coummnityMain() {
		logger.debug("거래 게시판 호출");

	}
	@RequestMapping(value="/communityWrite",method=RequestMethod.GET)
	public void coummnityWrite() {
		logger.debug("거래 게시판 호출");

	}
	
}
