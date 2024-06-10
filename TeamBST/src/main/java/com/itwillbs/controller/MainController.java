package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/main/*")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
		
	//http://localhost:8088/main/main
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public void openMain() {
		logger.debug("홈페이지 호출");

	}
	
	// http://localhost:8088/main/team
	@RequestMapping(value="/team",method = RequestMethod.GET)
	public void openTeam() {
		logger.debug("팀페이지 호출");

	}
	
	
	// http://localhost:8088/main/team/kia
	@RequestMapping(value="/team/kia",method = RequestMethod.GET)
	public void teamKia() {
		logger.debug("기아 홈페이지 호출");

	}
	
	// http://localhost:8088/main/team/lg
	@RequestMapping(value="/team/lg",method = RequestMethod.GET)
	public void teamLg() {
		logger.debug("엘지 홈페이지 호출");

	}
	// http://localhost:8088/main/team/samsung
	@RequestMapping(value="/team/samsung",method = RequestMethod.GET)
	public void teamSamsung() {
		logger.debug("삼성 홈페이지 호출");

	}
	// http://localhost:8088/main/team/dosan
	@RequestMapping(value="/team/dosan",method = RequestMethod.GET)
	public void teamDosan() {
		logger.debug("두산 홈페이지 호출");

	}
	// http://localhost:8088/main/team/ssg
	@RequestMapping(value="/team/ssg",method = RequestMethod.GET)
	public void teamSsg() {
		logger.debug("ssg 홈페이지 호출");

	}
	// http://localhost:8088/main/team/kt
	@RequestMapping(value="/team/kt",method = RequestMethod.GET)
	public void teamKt() {
		logger.debug("KT 홈페이지 호출");

	}
	
	// http://localhost:8088/main/team/hanhwa
	@RequestMapping(value="/team/hanhwa",method = RequestMethod.GET)
	public void teamHanhwa() {
		logger.debug("한화 홈페이지 호출");

	}
	// http://localhost:8088/main/team/lotte
	@RequestMapping(value="/team/lotte",method = RequestMethod.GET)
	public void teamLotte() {
		logger.debug("롯데 홈페이지 호출");

	}
	
	// http://localhost:8088/main/team/kiwoom
	@RequestMapping(value="/team/kiwoom",method = RequestMethod.GET)
	public void teamKiwoom() {
		logger.debug("키움 홈페이지 호출");

	}
	// http://localhost:8088/main/team/nc
	@RequestMapping(value="/team/nc",method = RequestMethod.GET)
	public void teamNc() {
		logger.debug("엔씨 홈페이지 호출");

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
