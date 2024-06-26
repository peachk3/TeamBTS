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
	public void adminJoin(AdminDTO adto) throws Exception{
		logger.debug("adminJoin(AdminLoginDTO adto)실행");
		
		aldao.adminJoin(adto);
		
		logger.debug("관리자 회원가입 성공");
	}

	@Override
	public AdminDTO adminLogin(AdminDTO adminLoginOk) throws Exception{
		logger.debug("adminLogin(adminLoginDTO)호출");
		
		AdminDTO resultDTO = aldao.adminLogin(adminLoginOk);
		
		logger.debug("DAO 처리결과 -> 서비스");
		logger.debug("서비스 -> 컨트롤러");
		
		return resultDTO;
	}
	
	//아이디 중복체크
		@Override
		public int aidCheck(String admin_id) throws Exception {
			int result = aldao.aidCheck(admin_id);
			
			logger.debug("result :" + result);
			
			return result;
			
		}
		//닉네임 중복체크

		@Override
		public int anickCheck(String admin_nick) throws Exception {

			int result = aldao.anickCheck(admin_nick);
			
			logger.debug("result" + result);
			
			return result;
		}
		
		//핸드폰 중복체크
		@Override
		public int aphoneCheck(String admin_phone) throws Exception {
			
			int result  = aldao.aphoneCheck(admin_phone);
			
			logger.debug("result :" + result);
			
			return result;
		}
		
		//이메일 중복체크
		@Override
		public int aemailCheck(String admin_email) throws Exception {
			
			int result  = aldao.aemailCheck(admin_email);
			
			logger.debug("result :" + result);
			
			return result;
		}

	
	
	
	
}
