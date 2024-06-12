package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Game_scheduleDTO;

public interface Game_scheduleDAO {
	
	// 팀별 일정 조회
	public List<Game_scheduleDTO> GameSchedule(String name);
	
	
	// 구장별 일정 조회
	public List<Game_scheduleDTO> StadSchedule(String stad_id);
	
	
}
