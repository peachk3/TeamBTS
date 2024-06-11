package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.service.ScheduleService;

@Controller
@RequestMapping(value="/ticketing/*")
public class TicketingController {
	
	private static final Logger logger = LoggerFactory.getLogger(TicketingController.class);
	
	@Inject
	private ScheduleService sService;
	
	
	@RequestMapping(value="/ticketing",method=RequestMethod.GET)
	public void MainTicketing() {
		logger.debug("티켓팅 홈 페이지");

	}
	@RequestMapping(value="/team/{name}",method=RequestMethod.GET)
	public void teamTicketing(@PathVariable("name") String name,Model model) {
		logger.debug(name+"티켓팅 페이지");
		
		// list 호출
		List<Game_scheduleDTO> GameScheduleList = sService.gameScheduleList(name);
		
//		logger.debug(" GameScheduleList : "+GameScheduleList.size());

		model.addAttribute("GameScheduleList", GameScheduleList);
		
		
	}
	
}
