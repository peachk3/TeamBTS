package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;

public interface AnnouncementDAO {
	
	// 거래 게시글 작성
	public void insertQuestion(Question_boardDTO dto);
	
	// 거래 게시글 목록 조회
	public List<Question_boardDTO> QuestionList() throws Exception;

	
	
	
}
