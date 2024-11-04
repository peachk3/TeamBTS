package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Question_commendDTO {
	
	private Integer comm_id;
	private Integer quest_id;
	private String comm_cont;
	private Timestamp comm_cre_date;
	private String comm_del_at;
	private Timestamp comm_del_date;
	private String admin_id;
	
}
