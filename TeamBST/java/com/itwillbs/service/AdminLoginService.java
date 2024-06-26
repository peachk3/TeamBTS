package com.itwillbs.service;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.AdminDTO;

@Service
public interface AdminLoginService {

	// 회원가입
	public void adminJoin(AdminDTO adto) throws Exception;

	// 로그인
	public AdminDTO adminLogin(AdminDTO adminLoginOk) throws Exception;

	// 아이디 중복체크
	public int aidCheck(String admin_id) throws Exception;

	// 닉네임 중복체크
	public int anickCheck(String admin_nick) throws Exception;

	// 핸드폰 중복체크
	public int aphoneCheck(String admin_phone) throws Exception;

	// 닉네임 중복체크
	public int aemailCheck(String admin_email) throws Exception;
	
}
