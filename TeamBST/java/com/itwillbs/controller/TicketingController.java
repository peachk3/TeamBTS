package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.SeatDTO;
import com.itwillbs.domain.Seat_bookDTO;
import com.itwillbs.domain.Seat_priceDTO;
import com.itwillbs.domain.Team_n_stadiumDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.ZoneDTO;
import com.itwillbs.service.ScheduleService;
import com.itwillbs.service.StadiumService;

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
	private StadiumService stadService;
	
	// 구장 배치도 (구역 선택)
 	@RequestMapping(value="/stadium", method = RequestMethod.GET)
	public String goStadiumGET(HttpSession session, 
			@RequestParam("game_id") String game_id, 
			@RequestParam("stad_id") String stad_id, Model model) {
        String user_id = (String) session.getAttribute("user_id");
        logger.debug("user_id : "+ user_id);
 		
        List<ZoneDTO> zones = stadService.getZonesByStadiumId(game_id);
        model.addAttribute("zones", zones);
        model.addAttribute("game_id", game_id);
        
        
        if(user_id != null) {
        	model.addAttribute("stad_id",stad_id);
        	logger.debug("goStadiumGET() 호출");
        
        	return "/ticketing/stadium";
        } else {
        	
        	logger.debug("로그인을 해야 예매하기를 할 수 있습니다");
        	
        	return "/login/loginPage";
        }
        
	}
 	
	
//	@GetMapping(value="/stadium")
//	public String goStadium(HttpSession session, @RequestParam("stad_id") String stad_id, Model model) {
//        String user_id = (String) session.getAttribute("user_id");
//        logger.debug("user_id : "+ user_id);
//        
//        Integer game_id = (Integer) session.getAttribute("game_id");
//        logger.debug("game_id : " + game_id);
//        
//		
//		model.addAttribute("stad_id", stad_id);
//		model.addAttribute("game_id", game_id);
//		
//		return "/ticketing/stadium";
//	}
	
 	
	// 구역배치도 선택
	@GetMapping("/displaySeats")
	public String goZone(HttpSession session,
			@RequestParam("game_id") String game_id, 
			@RequestParam("zone_ty") String zone_ty, 
			@RequestParam("zone_id") String zone_id,
			@RequestParam("stad_id") String stad_id, Model model) {
       
		String user_id = (String) session.getAttribute("user_id");
        logger.debug("@user_id : "+ user_id);
        
        // zone_id 출력
//        String zoneId = stadService.getZoneId(zone_ty, game_id);
        
		List<SeatDTO> seats = stadService.getSeatsByZone(zone_ty, game_id);
		
		model.addAttribute("game_id", game_id);
		model.addAttribute("stad_id", stad_id);
		model.addAttribute("zone_ty", zone_ty);
		model.addAttribute("zone_id", zone_id);
		model.addAttribute("seats", seats);
		return "/ticketing/displaySeats";
	}	
	
	
	@GetMapping(value="/reservation")
	public String bookTicket(HttpSession session, 
			@RequestParam("stad_id") String stad_id, 
			@RequestParam("game_id") String game_id, 
			@RequestParam("seat_row") String seat_row, 
			@RequestParam("seat_num") String seat_num, 
			@RequestParam("zone_ty") String zone_ty, 
			@RequestParam("seat_id") String seat_id, 
			@RequestParam("zone_id")String zone_id,  Model model) {
        
		String user_id = (String) session.getAttribute("user_id");
        logger.debug("user_id : "+ user_id);
        
        // seat_id 비교해서 seatList 가져오기 (seat_row, num ...)
		List<SeatDTO> seats = stadService.getSeatsId(seat_id);
	
		// game_id 비교해서 gameSchedulelist 가져오기
		List<Game_scheduleDTO> gameSchedule = stadService.getGameSche(game_id);
	
		// user_id 비교해서 user_name 가져오기
		List<UserDTO> user = stadService.getUserName(user_id);
		
		// 성인 좌석 가격
		List<Seat_priceDTO> seatAdultPrice = stadService.getSeatAdultPrice(zone_id);
		
		// 초등학생 좌석 가격
		List<Seat_priceDTO> seatChildPrice = stadService.getSeatChildPrice(zone_id);
				
		Integer gameIdInteger = Integer.parseInt(game_id);
	        
			logger.debug("@@@@"); 
			logger.debug("game_id: " + gameIdInteger);
			// 예매하기 버튼 클릭 시 booked_at '1'로 업데이트
			stadService.postSelectedSeat(gameIdInteger, seat_id);
			
		// 선택된 좌석 출력
//		List<SeatDTO> selectedSeatList = stadService.selectedSeatList()
		
		model.addAttribute("stad_id", stad_id);
		model.addAttribute("game_id", game_id);
		model.addAttribute("zone_ty", zone_ty);
		model.addAttribute("seat_row", seat_row);
		model.addAttribute("seat_num", seat_num);
//		model.addAttribute("zone_id", zone_id);
// 		model.addAttribute("seat_id", seat_id);
		model.addAttribute("seats", seats);
//		model.addAttribute("user_name", user_name);
		model.addAttribute("user", user);
		model.addAttribute("gameSchedule", gameSchedule);
		model.addAttribute("seatAdultPrice", seatAdultPrice);
		model.addAttribute("seatChildPrice", seatChildPrice);
		
		logger.debug("bookTicket() 호출 ");
		
		return "/ticketing/reservation";
	}
	
	// **** 좌석 선택 후 이동시 booked_at 1로 변경 
	@PostMapping("/reservation")
	public String updateBooked(HttpSession session, @RequestParam("game_id") String game_id, @RequestParam("seat_id") String seat_id) {
		String user_id = (String) session.getAttribute("user_id");
		logger.debug("user_id : "+ user_id);
		
		// Convert game_id to Integer if needed
		Integer gameIdInteger = Integer.parseInt(game_id);
		
		logger.debug("@@@@"); 
		logger.debug("game_id: " + gameIdInteger);
		// 예매하기 버튼 클릭 시 booked_at '1'로 업데이트
		stadService.postSelectedSeat(gameIdInteger, seat_id);
		
		return "redirect:/ticketing/reservation";
	}
	
	// 여기까지 성공
	
	@PostMapping(value="/payment")
	public void payTicket(HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		logger.debug("user_id : " + user_id);
		
		logger.debug("payTicket()");
	}
	
	
