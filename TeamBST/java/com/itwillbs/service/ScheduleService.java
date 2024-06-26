package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Team_n_stadiumDTO;

public interface ScheduleService {
	
	public List<Game_scheduleDTO> gameScheduleList(String team) throws Exception;
	
	public List<Team_n_stadiumDTO> teamInfo(String team_id) throws Exception;
	
	public List<Game_scheduleDTO> stadScheduleList(String stad_id) throws Exception;

	public List<Game_scheduleDTO> homeTeamInfoList(String game_id) throws Exception;
	public List<Game_scheduleDTO> awayTeamInfoList(String game_id) throws Exception;


}
