package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Notice_boardDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;
import com.itwillbs.domain.Question_commendDTO;
import com.itwillbs.domain.UserDTO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminDAOImpl.class);
	
	@Inject
	public SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.adminMapper.";

	
// 관리자 - 공지사항
	
	@Override
	public void insertNotice(Notice_boardDTO dto) throws Exception{
		
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
	public void insertSchedule(Game_scheduleDTO dto) throws Exception{
		
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
	
	@Override
	public void updateSchedule(Game_scheduleDTO dto) throws Exception{
		
		logger.debug("DAO : updateSchedule(dto) 호출");
		
		logger.debug("dto : "+ dto);
		sqlSession.update(NAMESPACE + "scheduleUpdate", dto);
		
		logger.debug("DAO : 경기일정 등록 완료");
		
	}
	
	@Override
	public Game_scheduleDTO ScheduleOne(int game_id) throws Exception{
		
		logger.debug("DAO : ScheduleOne() 호출");
		
		return sqlSession.selectOne(NAMESPACE + "scheduleOne",game_id);
		
	}

	@Override
	public List<UserDTO> generalMemberList() throws Exception {
		
		logger.debug(" DAO : generalMemberList() 호출");

		
		return sqlSession.selectList(NAMESPACE + "generalMemberList");
	}

	@Override
	public List<UserDTO> withdrawMemberList() throws Exception {

		logger.debug(" DAO : withdrawMemberList() 호출 ");

		
		return sqlSession.selectList(NAMESPACE+ "withdrawMemberList");
	}

	@Override

	public List<Notice_boardDTO> noticeOneList(int notice_id) throws Exception {

		logger.debug(" DAO : noticeOneList(String notice_id) 호출");

		
		return sqlSession.selectList(NAMESPACE+"noticeOneList", notice_id);
	}

	@Override
	public List<Question_boardDTO> questionList() throws Exception {

		logger.debug(" DAO : questionList() 호출");
		
		
		return sqlSession.selectList(NAMESPACE+"questionList");
	}

	@Override
	public List<Question_boardDTO> QuestionOneList(int quest_id) throws Exception {
		
		logger.debug(" DAO : QuestionOneList() 호출");

		return sqlSession.selectList(NAMESPACE+"QuestionOneList", quest_id);
	}

	@Override
	public void questionCommend(Question_commendDTO qcdto) throws Exception {
		logger.debug(" DAO : questionCommend(Question_commendDTO qcdto)");
		
		sqlSession.insert(NAMESPACE+"questionCommend",qcdto);
	}


	public List<Game_scheduleDTO> memberTicketingList(String user_id) throws Exception{

		logger.debug(" DAO : memberTicketingList(user_id) 호출");
		
		return sqlSession.selectList(NAMESPACE+"memberTicketingList",user_id);
	}

	@Override
	public void adminNoticeModify(Notice_boardDTO nbdto) throws Exception {
		logger.debug(" DAO :  adminNoticeModify(Post_boardDTO pbdto) 호출");
		
		sqlSession.update(NAMESPACE+"adminNoticeModify",nbdto);
	}

	@Override
	public void deleteNoticeContent(int notice_id) throws Exception {
		logger.debug(" DAO : deleteNoticeContent(int notice_id) 호출");
		
		sqlSession.update(NAMESPACE+"deleteNoticeContent",notice_id);
	}

	@Override
	public void updateNoticeCount(int notice_id) throws Exception {
		logger.debug(" DAO : updateNoticeCount(int notice_id) 호출");
	
		sqlSession.update(NAMESPACE+"updateNoticeCount",notice_id);
	}

	@Override
	public void updateQuestCount(int quest_id) throws Exception {
		logger.debug(" DAO : updateQuestCount(int quest_id) 호출");
		
		sqlSession.update(NAMESPACE+"updateQuestCount",quest_id);
	}
	
	
	

}
