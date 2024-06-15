package com.itwillbs.service;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.AdminDTO;

@Service
public interface AdminLoginService {


	//회원가입
	public void adminJoin(AdminDTO adto);

	//로그인
	public AdminDTO adminLogin(AdminDTO adminLoginOk);
}
