package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Notice_boardDTO {

	private Integer notice_id;
	private String admin_id;
	private String notice_sub;
	private String notice_cont;
	private Timestamp notice_cre_date;
	private String photo_url;
	private int notice_view;
	private String notice_del_at;
	private Timestamp notice_del_date;
	
}
