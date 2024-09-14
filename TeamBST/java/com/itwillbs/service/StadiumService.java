package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Reservation_infoDTO;
import com.itwillbs.domain.SeatDTO;
import com.itwillbs.domain.Seat_bookDTO;
import com.itwillbs.domain.Seat_priceDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.ZoneDTO;

@Service
public interface StadiumService {

	// stadium -> zoneList 출력
	public List<ZoneDTO> getZonesByStadiumId(String game_id) throws Exception;
	
	// zone -> Seat 출력 (displaySeats)
	public List<SeatDTO> getSeatsId(String game_id, String zone_id) throws Exception;
	
	// user_id -> user_name 전달
	public List<UserDTO> getUserName(String user_id) throws Exception;
		
	// game_id 비교해서 gameSchedulelist 가져오기 (경기 정보 출력)
	public List<Game_scheduleDTO> getGameSche(String game_id) throws Exception;
	
	// 성인 좌석 가격
	public List<Seat_priceDTO> getSeatAdultPrice(String zone_id) throws Exception;

	// 초등학생 좌석 가격
	public List<Seat_priceDTO> getSeatChildPrice(String zone_id) throws Exception;

	// 좌석 정보 업데이트 (booked_at = 1로 업데이트)
	public void postSelectedSeat(Integer game_id, String seat_id) throws Exception;

	// 좌석 예약 
	public void updateReser(Reservation_infoDTO resInfo) throws Exception;


	// 예매 가능 좌석 및 여부 출력 
//	public List<Seat_bookDTO> getSeatBooked(String zone_id, String game_id) throws Exception;
	
}
