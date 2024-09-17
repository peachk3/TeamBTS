package com.itwillbs.domain;

import java.sql.Timestamp;
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
	
	private List<String> seats;	
}
