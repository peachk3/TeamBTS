package com.itwillbs.domain;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import lombok.Data;

@Data
public class Game_scheduleDTO {
	

	private Integer game_id;
	private Date game_date;
	private Time game_time;
	private String stad_id;
	private String home_team_id;
	private String away_team_id;
	
	private List<Team_n_stadiumDTO> teamList;
	
}
