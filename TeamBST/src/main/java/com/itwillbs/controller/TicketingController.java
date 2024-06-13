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
	// 경기 정보 페이지
	@RequestMapping(value="/gameInfo",method=RequestMethod.GET)
	public String gameInfo(@RequestParam("game_id") String game_id, Model model) {
		// gameId를 사용하여 필요한 로직을 수행합니다.
        // 예: 게임 정보를 조회하고 모델에 추가
		
		logger.debug("게임 정보 페이지 호출");
		List<Game_scheduleDTO> homeTeamInfoList = sService.homeTeamInfoList(game_id);
		List<Game_scheduleDTO> awayTeamInfoList = sService.awayTeamInfoList(game_id);
		
		model.addAttribute("homeTeamInfoList", homeTeamInfoList);
		model.addAttribute("awayTeamInfoList", awayTeamInfoList);
		
		 
		// 새로운 JSP 페이지로 이동
		return "/ticketing/gameInfo"; // 반환할 JSP 페이지 이름
	}
	
	
	// 구장 좌석 배치도 출력
	@RequestMapping(value="/stadium", method = RequestMethod.GET)
	public void showStadiumArea() {
		logger.debug(" 구장 배치도 페이지 ");

	}
	
	@RequestMapping(value="/seats/{name}", method = RequestMethod.GET)
	public void selectZone() {
		logger.debug(" 구장 배치도 - 구역 선택");
	}
}
