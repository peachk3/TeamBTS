package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Game_scheduleDTO;

public interface Game_scheduleDAO {
	
	// 팀별 일정 조회
	public List<Game_scheduleDTO> GameSchedule(String name);
	
	
	// 구장별 일정 조회
	public List<Game_scheduleDTO> StadSchedule(String stad_id);
	
	
	// 홈팀 경기 정보 조회
	public List<Game_scheduleDTO> homeTeamInfo(String game_id);
	
	// 어웨이팀 경기 정보 조회
	public List<Game_scheduleDTO> awayTeamInfo(String game_id);


}
