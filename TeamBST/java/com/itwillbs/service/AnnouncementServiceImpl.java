package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Notice_boardDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;
import com.itwillbs.persistence.AnnouncementDAO;
import com.itwillbs.persistence.CommunityDAO;

@Service
public class AnnouncementServiceImpl implements AnnouncementService{

	private static final Logger logger = LoggerFactory.getLogger(AnnouncementServiceImpl.class);
	
	@Inject
	private AnnouncementDAO adao;
	
	@Override
	public List<Notice_boardDTO> NoticeList() throws Exception {
		logger.debug("공지사항 목록 조회");
		
		return adao.NoticeList();
	}

	@Override
	public void QuestionJoin(Question_boardDTO dto) {
		logger.debug("QuestionJoin(dto) 실행");
		
		// DAO 메서드 호출
		adao.insertQuestion(dto);
		
		logger.debug("문의 게시글 작성 성공");
	}

	@Override
	public List<Question_boardDTO> QuestionList() throws Exception {
		logger.debug("문의 게시글 목록 조회");
		
		return adao.QuestionList();
	}

	@Override
	public List<Post_boardDTO> noticeOneList(String notice_id) throws Exception {
		logger.debug("공지 게시글 내용 조회");
		
		
		return adao.noticeOneList(notice_id);
	}

	@Override
	public List<Question_boardDTO> QuestionOneList(int quest_id) throws Exception {
		logger.debug("문의 게시글 글 내용 조회");
		
		return adao.QuestionOneList(quest_id);
	}

	@Override
	public void bulletinModify(Question_boardDTO qbdto) throws Exception {
		logger.debug("문의 게시글 글 내용 수정");
		
		adao.bulletinModify(qbdto);
	}

	@Override
	public void bulletinDelete(int quest_id) throws Exception {

		adao.bulletinDelete(quest_id);
	}

	@Override
	public void updateNoticeCount(String notice_id) throws Exception {

		adao.updateNoticeCount(notice_id);
	}

	@Override
	public void updateQuestCount(int quest_id) throws Exception {

		adao.updateQuestCount(quest_id);
	}

	
	
	
}
