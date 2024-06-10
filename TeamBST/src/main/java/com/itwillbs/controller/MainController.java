package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	// http://localhost:8088/main/team
	@RequestMapping(value="/team/{name}",method = RequestMethod.GET)
	public void openTeam2(@PathVariable("name") String name) {
		logger.debug(name+" 페이지 호출");
		
	}
	
	
	
	
	
	
	
}
