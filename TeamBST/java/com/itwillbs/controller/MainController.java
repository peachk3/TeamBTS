package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Team_n_stadiumDTO;
import com.itwillbs.service.ScheduleService;

@Controller
@RequestMapping(value="/main/*")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
		
	@Inject
	private ScheduleService sService;
	
	//http://localhost:8088/main/main
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public void openMain() throws Exception{
		logger.debug("홈페이지 호출");

	}
	
	// http://localhost:8088/main/team
	@RequestMapping(value="/team",method = RequestMethod.GET)
	public void openTeam_GET() throws Exception{
		logger.debug("팀페이지 호출");

	}

	// http://localhost:8088/main/teamPage
	@RequestMapping(value="/teamPage",method = RequestMethod.GET)
	public String openTeam2(@RequestParam("team_id") String team_id,Model model) throws Exception{
		logger.debug(team_id+" 페이지 호출");
		
		// list 호출
		List<Game_scheduleDTO> GameScheduleList = sService.gameScheduleList(team_id);
		model.addAttribute("GameScheduleList", GameScheduleList);
		
//		logger.debug(" GameScheduleList : "+GameScheduleList.size());

		List<Team_n_stadiumDTO> TeamInfo = sService.teamInfo(team_id);
		model.addAttribute("TeamInfo", TeamInfo);

		
		 return "/main/teamPage"; // 팀 페이지의 JSP 파일 이름
	}
	
	@GetMapping(value="/about")
	public void about() {
		logger.debug("about 페이지 호출");

		
	}
	
	
	
	
}
