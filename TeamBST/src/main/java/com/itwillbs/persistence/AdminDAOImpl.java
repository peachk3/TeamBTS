package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Notice_boardDTO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminDAOImpl.class);
	
	@Inject
	public SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.adminMapper.";

	
// 관리자 - 공지사항
	
	@Override
	public void insertNotice(Notice_boardDTO dto) {
		
		logger.debug("DAO : insertNotice(dto) 호출");
		
		logger.debug("dto : "+ dto);
		sqlSession.insert(NAMESPACE + "noticeJoin", dto);
		
		logger.debug("DAO : 공지사항 작성 완료");
	}
	
	@Override
	public List<Notice_boardDTO> NoticeList() throws Exception {

		logger.debug("DAO : NoticeList() 호출");
		
		return sqlSession.selectList(NAMESPACE + "noticeList");
	}

	@Override
	public void insertSchedule(Game_scheduleDTO dto) {
		
		logger.debug("DAO : insertSchedule(dto) 호출");
		
		logger.debug("dto : "+ dto);
		sqlSession.insert(NAMESPACE + "scheduleJoin", dto);
		
		logger.debug("DAO : 경기일정 등록 완료");
		
	}

	@Override
	public List<Game_scheduleDTO> ScheduleList() throws Exception {
		
		logger.debug("DAO : ScheduleList() 호출");
		
		return sqlSession.selectList(NAMESPACE + "scheduleList");
		
	}
	

}