//	public String goSeat(@PathVariable)
	
	
//	@GetMapping(value="/displaySeats")
//	public void goZoneGET(/*@RequestParam("zone_id") String zone_id*/) {
//		
//		logger.debug("goZoneGET() 호출");
//	}
//	@GetMapping(value="/displaySeats/{stad_id}")
//	public void goZoneGET(@PathVariable String stad_id, @RequestParam String game_id, Model model) {
//		List<ZoneDTO> zones = stadService.get
// 		logger.debug("goZoneGET() 호출");
//	}
//	
	
	
//	@GetMapping(value="/displaySeats")
//	public void goZoneGET(@RequestParam("zone_id") String zone_id, Model model) {
//		List<SeatDTO> seats = stadService.getSeatsByZoneId(zone_id);
//		model.addAttribute("seats", seats);
//		model.addAttribute("zone_id", zone_id );
//		
//		logger.debug(" goZoneGET() 호출");
//	}
//	
	
//	@GetMapping(value="/seats")
//	public String goZoneGET(@RequestParam("zone_id") String zone_id, Model model) {
//		List<SeatDTO> seats = stadService.getSeatsByZoneId(zone_id);
//		model.addAttribute("seats", seats);
//		model.addAttribute("zone_id", zone_id); // zone_id 전달
//		logger.debug(" goZoneGET 호출 ");
//		
//		return "seats";
//	}
//	
	
//	 @GetMapping(value = "/ticketing/zones/{stad_id}")
//	    public String zonesPage(@PathVariable String stad_id, @RequestParam int schedule_id, Model model) {
//	        List<ZoneDTO> zones = stadService.getZonesByStadiumId(stad_id);
//	        model.addAttribute("zones", zones);
//	        model.addAttribute("stad_id", stad_id); // 추가된 부분: stad_id 전달
//	        model.addAttribute("schedule_id", schedule_id); // 추가된 부분: schedule_id 전달
//	        return "zones";
//	    }
//
//	    @GetMapping("/ticketing/seats/{zone_id}")
//	    public String seatsPage(@PathVariable String zone_id, @RequestParam int schedule_id, Model model) {
//	        List<SeatDTO> seats = stadService.getSeatsByZoneId(zone_id);
//	        model.addAttribute("seats", seats);
//	        model.addAttribute("zone_id", zone_id); // 추가된 부분: zone_id 전달
//	        model.addAttribute("schedule_id", schedule_id); // 추가된 부분: schedule_id 전달
//	        return "seats";
//	    }

//	    @GetMapping("/reservation")
//	    public String reservationPage(@RequestParam int schedule_id, @RequestParam int seat_id, Model model) {
////	        ScheduleDTO schedule = sService.getScheduleById(schedule_id);
////	        SeatDTO seat =  sService.getSeatById(seat_id);
//	        model.addAttribute("schedule", schedule);
//	        model.addAttribute("seat", seat);
//	        return "reservation";
//	    }

	

//	
//	// 구역 -> 좌석 선택
//	@RequestMapping(value="/displaySeats", method = RequestMethod.GET)
//	public void selectSeat(@RequestParam("zone_id") String zone_id, Model model) {
//		
//		model.addAttribute("zone_id", zone_id);
//		
//		logger.debug("selectSeat() 호출");
//	}
//	
	
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
	
	
}
