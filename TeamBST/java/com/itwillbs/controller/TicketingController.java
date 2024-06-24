package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.SeatDTO;
import com.itwillbs.domain.Seat_bookDTO;
import com.itwillbs.domain.Seat_priceDTO;
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
 		
        // stadium -> zoneList 출력
        List<ZoneDTO> zones = stadService.getZonesByStadiumId(game_id);
        model.addAttribute("zones", zones);
        model.addAttribute("game_id", game_id);
        
        logger.debug("zones : " + zones);
        
        if(user_id != null) {
        	model.addAttribute("stad_id",stad_id);
        	logger.debug("goStadiumGET() 호출");
        
        	return "/ticketing/stadium";
        } else {
        	
        	logger.debug("로그인을 해야 예매하기를 할 수 있습니다");
        	
        	return "/login/loginPage";
        }
        
	}
	
 	
	// 좌석 선택
	@GetMapping("/displaySeats")
	public String goZone(HttpSession session,
			@RequestParam("game_id") String game_id, 
			@RequestParam("zone_ty") String zone_ty, 
			@RequestParam("zone_id") String zone_id,
			@RequestParam("stad_id") String stad_id, Model model) {
       
		String user_id = (String) session.getAttribute("user_id");
        logger.debug("@user_id : "+ user_id);
        
        // zone -> Seat 출력
        List<SeatDTO> seats = stadService.getSeatsId(game_id, zone_id);
        
        // 예매 가능 좌석 및 여부 출력
        List<Seat_bookDTO> seatBook = stadService.getSeatBooked(zone_id);
		
		model.addAttribute("game_id", game_id);
		model.addAttribute("stad_id", stad_id);
		model.addAttribute("zone_ty", zone_ty);
		model.addAttribute("zone_id", zone_id);
		model.addAttribute("seats", seats);
		model.addAttribute("seatBook", seatBook);
		
		logger.debug("seats : " + seats);
		logger.debug("zone_id : " + zone_id);
		logger.debug("game_id: " + game_id);
		logger.debug("^0^ seatBook : " + seatBook);
		
		return "/ticketing/displaySeats";
	}	

	
	// 예매 사항 확인 
	@RequestMapping (value="/reservation", method = RequestMethod.GET)
	public String bookTicket_GET(HttpSession session, 
			@RequestParam("stad_id") String stad_id, 
			@RequestParam("game_id") String game_id, 
			@RequestParam("seat_row") String seat_row, 
			@RequestParam("seat_num") String seat_num, 
			@RequestParam("zone_ty") String zone_ty, 
			@RequestParam("seat_id") String seat_id, 
			@RequestParam("zone_id")String zone_id,  Model model) {
        
		// user_id 전달
		String user_id = (String) session.getAttribute("user_id");
        logger.debug("user_id : "+ user_id);
        
        // game_id 비교해서 gameSchedulelist 가져오기 (경기 정보 출력)
        List<Game_scheduleDTO> gameSchedule = stadService.getGameSche(game_id);
        
        // user_id 비교해서 user_name 가져오기 (예매자명 출력)
        List<UserDTO> user = stadService.getUserName(user_id);
        
        // 성인 좌석 가격
        List<Seat_priceDTO> seatAdultPrice = stadService.getSeatAdultPrice(zone_id);
        
        // 초등학생 좌석 가격
        List<Seat_priceDTO> seatChildPrice = stadService.getSeatChildPrice(zone_id);
         
        model.addAttribute("gameSchedule", gameSchedule);
        model.addAttribute("user", user);
        model.addAttribute("seatAdultPrice", seatAdultPrice);
        model.addAttribute("seatChildPrice", seatChildPrice);
		model.addAttribute("stad_id", stad_id);
		model.addAttribute("game_id", game_id);
		model.addAttribute("zone_ty", zone_ty);
		model.addAttribute("seat_row", seat_row);
		model.addAttribute("seat_num", seat_num);
		model.addAttribute("zone_id", zone_id);

		logger.debug("bookTicket() 호출 ");
		
		return "/ticketing/reservation";
	}
	
	
	// **** 좌석 선택 후 이동시 booked_at 1로 변경 
	@PostMapping("/reservation")
	public String bookTicket_POST(
			@RequestParam("game_id") String game_id, 
			@RequestParam("seat_id") String seat_id, 
			@RequestParam("stad_id") String stad_id, 
			@RequestParam("seat_row") String seat_row,
			@RequestParam("seat_num") String seat_num,
			@RequestParam("zone_ty") String zone_ty,
			@RequestParam("zone_id") String zone_id,
			@RequestParam("seat_row") List<String> seatRows,
	        @RequestParam("seat_num") List<String> seatNums,
	        @RequestParam("seat_id") List<String> seatIds,
			Model model) {
		
		// game_id 출력
		Integer gameIdInteger = Integer.parseInt(game_id);
		logger.debug("(●'◡'●)"); 
		logger.debug("(●'◡'●) game_id: " + gameIdInteger);
        
		// 예매하기 버튼 클릭 시 booked_at '1'로 업데이트
		stadService.postSelectedSeat(gameIdInteger, seat_id);
		logger.debug("(●'◡'●) postSelectedSeat 실행");
		
		model.addAttribute("seatRows", seatRows);
	    model.addAttribute("seatNums", seatNums);
	    model.addAttribute("seatIds", seatIds);
		model.addAttribute("game_id", game_id);
		model.addAttribute("seat_id", seat_id);
		model.addAttribute("stad_id", stad_id);
		model.addAttribute("seat_row", seat_row);
		model.addAttribute("seat_num", seat_num);
		model.addAttribute("zone_ty", zone_ty);
		model.addAttribute("zone_id", zone_id);
		
		return "redirect:/ticketing/reservation";
	}	
	// 여기까지 성공
	
	
	
	@GetMapping(value="/payment")
	public void payTicket(HttpSession session,
		@RequestParam("stad_id") String stad_id, 
		@RequestParam("game_id") String game_id, 
		@RequestParam("seat_row") String seat_row, 
		@RequestParam("seat_num") String seat_num, 
		@RequestParam("zone_ty") String zone_ty, 
		@RequestParam("seat_id") String seat_id, 
		@RequestParam("zone_id")String zone_id,   Model model) {
	// user_id 전달
	String user_id = (String) session.getAttribute("user_id");
    logger.debug("user_id : "+ user_id);
    
    // game_id 비교해서 gameSchedulelist 가져오기 (경기 정보 출력)
    List<Game_scheduleDTO> gameSchedule = stadService.getGameSche(game_id);
    
    // user_id 비교해서 user_name 가져오기 (예매자명 출력)
    List<UserDTO> user = stadService.getUserName(user_id);
    
    // 성인 좌석 가격
    List<Seat_priceDTO> seatAdultPrice = stadService.getSeatAdultPrice(zone_id);
    
    // 초등학생 좌석 가격
    List<Seat_priceDTO> seatChildPrice = stadService.getSeatChildPrice(zone_id);
		logger.debug("payTicket() 실행");
		
	model.addAttribute("stad_id", stad_id);
	model.addAttribute("game_id", game_id);
	model.addAttribute("zone_ty", zone_ty);
	model.addAttribute("seat_row", seat_row);
	model.addAttribute("seat_num", seat_num);
	model.addAttribute("user", user);
	model.addAttribute("seat_id", seat_id);
	model.addAttribute("gameSchedule", gameSchedule);
	model.addAttribute("seatAdultPrice", seatAdultPrice);
	model.addAttribute("seatChildPrice", seatChildPrice);
	
	}
	
	
	@PostMapping(value="/payment")
	public void reservationDone(HttpSession session,
		@RequestParam("stad_id") String stad_id, 
		@RequestParam("game_id") String game_id, 
		@RequestParam("seat_row") String seat_row, 
		@RequestParam("seat_num") String seat_num, 
		@RequestParam("zone_ty") String zone_ty, 
		@RequestParam("seat_id") String seat_id, 
		@RequestParam("zone_id")String zone_id,  Model model) {
			
	// user_id 전달
	String user_id = (String) session.getAttribute("user_id");
    logger.debug("(●'◡'●) user_id : "+ user_id);
    
    // game_id 비교해서 gameSchedulelist 가져오기 (경기 정보 출력)
    List<Game_scheduleDTO> gameSchedule = stadService.getGameSche(game_id);
    
    // user_id 비교해서 user_name 가져오기 (예매자명 출력)
    List<UserDTO> user = stadService.getUserName(user_id);
    
    // 성인 좌석 가격
    List<Seat_priceDTO> seatAdultPrice = stadService.getSeatAdultPrice(zone_id);
    
    // 초등학생 좌석 가격
    List<Seat_priceDTO> seatChildPrice = stadService.getSeatChildPrice(zone_id);
		logger.debug("(●'◡'●) payTicket() 실행");
	
	model.addAttribute("stad_id", stad_id);
	model.addAttribute("game_id", game_id);
	model.addAttribute("zone_ty", zone_ty);
	model.addAttribute("seat_row", seat_row);
	model.addAttribute("seat_num", seat_num);
	model.addAttribute("user", user);
	model.addAttribute("seat_id", seat_id);
	model.addAttribute("gameSchedule", gameSchedule);
	model.addAttribute("seatAdultPrice", seatAdultPrice);
	model.addAttribute("seatChildPrice", seatChildPrice);
	
	}
	
}
