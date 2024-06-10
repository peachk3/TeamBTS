package com.itwillbs.domain;

import lombok.Data;

@Data
public class Question_boardDTO {
	
	private long quest_id;
	private long quest_writer_id;
	private String quest_sub;
	private String quest_cre_date;
	private int quest_cate;
	private String quest_public;
	private long photo_url;
	private int quest_veiw;
	private String quest_del_at;
	private String quest_del_date;
	
	
}
