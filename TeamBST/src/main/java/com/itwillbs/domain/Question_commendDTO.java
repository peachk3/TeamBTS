package com.itwillbs.domain;

import lombok.Data;

@Data
public class Question_commendDTO {
	
	private long comm_id;
	private long quest_id;
	private String comm_cont;
	private String comm_cre_date;
	private String comm_del_at;
	private String comm_del_date;
	private long admin_id;
	
}
