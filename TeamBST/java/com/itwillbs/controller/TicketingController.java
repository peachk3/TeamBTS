package com.itwillbs.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Reservation_infoDTO;
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
    public String MainTicketing(@RequestParam("stad_id") String stad_id, Model model) throws Exception{
        logger.debug("티켓팅 홈 페이지 - GET");
        logger.debug("stad_id : " + stad_id);

        List<Game_scheduleDTO> TeamScheduleList = sService.stadScheduleList(stad_id);
        
		model.addAttribute("TeamScheduleList", TeamScheduleList);
	    model.addAttribute("selectedStadId", stad_id); // 선택된 stad_id를 모델에 추가

        return "/ticketing/ticketing"; // 실제 JSP 페이지 이름으로 변경하세요
    }
	
	
	
	@RequestMapping(value="/ticketing",method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	 public String TeamTicketing(@RequestParam("stad_id") String stad_id, Model model) throws Exception{
        logger.debug("티켓팅 홈 페이지- POST");
        logger.debug("stad_id : " + stad_id);

        // 경기 정보 호출
//        List<Game_scheduleDTO> TeamScheduleList = sService.stadScheduleList(stad_id);
        List<Game_scheduleDTO> TeamScheduleList = sService.stadScheduleList(stad_id);
        
        // 페이징 처리된 경기 정보 호출
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule()); // Java 8 날짜 타입 지원
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false); // 타임스탬프로 변환하지 않음
        // 원하는 날짜 포맷 설정 (예: "yyyy-MM-dd")
        mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
        
        String jsonTeamScheduleList = mapper.writeValueAsString(TeamScheduleList);
        logger.debug("jsonTeamScheduleList : " + jsonTeamScheduleList);

        return jsonTeamScheduleList;

