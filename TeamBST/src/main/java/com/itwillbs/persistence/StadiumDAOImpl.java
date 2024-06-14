package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.SeatDTO;
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
	public List<SeatDTO> getSeatsByZoneId(String zone_id) {
		logger.debug("getSeatsByZoneId(String zone_id) 호출");
		List<SeatDTO> seatList = sqlSession.selectList(NAMESPACE + "getSeatsByZoneId", zone_id);
		return seatList;
	}

	@Override
	public SeatDTO getSeatById(String seat_id) {
		logger.debug(" getSeatById(String seat_id) 호출");

		return sqlSession.selectOne(NAMESPACE + "getSeatById", seat_id);
	}
	
	

}
