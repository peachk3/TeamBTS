package com.itwillbs.domain;

import java.util.List;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class Seat_bookDTO {

	private String seat_id;
	private Integer game_id;
	private Integer booked_at;
	private String reserved_at;
	
	private List<String> seatIds2;
	
	private List<SeatDTO> seatList;
	
	public String getReserved_at() {
        if (reserved_at != null) {
            return reserved_at;
        }
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public void setReserved_at(String reserved_at) {
        this.reserved_at = reserved_at;
    }
}
