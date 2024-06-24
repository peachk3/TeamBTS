package com.itwillbs.domain;

import java.util.List;

import lombok.Data;

@Data
public class Seat_bookDTO {

	private String seat_id;
	private Integer game_id;
	private Integer booked_at;
	
	private List<SeatDTO> seatList;
}
