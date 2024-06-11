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
	
		logger.debug(" gameScheduleList() 실행 ");
		
//		logger.debug(" name : "+name);
		
		return gsdao.GameSchedule(name);
	}
	
}
