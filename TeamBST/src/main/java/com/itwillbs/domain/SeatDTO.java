package com.itwillbs.domain;

import lombok.Data;

@Data
public class SeatDTO {
	
	private long seat_id;
	private int seat_row;
	private int seat_num;
	private boolean seat_booked;
	private int zone_id;
	
}
