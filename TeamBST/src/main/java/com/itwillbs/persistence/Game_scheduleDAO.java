package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Game_scheduleDTO;

public interface Game_scheduleDAO {
	
	// 게임일정 조회
	public List<Game_scheduleDTO> GameSchedule(String name);
	
	
}
