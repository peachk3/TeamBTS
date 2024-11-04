package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Team_n_stadiumDTO;


@Repository
public class Game_scheduleDAOImpl implements Game_scheduleDAO {

	private static final Logger logger = LoggerFactory.getLogger(Game_scheduleDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE 
					= "com.itwillbs.mapper.ScheduleMapper.";
	
	
	
	@Override
	public List<Game_scheduleDTO> GameSchedule(String team) throws Exception{
		
		// mppaer에서 전달받은 DTO 객체들을 자동으로 List에 저장
		List<Game_scheduleDTO> resultDTO = sqlSession.selectList(NAMESPACE+"GameSchedule",team);
		
		return resultDTO;
	}

	@Override
	public List<Team_n_stadiumDTO> teamInfo(String team_id) throws Exception{
		
		List<Team_n_stadiumDTO> teamInfoDTO = sqlSession.selectList(NAMESPACE+"teamInfo",team_id);

		
		return teamInfoDTO;
	}


	@Override
	public List<Game_scheduleDTO> StadSchedule(String stad_id) throws Exception{

		List<Game_scheduleDTO> teamDTO = sqlSession.selectList(NAMESPACE+"TeamSchedule",stad_id);

		
		return teamDTO;
	}



	@Override
	public List<Game_scheduleDTO> homeTeamInfo(String game_id) throws Exception{

		List<Game_scheduleDTO> homeTeamDTO = sqlSession.selectList(NAMESPACE+"homeTeamInfo",game_id);
		
		
		
		return homeTeamDTO;
	}

	
	@Override
	public List<Game_scheduleDTO> awayTeamInfo(String game_id) throws Exception{

		List<Game_scheduleDTO> awayTeamDTO = sqlSession.selectList(NAMESPACE+"awayTeamInfo",game_id);
		
		
		
		return awayTeamDTO;
	}

	
	
}
