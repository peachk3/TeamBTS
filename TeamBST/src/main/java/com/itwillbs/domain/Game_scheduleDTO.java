package com.itwillbs.domain;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
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
	
	private List<Reservation_infoDTO> seatList;
	
//	 private List<String> seats; // 좌석 ID를 담을 리스트 추가
//
//	    // Getter와 Setter 생략
//

    public void setSeats(List<Reservation_infoDTO> seatList) {
        this.seatList = seatList;
    }

	public Integer getGameId() {
		return game_id;
	}

//	public String getSeatIds() {
//		if (seats == null) {
//            seats = new ArrayList<>(); // 초기화
//        }
//		
//        return String.join(",", seats);
//	}


	
}
