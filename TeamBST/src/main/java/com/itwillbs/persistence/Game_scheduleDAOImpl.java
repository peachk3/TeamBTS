package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Game_scheduleDTO;


@Repository
public class Game_scheduleDAOImpl implements Game_scheduleDAO {

	private static final Logger logger = LoggerFactory.getLogger(Game_scheduleDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE 
					= "com.itwillbs.mapper.ScheduleMapper.";
	
	
	
	@Override
	public List<Game_scheduleDTO> GameSchedule(String name) {
		
		// mppaer에서 전달받은 DTO 객체들을 자동으로 List에 저장
		List<Game_scheduleDTO> resultDTO = sqlSession.selectList(NAMESPACE+"GameSchedule",name);
		
		return resultDTO;
	}

	
	
	
	
}
