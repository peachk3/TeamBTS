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
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Team_n_stadiumDTO;
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
	
	@RequestMapping(value="/ticketing",method=RequestMethod.POST)
	public void TeamTicketing(@RequestParam("stad_id") String stad_id,Model model) {
		logger.debug("티켓팅 홈 페이지");
		
		logger.debug("stad_id : " + stad_id);

		List<Game_scheduleDTO> TeamScheduleList = sService.stadScheduleList(stad_id);
		
//		logger.debug(" GameScheduleList : "+GameScheduleList.size());

		model.addAttribute("TeamScheduleList", TeamScheduleList);

		
	}
	
	
	
	
}
