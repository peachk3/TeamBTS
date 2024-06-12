package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Notice_boardDTO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminDAOImpl.class);
	
	@Inject
	public SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.adminLoginMapper.";

	//회원가입
	@Override
	public void adminJoin(AdminDTO adto) {
		System.out.println("DAO: insertAdmin(auto)");
	
		sqlSession.insert(NAMESPACE+"adminJoin",adto);
		
		System.out.println("DAO : 관리자 회원가입 완룡!");
	
	}

	//로그인
	@Override
	public AdminDTO adminLogin(AdminDTO adto) {
		System.out.println("DAO : adminLogin(AdminDTO adto) 실행");
		
		AdminDTO resultDTO = sqlSession.selectOne(NAMESPACE+"adminLoginCheck",adto);
		
		System.out.println("결과" + resultDTO);
		
		return resultDTO;
	
	}

	//로그인 체크
	@Override
	public AdminDTO adminLogin(String admin_id, String admin_pwd) {

		System.out.println("DAO: adminLogin(Stirng admin_id, String admin_pw)");
		
		Map<String, String>sendDTO = new HashMap<String, String>();
		
		sendDTO.put("admin_id", admin_id);
		sendDTO.put("admin_pwd", admin_pwd);
		
		return sqlSession.selectOne(NAMESPACE+"adminLoginCheck",sendDTO);
	}
//====================================================================
// 관리자 - 공지사항
	
	@Override
	public void insertNotice(Notice_boardDTO dto) {
		
		logger.debug("DAO : insertNotice(dto) 호출");
		
		logger.debug("dto : "+ dto);
		sqlSession.insert(NAMESPACE + "noticeJoin", dto);
		
		logger.debug("DAO : 공지사항 작성 완료");
	}

	@Override
	public void insertSchedule(Game_scheduleDTO dto) {
		
		logger.debug("DAO : insertSchedule(dto) 호출");
		
		logger.debug("dto : "+ dto);
		sqlSession.insert(NAMESPACE + "scheduleJoin", dto);
		
		logger.debug("DAO : 경기일정 등록 완료");
		
	}
	
	

}
