package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.Notice_boardDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;
import com.itwillbs.domain.Question_commendDTO;

@Repository
public class AnnouncementDAOImpl implements AnnouncementDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(AnnouncementDAOImpl.class);
	
	private static final String NAMESPACE = "com.itwillbs.mapper.AnnouncementMapper.";
	
	@Inject
	public SqlSession sqlSession;

	@Override
	public void insertQuestion(Question_boardDTO dto) throws Exception{
		logger.debug("DAO : insertQuestion(dto) 호출");
		
		logger.debug("dto : "+ dto);
		sqlSession.insert(NAMESPACE + "QuestionJoin", dto);
		
		logger.debug("DAO : 공지사항 작성 완료");
		
	}

	@Override
	public List<Question_boardDTO> QuestionList(/* Criteria cri */) throws Exception {
		logger.debug("DAO : QuestionList(cri) 호출");
		
		return sqlSession.selectList(NAMESPACE + "QuestionList"/* ,cri */);
	}

	@Override
	public List<Notice_boardDTO> NoticeList(Criteria cri) throws Exception {
		logger.debug(" DAO : NoticeList(cri) 호출");
		
		return sqlSession.selectList(NAMESPACE + "noticeListPage",cri);
	}

	@Override
	public List<Post_boardDTO> noticeOneList(int notice_id) throws Exception {
		logger.debug(" DAO : noticeOneList(String notice_id) 호출");
		
		return sqlSession.selectList(NAMESPACE+"noticeOneList",notice_id);
	}

	@Override
	public List<Question_boardDTO> QuestionOneList(int quest_id) throws Exception {
		logger.debug(" DAO : noticeOneList(String notice_id) 호출");
		
		return sqlSession.selectList(NAMESPACE+"QuestionOneList",quest_id);
	}

	@Override
	public void bulletinModify(Question_boardDTO qbdto) throws Exception{
		logger.debug(" DAO : modifyContent(Question_boardDTO qbdto) 호출");
		
		sqlSession.update(NAMESPACE+"bulletinModify",qbdto);
	}

	@Override
	public void bulletinDelete(int quest_id) throws Exception {
		logger.debug(" DAO : bulletinDelete(int quest_id) 호출");
		
		sqlSession.update(NAMESPACE+"bulletinDelete",quest_id);
	}

	@Override
	public void updateNoticeCount(int notice_id) throws Exception {
		logger.debug(" DAO : updateNoticeCount(String notice_id) 호출 ");
		
		sqlSession.update(NAMESPACE+"updateNoticeCount",notice_id);
	}

	@Override
	public void updateQuestCount(int quest_id) throws Exception {
		logger.debug(" DAO : updateQuestCount(int quest_id)");
		
		sqlSession.update(NAMESPACE+"updateQuestCount",quest_id);
	}

	@Override
	public int getNoticeTotalCount() throws Exception {
		logger.debug(" getNoticeTotalCount() 실행");
		
		return sqlSession.selectOne(NAMESPACE+"countNoticePage");
	}

	@Override
	public int getQuestTotalCount() throws Exception {
		logger.debug(" getQuestTotalCount() 실행");
		

		return sqlSession.selectOne(NAMESPACE+"countQuestionPage");
	}

	@Override
	public List<Question_boardDTO> questionListPage(Criteria cri) throws Exception {
		logger.debug(" questionListPage() 실행");

		
		return sqlSession.selectList(NAMESPACE+"questionListPage",cri);
	}

	@Override
	public List<Question_commendDTO> QuestionCommendList(int quest_id) throws Exception {

		
		return sqlSession.selectList(NAMESPACE+"QuestionCommendList",quest_id);
	}
	
	
	
	
	

}
