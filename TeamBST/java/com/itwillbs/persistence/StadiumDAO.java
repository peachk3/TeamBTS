package com.itwillbs.persistence;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.SeatDTO;
import com.itwillbs.domain.Seat_bookDTO;
import com.itwillbs.domain.Seat_priceDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.ZoneDTO;

public interface StadiumDAO {
	
	// stadium -> zoneList 출력
	public List<ZoneDTO> getZonesByStadiumId(@RequestParam("game_id") String game_id);
	
	// zone -> Seat 출력
    public List<SeatDTO> getSeatsByZone(@RequestParam("zone_ty") String zone_ty, @RequestParam("game_id") String game_id);

    // user_id 비교해서 user_name 가져오기 (예매자명 출력)
	public List<UserDTO> getUserName(@RequestParam("user_id") String user_id);

	// game_id 비교해서 gameSchedulelist 가져오기 (경기 정보 출력)
	public List<Game_scheduleDTO> getGameSche(@RequestParam("game_id")String game_id);

	// 성인 좌석 가격
	public List<Seat_priceDTO> getSeatAdultPrice(@RequestParam("zone_id") String zone_id);

	// 초등학생 좌석 가격
	public List<Seat_priceDTO> getSeatChildPrice(@RequestParam("zone_id") String zone_id);

	// 좌석 정보 업데이트 (booked_at = 1로 업데이트)
	public void postSelectedSeat(@RequestParam("game_id") Integer game_id, @RequestParam("seat_id") String seat_id);

//	// Team
//	public Game_scheduleDTO getStadiumById(@RequestParam("game_id") String stad_id);


    // Seat
//    public List<SeatDTO> getSeatsByZoneId(@RequestParam("zone_id") String zone_id);
    
	
    // zone -> Seat
//	public List<SeatDTO> getSeatsId(@RequestParam("zone_id") String zone_id);
	public List<SeatDTO> getSeatsId(@RequestParam("game_id") String game_id, @RequestParam("zone_id") String zone_id);
//	public List<SeatDTO> getSeatsId(@RequestParam("zone_id") String zone_id, @RequestParam("game_id")String game_id);

//	public List<Seat_bookDTO> getBookedAt(@RequestParam("game_id")String game_id, @RequestParam("zone_id")String zone_id);

//	public String getZoneID(@RequestParam("zone_ty")String zone_ty, @RequestParam("game_id")String game_id);

	// 선택된 좌석 상태 변경하기
	// public List<SeatDTO> getSelectedSeat(@RequestParam("seat_id") String seat_id);
    
//    public SeatDTO getSeatByZone(@RequestParam("seat_id") String seat_id);

    
    
    
}