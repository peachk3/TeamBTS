package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.AdminDTO;

@Repository
public class AdminLoginDAOImpl implements AdminLoginDAO {

	private static final Logger logger = LoggerFactory.getLogger(AdminLoginDAOImpl.class);

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE=
			"com.itwillbs.mapper.adminLoginMapper.";

	@Override
	public void adminJoin(AdminDTO adto) {
		System.out.println("DAO : insertAdmin(adto)호출");
		
		sqlSession.insert(NAMESPACE+"adminJoin",adto);
		
		System.out.println("DAO : 관리자 회원가입 완료");
	}
	//로그인
	@Override
	public AdminDTO adminLogin(AdminDTO adto) {
		System.out.println("DAO :adminLogin(AdminDTO adto)실행");
		
		AdminDTO resultDTO = sqlSession.selectOne(NAMESPACE+ "adminLoginCheck"+adto);
		
		System.out.println("결과 : " + resultDTO);
		
		return resultDTO;
	}
	
	//로그인체크
	@Override
	public AdminDTO adminLogin(String admin_id, String admin_pwd) {
		
		System.out.println("DAO : memberLogin(String admin_id, String admin_pwd) 실행");
		
		Map<String, String>sendDTO = new HashMap<String, String>();
		
		sendDTO.put("admin_id", admin_id);
		sendDTO.put("admin_pwd", admin_pwd);
		
		return sqlSession.selectOne(NAMESPACE+"adminLoginCheck", sendDTO);
		
	}
	
	
	
	
	
	
	
	
	
}
