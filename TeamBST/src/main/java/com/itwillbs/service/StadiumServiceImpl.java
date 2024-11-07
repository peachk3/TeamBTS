package com.itwillbs.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Reservation_infoDTO;
import com.itwillbs.domain.SeatDTO;
import com.itwillbs.domain.Seat_bookDTO;
import com.itwillbs.domain.Seat_priceDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.ZoneDTO;
import com.itwillbs.persistence.StadiumDAO;

@Configuration
@EnableScheduling
@Service
public class StadiumServiceImpl implements StadiumService {

	private static final Logger logger = LoggerFactory.getLogger(StadiumServiceImpl.class);

	@Inject
	private StadiumDAO staddao;

	// stadium -> zoneList 출력
	@Override
	public List<ZoneDTO> getZonesByStadiumId(String game_id) throws Exception{
		logger.debug("getZonesByStadiumId(String game_id) 호출");

		return staddao.getZonesByStadiumId(game_id);
	}

	// zone -> Seat 출력 (displaySeats)
	@Override
	public List<SeatDTO> getSeatsId(String game_id, String zone_id) throws Exception{
		logger.debug("getSeatsId(String zone_id) 호출 ");

		return staddao.getSeatsId(game_id, zone_id);
	}

	// user_id 비교해서 user_name 가져오기 (예매자명 출력)
	@Override
	public List<UserDTO> getUserName(String user_id) throws Exception{
		logger.debug("getUserName(String user_id) 호출");

		return staddao.getUserName(user_id);
	}

	// game_id 비교해서 gameSchedulelist 가져오기 (경기 정보 출력)
	@Override
	public List<Game_scheduleDTO> getGameSche(String game_id) throws Exception{
		logger.debug("getGameSche(String game_id) 호출");

		return staddao.getGameSche(game_id);
	}

	// 성인 좌석 가격
	@Override
	public List<Seat_priceDTO> getSeatAdultPrice(String zone_id) throws Exception{
		logger.debug("getSeatPrice(String zone_id) 호출");

		return staddao.getSeatAdultPrice(zone_id);
	}

	// 초등학생 좌석 가격
	@Override
	public List<Seat_priceDTO> getSeatChildPrice(String zone_id) throws Exception{
		logger.debug("getSeatChildPrice(String zone_id) 호출");
		
		return staddao.getSeatChildPrice(zone_id);
	}

	// 좌석 정보 업데이트 (booked_at = 1로 업데이트)
	@Override
	public void postSelectedSeat(Integer game_id, List<String> seatIds2, Integer booked_at) throws Exception{
		logger.debug(" @@@ postSelectedSeat(String game_id) 호출");
			staddao.postSelectedSeat(game_id, seatIds2, booked_at);
			staddao.setReservationTime(game_id, seatIds2, LocalDateTime.now());
	}
	
	@Scheduled(fixedRate = 600000)
	@Override
	public void releaseExpiredReservations() throws Exception {
		logger.debug(" $$ releaseExpiredReservations() 호출 ");
		
		LocalDateTime expirationTime = LocalDateTime.now().minusMinutes(10);

        // LocalDateTime을 String 형식으로 변환 (MySQL의 DATETIME 형식)
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedExpirationTime = expirationTime.format(formatter);
		
        //LocalDateTime reserved_at = LocalDateTime.now().minusMinutes(10);
		
		logger.debug("Checking for expired reservations before:" + formattedExpirationTime);
		
	    staddao.updateExpiredRes(formattedExpirationTime);
	}

	@Override
	public void updateReser(Reservation_infoDTO resInfo) throws Exception {
		logger.debug(" %% 예약 updateReser 호출 ");
		
		staddao.insertReservation(resInfo);
	}

	// 예매 가능 좌석 및 여부 출력 
	@Override
	public List<Seat_bookDTO> getSeatBooked(String zone_id, String game_id) throws Exception{
		logger.debug(" getSeatBooked(String zone_id) 호출 ");
		
		return staddao.getSeatBooked(zone_id, game_id);
	}

	
	
	
}