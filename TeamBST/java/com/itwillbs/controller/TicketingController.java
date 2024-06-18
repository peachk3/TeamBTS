package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.SeatDTO;
import com.itwillbs.domain.Team_n_stadiumDTO;
import com.itwillbs.domain.ZoneDTO;
import com.itwillbs.service.ScheduleService;

@Controller
@RequestMapping(value="/ticketing/*")
public class TicketingController {
	
	private static final Logger logger = LoggerFactory.getLogger(TicketingController.class);
	
	@Inject
	private ScheduleService sService;
	
	
    @RequestMapping(value="/ticketing", method=RequestMethod.GET)
    public String MainTicketing(@RequestParam("stad_id") String stad_id, Model model) {
        logger.debug("티켓팅 홈 페이지");
        logger.debug("stad_id : " + stad_id);

        List<Game_scheduleDTO> TeamScheduleList = sService.stadScheduleList(stad_id);
        model.addAttribute("TeamScheduleList", TeamScheduleList);
        model.addAttribute("selectedStadium", stad_id); // 선택한 stadium id를 모델에 추가

        return "ticketing/ticketing"; // 실제 JSP 페이지 이름으로 변경하세요
    }
	
	
	
	@RequestMapping(value="/ticketing",method=RequestMethod.POST)
	 public String TeamTicketing(@RequestParam("stad_id") String stad_id, Model model) {
        logger.debug("티켓팅 홈 페이지");
        logger.debug("stad_id : " + stad_id);

        List<Game_scheduleDTO> TeamScheduleList = sService.stadScheduleList(stad_id);
        model.addAttribute("TeamScheduleList", TeamScheduleList);
        model.addAttribute("selectedStadium", stad_id); // 선택한 stadium id를 모델에 추가

        return "redirect:/ticketing/ticketing?stad_id=" + stad_id; // 선택한 stadium id와 함께 GET 요청으로 리다이렉트
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
	
	
	
	@Inject
	//private StadiumService stadService;
	
	// 구장 배치도 (구역 선택)
 	@RequestMapping(value="/stadium", method = RequestMethod.GET)
	public String goStadiumGET(HttpSession session,@RequestParam("stad_id") String stad_id, Model model) {
        String user_id = (String) session.getAttribute("user_id");
        
        logger.debug("user_id : "+ user_id);
 		
        if(user_id != null) {
        	model.addAttribute("stad_id",stad_id);
        	logger.debug("goStadiumGET() 호출");
        
        	return "/ticketing/stadium";
        } else {
        	
        	logger.debug("로그인을 해야 예매하기를 할 수 있습니다");
        	
        	return "/login/loginPage";
        }
        
	}
 	
	
	// 구역 -> 좌석 선택
	@RequestMapping(value="/seats/{name}", method = RequestMethod.GET)
	public void selectSeat() {
		logger.debug("selectSeat() 호출");
	}
	
	
//	@RequestMapping(value="/stadium", method = RequestMethod.POST)
//	public String getStadium(@RequestParam("stad_id") String stad_id, Model model) {
//		logger.debug("구단 좌석 배치도 페이지 호출");
//		
//		Game_scheduleDTO stadium = stadService.getStadiumById(stad_id);
////		List<ZoneDTO> zones = stadService.getZonesByStadiumId(stad_id);
//		model.addAttribute("stadium", stadium);
////		model.addAttribute("zones", zones);
//		
//		return "/ticketing/stadium";
//	}
	
//	@RequestMapping(value="/zone", method = RequestMethod.GET)
//	public String getZone(@RequestParam("zone_id") String zone_id, Model model) {
//		logger.debug("구역 선택 페이지 호출");
//		
//		List<SeatDTO> seats = stadService.getSeatsByZoneId(zone_id);
//		model.addAttribute("seats", seats);
//		
//		return "seats";
//	}
//	
//	
	
}
