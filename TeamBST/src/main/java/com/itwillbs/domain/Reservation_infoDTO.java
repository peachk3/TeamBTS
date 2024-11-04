package com.itwillbs.domain;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Reservation_infoDTO {
	
	private Integer res_id;
	private String user_id;
	private Integer game_id;
	private String pur_name;
	private Timestamp res_date;
	private String res_state;
	private int res_pay_price;
	private int res_fee;
	private String seat1_id;
	private String seat2_id;
	private String seat3_id;
	private String seat4_id;
	private String seat5_id;
	private String seat6_id;
	private String seat7_id;
	private String seat8_id;
	
	private List<String> seats; // 좌석 리스트 추가

    public List<String> getSeats() {
        if (seats == null) {
            seats = new ArrayList<>(); // 리스트가 null인 경우 초기화
        }
        return seats;
    }

    public void setSeats(List<String> seats) {
        this.seats = seats;
    }

    // 각 좌석 ID를 리스트에 추가하는 메서드
    public void addSeat(String seatId) {
        getSeats().add(seatId);
    }

    // 기존 Getter 및 Setter 생략
}
