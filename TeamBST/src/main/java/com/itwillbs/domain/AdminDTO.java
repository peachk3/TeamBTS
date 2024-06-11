package com.itwillbs.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminDTO {
	
	private String admin_id;
	private String admin_pwd;
	private String admin_name;
	private String admin_nick;
	private String admin_phone;
	private String admin_email;
	private Date admin_birth;
	private Timestamp admin_cre_date;
	private String admin_info_agree;
	private String admin_status;
	
	
	
	
	

}
