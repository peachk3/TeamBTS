package com.itwillbs.domain;

import lombok.Data;

@Data
public class UserDTO {
	
	private long user_id;
	private String user_pwd;
	private String user_name;
	private String user_nick;
	private String user_phone;
	private String user_email;
	private String user_birth;
	private String join_date;
	private String user_serv_agree;
	private String user_info_agree;
	private String user_login_time;
	private String user_active;
	private String user_status;
	
	
}