package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Notice_boardDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;

@Repository
public class AnnouncementDAOImpl implements AnnouncementDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(AnnouncementDAOImpl.class);
	
	private static final String NAMESPACE = "com.itwillbs.mapper.AnnouncementMapper.";
	
	@Inject
	public SqlSession sqlSession;

	@Override
	public void insertQuestion(Question_boardDTO dto) {
		logger.debug("DAO : insertQuestion(dto) 호출");
		
		logger.debug("dto : "+ dto);
		sqlSession.insert(NAMESPACE + "QuestionJoin", dto);
		
		logger.debug("DAO : 공지사항 작성 완료");
		
	}

	@Override
	public List<Question_boardDTO> QuestionList() throws Exception {
		logger.debug("DAO : QuestionList() 호출");
		
		return sqlSession.selectList(NAMESPACE + "QuestionList");
	}

	@Override
	public List<Notice_boardDTO> NoticeList() throws Exception {
		logger.debug("DAO : NoticeList() 호출");
		
		return sqlSession.selectList(NAMESPACE + "noticeList");
	}
	
	

}
