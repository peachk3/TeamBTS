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
@RequestMapping(value="/main/*")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
		
	@Inject
	private ScheduleService sService;
	
	
	//http://localhost:8088/main/main
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public void openMain() {
		logger.debug("홈페이지 호출");

	}
	
	// http://localhost:8088/main/team
	@RequestMapping(value="/team",method = RequestMethod.GET)
	public void openTeam_GET() {
		logger.debug("팀페이지 호출");

	}

	// http://localhost:8088/main/team
	@RequestMapping(value="/team/{name}",method = RequestMethod.GET)
	public void openTeam2(@PathVariable("name") String name,Model model) {
		logger.debug(name+" 페이지 호출");
		
		// list 호출
		List<Game_scheduleDTO> GameScheduleList = sService.gameScheduleList(name);
		
//		logger.debug(" GameScheduleList : "+GameScheduleList.size());

		model.addAttribute("GameScheduleList", GameScheduleList);

		
	
	}
	
	
	
	
	
	
	
}
