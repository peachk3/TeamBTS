package com.itwillbs.domain;

import lombok.Data;

@Data
public class Post_boardDTO {

	private long post_id;
	private long post_writer_id;
	private String post_sub;
	private String post_cont;
	private String post_cre_date;
	private String stad_id;
	private long photo_url;
	private int post_view;
	private String sale_status;
	private String sale_ty;
	private String post_del_at;
	private String post_del_date;
	
}
