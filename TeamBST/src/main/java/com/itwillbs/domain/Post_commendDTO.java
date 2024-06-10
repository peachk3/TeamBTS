package com.itwillbs.domain;

import lombok.Data;

@Data
public class Post_commendDTO {
	
	private long comm_id;
	private long post_id;
	private long comm_writer_id;
	private long parent_comm_id;
	private String comm_cont;
	private String comm_cre_date;
	private String comm_del_at;
	private String comm_del_date;
	
}