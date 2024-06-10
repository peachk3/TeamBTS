package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/ticketing/*")
public class TicketingController {
	
	private static final Logger logger = LoggerFactory.getLogger(TicketingController.class);
	
	@RequestMapping(value="/ticketing",method=RequestMethod.GET)
	public void MainTicketing() {
		logger.debug("티켓팅 홈 페이지");

	}
	@RequestMapping(value="/team/{name}",method=RequestMethod.GET)
	public void teamTicketing(@PathVariable("name") String name) {
		logger.debug(name+"티켓팅 페이지");

	}
	
}
