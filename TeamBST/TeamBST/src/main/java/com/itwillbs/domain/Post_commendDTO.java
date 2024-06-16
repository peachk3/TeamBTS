package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Post_commendDTO {
	
	private Integer comm_id;
	private Integer post_id;
	private String comm_writer_id;
	private Integer parent_comm_id;
	private String comm_cont;
	private Timestamp comm_cre_date;
	private String comm_del_at;
	private Timestamp comm_del_date;
	
}
