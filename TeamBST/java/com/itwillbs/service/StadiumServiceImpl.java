package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.SeatDTO;
import com.itwillbs.domain.Seat_bookDTO;
import com.itwillbs.domain.Seat_priceDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.ZoneDTO;
import com.itwillbs.persistence.StadiumDAO;

@Service
public class StadiumServiceImpl implements StadiumService {

	private static final Logger logger = LoggerFactory.getLogger(StadiumServiceImpl.class);

	@Inject
	private StadiumDAO staddao;

	@Override
	public List<ZoneDTO> getZonesByStadiumId(String stad_id) {
		logger.debug("getZonesByStadiumId(String stad_id) 호출");
		return staddao.getZonesByStadiumId(stad_id);
		
	}

	@Override
	public List<SeatDTO> getSeatsByZone(String zone_ty, String zone_id) {
		logger.debug("getSeatsByZone(String zone_ty) 호출 ");
		
		return staddao.getSeatsByZone(zone_ty, zone_id);
	}

	@Override
	public List<SeatDTO> getSeatsId(String seat_id) {

		logger.debug("getSeatsId(String zone_id) 호출 ");
		return staddao.getSeatsId(seat_id);
	}

	@Override
	public List<UserDTO> getUserName(String user_id) {
		logger.debug("getUserName(String user_id) 호출");
		
		return staddao.getUserName(user_id);
	}

	@Override
	public List<Game_scheduleDTO> getGameSche(String game_id) {
		logger.debug("getGameSche(String game_id) 호출");
		
		return staddao.getGameSche(game_id);
	}

	@Override
	public void postSelectedSeat(Integer game_id, String seat_id) {
		logger.debug(" @@@ postSelectedSeat(String game_id) 호출");
		
		staddao.postSelectedSeat(game_id, seat_id);
	}

	@Override
	public List<Seat_priceDTO> getSeatAdultPrice(String zone_id) {
		logger.debug("getSeatPrice(String zone_id) 호출");
		
		return staddao.getSeatAdultPrice(zone_id);
	}

	@Override
	public List<Seat_priceDTO> getSeatChildPrice(String zone_id) {
		logger.debug("getSeatChildPrice(String zone_id) 호출");
		return staddao.getSeatChildPrice(zone_id);
	}

	
	
//	@Override
//	public int getSelectedSeat(String seat_id) {
//		logger.debug("getSelectedSeat(String seat_id) 호출");
//		
//		return staddao.getSelectedSeat(seat_id);
//	}

	
	
	//	@Override
//	public List<SeatDTO> getSelectedSeat(String seat_id) {
//		logger.debug("getSelectedSeat(String seat_id) 호출");
//		
//		return staddao.getSelectedSeat(seat_id);
//	}
	
	
	 
	
//	@Override
//	public Game_scheduleDTO getStadiumById(String stad_id) {
//		
//		logger.debug("getStadiumById(String stad_id) 실행 ");
//		
//		return staddao.getStadiumById(stad_id);
//	}

//	@Override
//	public List<ZoneDTO> getZonesByStadiumId(String stad_id) {
//		logger.debug("getZonesByStadiumId(String stad_id) 실행");
//				
//		return staddao.getZonesByStadiumId(stad_id);
//	}

//	@Override
//	public List<SeatDTO> getSeatsByZoneId(String zone_id) {
//		
//		logger.debug("getSeatsByZoneId(String zone_id) 실행 ");
//		
//		return staddao.getSeatsByZoneId(zone_id);
//	}
//
//	@Override
//	public SeatDTO getSeatById(String seat_id) {
//		logger.debug("getSeatById(String seat_id) 실행");
//		
//		return staddao.getSeatById(seat_id);
//	}

	

}