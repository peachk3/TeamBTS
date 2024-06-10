package com.itwillbs.domain;

import lombok.Data;

@Data
public class Reservation_infoDTO {
	
	private long res_id;
	private long user_id;
	private long game_id;
	private String pur_name;
	private String res_date;
	private String res_state;
	private int res_pay_price;
	private int res_fee;
	private long seat1_id;
	private long seat2_id;
	private long seat3_id;
	private long seat4_id;
	private long seat5_id;
	private long seat6_id;
	private long seat7_id;
	private long seat8_id;
	
}