//        return "redirect:/ticketing/ticketing?stad_id=" + stad_id; // 선택한 stadium id와 함께 GET 요청으로 리다이렉트
    }
	
	
	
	// 경기 정보 페이지
	@RequestMapping(value="/gameInfo",method=RequestMethod.GET)
	public String gameInfo(@RequestParam("game_id") String game_id, Model model) throws Exception{
		// gameId를 사용하여 필요한 로직을 수행합니다.
        // 예: 게임 정보를 조회하고 모델에 추가
		
		logger.debug("게임 정보 페이지 호출");
		List<Game_scheduleDTO> homeTeamInfoList = sService.homeTeamInfoList(game_id);
		List<Game_scheduleDTO> awayTeamInfoList = sService.awayTeamInfoList(game_id);
		
		model.addAttribute("homeTeamInfoList", homeTeamInfoList);
		model.addAttribute("awayTeamInfoList", awayTeamInfoList);
	    model.addAttribute("game_id", game_id); // game_id를 모델에 추가

		 
		// 새로운 JSP 페이지로 이동
		return "/ticketing/gameInfo"; // 반환할 JSP 페이지 이름
	}
	
	
	
	@Inject
	private StadiumService stadService;
	
	// 구장 배치도 (구역 선택)
 	@RequestMapping(value="/stadium", method = RequestMethod.GET)
	public String goStadiumGET(HttpSession session, 
			@RequestParam("game_id") String game_id, 
			@RequestParam("stad_id") String stad_id,
			HttpServletRequest request,Model model) throws Exception {
 		
 		
        String user_id = (String) session.getAttribute("user_id");
        logger.debug("user_id : "+ user_id);
        logger.debug("game_id : "+game_id);
        
        
        if(user_id != null) {
        	logger.debug("game_id : "+game_id);
        	logger.debug("goStadiumGET() 호출");
        
        	// stadium -> zoneList 출력
        	List<ZoneDTO> zones = stadService.getZonesByStadiumId(game_id);
        	model.addAttribute("zones", zones);
        	model.addAttribute("game_id", game_id);
        	model.addAttribute("stad_id",stad_id);
        	
        	logger.debug("zones : " + zones);
        } if (session.getAttribute("user_id") == null) {
            String redirectUrl = request.getRequestURL().toString();
            String queryString = request.getQueryString();
            if (queryString != null) {
                redirectUrl += "?" + queryString;
            }
            session.setAttribute("alertMessage", "로그인을 해야 예매할수있습니다");
            return "redirect:/login/loginPage?redirect=" + URLEncoder.encode(redirectUrl, "UTF-8");
        }
        
        return "/ticketing/stadium";
	}

 	
	// 좌석 선택
	@GetMapping("/displaySeats")
	public String goZone(HttpSession session,
			@RequestParam("game_id") String game_id, 
			@RequestParam("zone_ty") String zone_ty, 
			@RequestParam("zone_id") String zone_id,
			@RequestParam("stad_id") String stad_id, Model model) throws Exception{
       
		String user_id = (String) session.getAttribute("user_id");
        logger.debug("@user_id : "+ user_id);
        
        // zone -> Seat 출력
        List<SeatDTO> seats = stadService.getSeatsId(game_id, zone_id);
        
        // 예매 가능 좌석 및 여부 출력
//        List<Seat_bookDTO> seatBook = stadService.getSeatBooked(zone_id, game_id);
		
		model.addAttribute("game_id", game_id);
		model.addAttribute("stad_id", stad_id);
		model.addAttribute("zone_ty", zone_ty);
		model.addAttribute("zone_id", zone_id);
		model.addAttribute("seats", seats);
		
		logger.debug("seats : " + seats);
		logger.debug("zone_id : " + zone_id);
		logger.debug("game_id: " + game_id);
		
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
			@RequestParam("zone_id")String zone_id,  Model model) throws Exception{
        
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
		
		logger.debug("user^-^ : " + user);

		logger.debug("bookTicket() 호출 ");
		
		return "/ticketing/reservation";
	}
	
	
	// **** 좌석 선택 후 이동시 booked_at 1로 변경 
	@PostMapping("/reservation")
	public String bookTicket_POST (
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
			Model model) throws Exception{
		
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
	public String payTicket(HttpSession session,
		@RequestParam("stad_id") String stad_id, 
		@RequestParam("game_id") String game_id, 
		@RequestParam("seat_row") String seat_row, 
		@RequestParam("seat_num") String seat_num, 
		@RequestParam("zone_ty") String zone_ty, 
		@RequestParam("seat_id") String seat_id, 
		@RequestParam("zone_id")String zone_id,   Model model) throws Exception{
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
		logger.debug("payTicketGET() 실행");
		
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
	
	
	return "/ticketing/payment";
	}
	
	@ResponseBody
	@PostMapping(value="/payment")
	public String reservationDone(@RequestBody Reservation_infoDTO resInfo) throws Exception{
    
	logger.debug("request Data : " + resInfo);
	logger.debug("userID : " + resInfo.getUser_id());
	
	List<String> seats = resInfo.getSeats();  // 좌석 ID 배열을 DTO에서 직접 가져오도록 수정 필요

    // 좌석 ID 배열을 DTO의 개별 필드에 매핑
    if (seats.size() > 0) resInfo.setSeat1_id(seats.size() > 0 ? seats.get(0) : null);
    if (seats.size() > 1) resInfo.setSeat2_id(seats.size() > 1 ? seats.get(1) : null);
    if (seats.size() > 2) resInfo.setSeat3_id(seats.size() > 2 ? seats.get(2) : null);
    if (seats.size() > 3) resInfo.setSeat4_id(seats.size() > 3 ? seats.get(3) : null);
    if (seats.size() > 4) resInfo.setSeat5_id(seats.size() > 4 ? seats.get(4) : null);
    if (seats.size() > 5) resInfo.setSeat6_id(seats.size() > 5 ? seats.get(5) : null);
    if (seats.size() > 6) resInfo.setSeat7_id(seats.size() > 6 ? seats.get(6) : null);
    if (seats.size() > 7) resInfo.setSeat8_id(seats.size() > 7 ? seats.get(7) : null);

    // 좌석 ID들이 제대로 매핑되었는지 확인
    logger.debug("seat1_id: " + resInfo.getSeat1_id());
    logger.debug("seat2_id: " + resInfo.getSeat2_id());
    logger.debug("seat3_id: " + resInfo.getSeat3_id());
    logger.debug("seat4_id: " + resInfo.getSeat4_id());
    logger.debug("seat5_id: " + resInfo.getSeat5_id());
    logger.debug("seat6_id: " + resInfo.getSeat6_id());
    logger.debug("seat7_id: " + resInfo.getSeat7_id());
    logger.debug("seat8_id: " + resInfo.getSeat8_id());
	 // 좌석 ID들을 하나씩 확인하면서 비어있지 않은 좌석만 처리
//    String[] seats = {resInfo.getSeat1_id(), resInfo.getSeat2_id(), resInfo.getSeat3_id(),
//                      resInfo.getSeat4_id(), resInfo.getSeat5_id(), resInfo.getSeat6_id(),
//                      resInfo.getSeat7_id(), resInfo.getSeat8_id()};
//
//    for (String seatId : seats) {
//        if (seatId != null && !seatId.isEmpty()) {
//            logger.debug("Processing seat ID: " + seatId);
//            // 각 좌석 ID에 대한 처리 로직 작성
//        }
//    }
		
	stadService.updateReser(resInfo);
	
	return "/mypage/mypage";
	
	}
	
}
