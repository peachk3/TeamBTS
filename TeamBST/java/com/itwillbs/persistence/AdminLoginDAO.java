package com.itwillbs.persistence;

import com.itwillbs.domain.AdminDTO;

public interface AdminLoginDAO {
	
	// 관리자 - 회원가입
	public void adminJoin(AdminDTO adto) throws Exception;

	// 관리자 - 로그인
	public AdminDTO adminLogin(AdminDTO adto) throws Exception;

	// 관리자 - 로그인 체크
	public AdminDTO adminLogin(String admin_id, String admin_pwd) throws Exception;

	// 관리자 아이디 중복체크
	public int aidCheck(String admin_id) throws Exception;

	// 관리자 닉네임 중복체크
	public int anickCheck(String admin_nick) throws Exception;

	// 관리자 핸드폰 중복체크
	public int aphoneCheck(String admin_phone) throws Exception;

	// 관리자 이메일 중복체크
	public int aemailCheck(String admin_email) throws Exception;

	//===============================================

}
