package com.itwillbs.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class Post_boardDTO {

	private Integer post_id;
	private String post_writer_id;
	private String post_sub;
	private String post_cont;
	private Timestamp post_cre_date;
	private String stad_id;
	private String photo_url;
	private int post_view;
	private String sale_status;
	private String sale_ty;
	private String post_del_at;
	private Timestamp post_del_date;
	
	private List<UserDTO> userList;

    public int getPost_view() {
        return post_view;
    }

    public void setPost_view(int post_view) {
        this.post_view = post_view;
    }

	
	
	
	
	
}
