package com.itwillbs.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.AdminDTO;
import com.itwillbs.persistence.AdminLoginDAO;

@Service
public class AdminLoginServiceImpl implements AdminLoginService{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginServiceImpl.class);

	@Inject
	private AdminLoginDAO aldao;

	@Override
	public void adminJoin(AdminDTO adto) {
		logger.debug("adminJoin(AdminLoginDTO adto)실행");
		
		aldao.adminJoin(adto);
		
		logger.debug("관리자 회원가입 성공");
	}

	@Override
	public AdminDTO adminLogin(AdminDTO adminLoginOk) {
		logger.debug("adminLogin(adminLoginDTO)호출");
		
		AdminDTO resultDTO = aldao.adminLogin(adminLoginOk);
		
		logger.debug("DAO 처리결과 -> 서비스");
		logger.debug("서비스 -> 컨트롤러");
		
		return resultDTO;
	}
	
	
	
	
	
	
}
