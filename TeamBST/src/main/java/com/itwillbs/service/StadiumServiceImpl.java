package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.SeatDTO;
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
