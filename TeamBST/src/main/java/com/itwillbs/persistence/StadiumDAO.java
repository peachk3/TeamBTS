package com.itwillbs.persistence;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.SeatDTO;
import com.itwillbs.domain.ZoneDTO;

public interface StadiumDAO {
	
//	// Team
//	public Game_scheduleDTO getStadiumById(@RequestParam("game_id") String stad_id);

    // Zone
    public List<ZoneDTO> getZonesByStadiumId(@RequestParam("stad_id") String stad_id);

    // Seat
//    public List<SeatDTO> getSeatsByZoneId(@RequestParam("zone_id") String zone_id);
    
    // Zone -> Seat
    public List<SeatDTO> getSeatsByZone(@RequestParam("zone_ty") String zone_ty);

	public List<SeatDTO> getSeatsId(@RequestParam("seat_id") String seat_id);
    
//    public SeatDTO getSeatByZone(@RequestParam("seat_id") String seat_id);

    
    
    
}