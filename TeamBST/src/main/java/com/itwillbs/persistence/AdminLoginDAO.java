package com.itwillbs.persistence;

import com.itwillbs.domain.AdminDTO;

public interface AdminLoginDAO {
	
	
	//관리자 - 회원가입
	public void adminJoin(AdminDTO adto);

	//관리자 - 로그인 
	public AdminDTO adminLogin(AdminDTO adto);
	//관리자 - 로그인 체크 
	public AdminDTO adminLogin(String admin_id, String admin_pwd);
	
	
	
	//===============================================

}
