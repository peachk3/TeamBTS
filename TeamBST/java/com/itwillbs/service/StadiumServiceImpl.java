package com.itwillbs.service;

import java.util.List;
import java.util.TimerTask;

import javax.inject.Inject;
import javax.management.timer.Timer;

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

	// stadium -> zoneList 출력
	@Override
	public List<ZoneDTO> getZonesByStadiumId(String game_id) {
		logger.debug("getZonesByStadiumId(String game_id) 호출");

		return staddao.getZonesByStadiumId(game_id);
	}

	// zone -> Seat 출력 (displaySeats)
	@Override
	public List<SeatDTO> getSeatsId(String game_id, String zone_id) {
		logger.debug("getSeatsId(String zone_id) 호출 ");

		return staddao.getSeatsId(game_id, zone_id);
	}

	// user_id 비교해서 user_name 가져오기 (예매자명 출력)
	@Override
	public List<UserDTO> getUserName(String user_id) {
		logger.debug("getUserName(String user_id) 호출");

		return staddao.getUserName(user_id);
	}

	// game_id 비교해서 gameSchedulelist 가져오기 (경기 정보 출력)
	@Override
	public List<Game_scheduleDTO> getGameSche(String game_id) {
		logger.debug("getGameSche(String game_id) 호출");

		return staddao.getGameSche(game_id);
	}

	// 성인 좌석 가격
	@Override
	public List<Seat_priceDTO> getSeatAdultPrice(String zone_id) {
		logger.debug("getSeatPrice(String zone_id) 호출");

		return staddao.getSeatAdultPrice(zone_id);
	}

	// 초등학생 좌석 가격
	@Override
	public List<Seat_priceDTO> getSeatChildPrice(String zone_id) {
		logger.debug("getSeatChildPrice(String zone_id) 호출");
		
		return staddao.getSeatChildPrice(zone_id);
	}

	// 좌석 정보 업데이트 (booked_at = 1로 업데이트)
	@Override
	public void postSelectedSeat(Integer game_id, String seat_id) {
		logger.debug(" @@@ postSelectedSeat(String game_id) 호출");
	
		staddao.postSelectedSeat(game_id, seat_id);
	}

	// 예매 가능 좌석 및 여부 출력 
	@Override
	public List<Seat_bookDTO> getSeatBooked(String zone_id) {
		logger.debug(" getSeatBooked(String zone_id) 호출 ");
		
		return staddao.getSeatBooked(zone_id);
	}
	
}