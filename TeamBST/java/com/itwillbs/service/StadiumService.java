package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.SeatDTO;
import com.itwillbs.domain.Seat_bookDTO;
import com.itwillbs.domain.Seat_priceDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.ZoneDTO;

@Service
public interface StadiumService {

	
//	public Game_scheduleDTO getStadiumById(String stad_id);
	
//	public ZoneDTO getZonesByStadiumId(String Zone_id);
	
//	public List<ZoneDTO> getZonesByStadiumId(String stad_id);
	
//	public List<SeatDTO> getSeatsByZoneId(String zone_id);
	
//	public SeatDTO getSeatById(String seat_id);

	public List<ZoneDTO> getZonesByStadiumId(String game_id);

	public List<SeatDTO> getSeatsByZone(String zone_ty, String game_id);
	
	public List<SeatDTO> getSeatsId(String seat_id);

	public List<UserDTO> getUserName(String user_id);

	public List<Game_scheduleDTO> getGameSche(String game_id);

	public void postSelectedSeat(Integer game_id, String seat_id);

	public List<Seat_priceDTO> getSeatAdultPrice(String zone_id);

	public List<Seat_priceDTO> getSeatChildPrice(String zone_id);

//	public String getZoneId(String zone_ty, String game_id);

//	int getSelectedSeat(String game_id);

	// public List<SeatDTO> getSelectedSeat(String seat_id);
	
}
