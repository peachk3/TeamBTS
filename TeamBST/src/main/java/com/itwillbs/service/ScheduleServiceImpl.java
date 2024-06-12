package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.persistence.Game_scheduleDAO;


@Service
public class ScheduleServiceImpl implements ScheduleService {
	private static final Logger logger = LoggerFactory.getLogger(ScheduleServiceImpl.class);
	
	@Inject
	private Game_scheduleDAO gsdao;

	
	@Override
	public List<Game_scheduleDTO> gameScheduleList(String name) {
	
		logger.debug(" gameScheduleList(String name) 실행 ");
		
//		logger.debug(" name : "+name);
		
		return gsdao.GameSchedule(name);
	}


	@Override
	public List<Game_scheduleDTO> stadScheduleList(String stad_id) {

		logger.debug(" stadScheduleList(String stad_id) 실행 ");
		
		
		return gsdao.StadSchedule(stad_id);
	}
	
	
	
	
	
	
}
