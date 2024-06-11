package com.itwillbs.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserDTO {
	
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_nick;
	private String user_phone;
	private String user_email;
	private Date user_birth;
	private Timestamp join_date;
	private String user_serv_agree;
	private String user_info_agree;
	private Timestamp user_login_time;
	private String user_active;
	private String user_status;
	
	
}
