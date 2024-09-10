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
	public List<ZoneDTO> getZonesByStadiumId(@RequestParam("game_id") String game_id) throws Exception;
	
	// zone -> Seat 출력
    public List<SeatDTO> getSeatsByZone(@RequestParam("zone_ty") String zone_ty, @RequestParam("game_id") String game_id) throws Exception;

    // user_id 비교해서 user_name 가져오기 (예매자명 출력)
	public List<UserDTO> getUserName(@RequestParam("user_id") String user_id) throws Exception;

	// game_id 비교해서 gameSchedulelist 가져오기 (경기 정보 출력)
	public List<Game_scheduleDTO> getGameSche(@RequestParam("game_id")String game_id) throws Exception;

	// 성인 좌석 가격
	public List<Seat_priceDTO> getSeatAdultPrice(@RequestParam("zone_id") String zone_id) throws Exception;

	// 초등학생 좌석 가격
	public List<Seat_priceDTO> getSeatChildPrice(@RequestParam("zone_id") String zone_id) throws Exception;

	// 좌석 정보 업데이트 (booked_at = 1로 업데이트)
	public void postSelectedSeat(@RequestParam("game_id") Integer game_id, @RequestParam("seat_id") String seat_id) throws Exception;

	// zone -> seat 출력
	public List<SeatDTO> getSeatsId(@RequestParam("game_id") String game_id, @RequestParam("zone_id") String zone_id) throws Exception;

	// 예매 가능 좌석 및 여부 출력 
	public List<Seat_bookDTO> getSeatBooked(@RequestParam("zone_id") String zone_id, @RequestParam("game_id") String game_id) throws Exception;


    
    
    
}