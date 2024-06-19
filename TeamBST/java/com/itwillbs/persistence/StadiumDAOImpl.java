package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.SeatDTO;
import com.itwillbs.domain.Seat_priceDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.ZoneDTO;

@Repository
public class StadiumDAOImpl implements StadiumDAO {

	private static final Logger logger = LoggerFactory.getLogger(MypageDAOImpl.class);

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.itwillbs.mapper.StadiumMapper.";
	
//	@Override
//	public Game_scheduleDTO getStadiumById(String stad_id) {
//		logger.debug("getStadiumById(String game_id) 호출");
//	
//		return sqlSession.selectOne(NAMESPACE + "getStadiumById", stad_id);
//	}

	@Override
	public List<ZoneDTO> getZonesByStadiumId(String stad_id) {
		logger.debug("getZonesByStadiumId(String stad_id) 호출 ");
		
		return sqlSession.selectList(NAMESPACE + "getZonesByStadiumId", stad_id );
	}

	@Override
	public List<SeatDTO> getSeatsByZone(String zone_ty, String zone_id) {
		logger.debug("getSeatsByZone(String zone_ty) 호출");
	    Map<String, String> params = new HashMap<>();
	    params.put("zone_ty", zone_ty);
	    params.put("zone_id", zone_id);

		
		return sqlSession.selectList(NAMESPACE + "getSeatsByZone", params);
	}

	@Override
	public List<SeatDTO> getSeatsId(String seat_id) {
		logger.debug("getSeatsId(String seat_id) 호출");
		
		return sqlSession.selectList(NAMESPACE + "getSeatsId", seat_id);
	}

	@Override
	public List<UserDTO> getUserName(String user_id) {
		logger.debug("getUserName(String user_id) 호출");
		return sqlSession.selectList(NAMESPACE + "getUserName", user_id);
	}

	@Override
	public List<Game_scheduleDTO> getGameSche(String game_id) {
		logger.debug("getGameSche(String game_id) 호출");
		return sqlSession.selectList(NAMESPACE + "getGameSche", game_id);
	}

	@Override
	public int getSelectedSeat(String game_id) {
		logger.debug("getSelectedSeat(String seat_id) 호출");
		
		return sqlSession.update(NAMESPACE + "getSelectedSeat", game_id);
	}

	@Override
	public List<Seat_priceDTO> getSeatPrice(String zone_id) {
		logger.debug("getSeatPrice(String zone_id) 호출 ");
		
		return sqlSession.selectList(NAMESPACE + "getSeatPrice", zone_id);
	}


	
//	@Override
//	public List<SeatDTO> getSelectedSeat(String seat_id) {
//		logger.debug("getSelectedSeat(String seat_id) 호출");
//		return sqlSession.selectList(NAMESPACE + "getSelectedSeat", seat_id);
//	}

	
	
//	@Override
//	public SeatDTO getSeatByZone(String seat_id) {
//		logger.debug("getSeatByZone(String seat_id) 호출");
//		
//		
//		return sqlSession.selectList(NAMESPACE + "getSeatsById", seat_id);
//	}
	
	
	

//	@Override
//	public List<SeatDTO> getSeatsByZoneId(String zone_id) {
//		logger.debug("getSeatsByZoneId(String zone_id) 호출");
//		List<SeatDTO> seatList = sqlSession.selectList(NAMESPACE + "getSeatsByZoneId", zone_id);
//		return seatList;
//	}


	
	

}
