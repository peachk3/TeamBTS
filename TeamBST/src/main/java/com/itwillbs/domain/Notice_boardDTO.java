package com.itwillbs.domain;

import lombok.Data;

@Data
public class Notice_boardDTO {

	private long notice_id;
	private long admin_id;
	private String notice_sub;
	private String notice_cont;
	private String notice_cre_date;
	private long photo_url;
	private int notice_view;
	private String notice_del_at;
	private String notice_del_date;
	
}