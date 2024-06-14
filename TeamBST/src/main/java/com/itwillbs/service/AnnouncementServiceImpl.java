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

}
