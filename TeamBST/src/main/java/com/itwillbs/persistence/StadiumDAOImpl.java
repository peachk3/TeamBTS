package com.itwillbs.persistence;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Reservation_infoDTO;
import com.itwillbs.domain.SeatDTO;
import com.itwillbs.domain.Seat_bookDTO;
import com.itwillbs.domain.Seat_priceDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.ZoneDTO;

@Repository
public class StadiumDAOImpl implements StadiumDAO {

	private static final Logger logger = LoggerFactory.getLogger(MypageDAOImpl.class);

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.itwillbs.mapper.StadiumMapper.";
	
	// stadium -> zoneList 출력
	@Override
	public List<ZoneDTO> getZonesByStadiumId(String game_id) throws Exception{
		logger.debug("getZonesByStadiumId(String game_id) 호출 ");
		
		return sqlSession.selectList(NAMESPACE + "getZonesByStadiumId", game_id );
	}

	// zone -> Seat 출력
	@Override
	public List<SeatDTO> getSeatsByZone(String zone_ty, String game_id) throws Exception{
		logger.debug("getSeatsByZone(String zone_ty) 호출");
		Map<String, Object> params = new HashMap<>();
		params.put("zone_ty", zone_ty);
		params.put("zone_id", game_id);
		
		return sqlSession.selectList(NAMESPACE + "getSeatsByZone", params);
	}
	
	// user_id 비교해서 user_name 가져오기 (예매자명 출력)
	@Override
	public List<UserDTO> getUserName(String user_id) throws Exception{
		logger.debug("getUserName(String user_id) 호출");
		return sqlSession.selectList(NAMESPACE + "getUserName", user_id);
	}

	// game_id 비교해서 gameSchedulelist 가져오기 (경기 정보 출력)
	@Override
	public List<Game_scheduleDTO> getGameSche(String game_id) throws Exception{
		logger.debug("getGameSche(String game_id) 호출");
		return sqlSession.selectList(NAMESPACE + "getGameSche", game_id);
	}
	
	// 성인 좌석 가격
	@Override
	public List<Seat_priceDTO> getSeatAdultPrice(String zone_id) throws Exception{
		logger.debug("getSeatPrice(String zone_id) 호출 ");
		
		return sqlSession.selectList(NAMESPACE + "getSeatAdultPrice", zone_id);
	}

	// 초등학생 좌석 가격
	@Override
	public List<Seat_priceDTO> getSeatChildPrice(String zone_id) throws Exception{
		logger.debug("getSeatChildPrice(String zone_id) 호출 ");
		return sqlSession.selectList(NAMESPACE + "getSeatChildPrice", zone_id);
	}

	// 좌석 정보 업데이트 (booked_at = 2로 업데이트)
	@Override
	public void postSelectedSeat(Integer game_id, List<String> seatIds2, Integer booked_at) throws Exception{
		logger.debug("postSelectedSeat(String game_id, String seat_id) 호출");
		Map<Object, Object> params = new HashMap<>();
	    params.put("game_id", game_id);
	    params.put("seatIds2", seatIds2);
	    params.put("booked_at", booked_at);
		sqlSession.update(NAMESPACE + "postSelectedSeat" , params);
	}
	
	@Override
	public void setReservationTime(Integer game_id, List<String> seatIds2, LocalDateTime reservedAt) {
		logger.debug(" setReservationTime 호출 ");
		Map<Object, Object> params = new HashMap<>();
		params.put("game_id", game_id);
        params.put("seatIds2", seatIds2);
        params.put("reservedAt", reservedAt);
        sqlSession.update(NAMESPACE + "setReservationTime", params);
	}

	@Override
	public void updateExpiredRes(String reserved_at) throws Exception {
		logger.debug(" updateExpiredRes 호출 ");
		
		//DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	    //String reservedAtString = reserved_at.format(formatter);
		
	    //Map<String, Object> params = new HashMap<>();
	    //params.put("reserved_at", reservedAtString);
        
		sqlSession.update(NAMESPACE + "releaseExpiredReservations", reserved_at);
		
	}

	@Override
	public List<SeatDTO> getSeatsId(String game_id, String zone_id) throws Exception{
		
		logger.debug("getSeatsId(String seat_id) 호출");
		Map<Object, Object> params = new HashMap<>();
	    params.put("game_id", game_id);
	    params.put("zone_id", zone_id);
		
		return sqlSession.selectList(NAMESPACE + "getSeatsId", params);
	}

	
	@Override
	public void insertReservation(Reservation_infoDTO resInfo) throws Exception {
		logger.debug("insertReser 호출");
		
		sqlSession.insert(NAMESPACE + "insertReser", resInfo);
	}


	
	@Override
	public List<Seat_bookDTO> getSeatBooked(String zone_id, String game_id) throws Exception{
		logger.debug("getSeatBooked(String zone_id) 호출");
		Map<Object, Object> params = new HashMap<>();
	    params.put("game_id", game_id);
	    params.put("zone_id", zone_id);
		return sqlSession.selectList(NAMESPACE + "getSeatBooked", params);
	}

	
	
	
}
