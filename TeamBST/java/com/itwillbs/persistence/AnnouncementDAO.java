package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.Notice_boardDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;

public interface AnnouncementDAO {
	
	// 거래 게시글 작성
	public void insertQuestion(Question_boardDTO dto);
	
	// 질문 게시글 목록 조회
	public List<Question_boardDTO> QuestionList(/* Criteria cri */) throws Exception;

	// 공지사항 목록 조회
	public List<Notice_boardDTO> NoticeList(Criteria cri) throws Exception;

	// 공지 개시판 글 본문 내용 확인
	public List<Post_boardDTO> noticeOneList(String notice_id) throws Exception;
	
	// 문의 게시판 글 본문 내용확인
	public List<Question_boardDTO> QuestionOneList(int quest_id) throws Exception;

	// 문의 게시판 글 수정
	public void bulletinModify(Question_boardDTO qbdto) throws Exception;

	// 문의 게시판 글 삭제
	public void bulletinDelete(int quest_id) throws Exception;

	// 공지사항 조회수 증가
	public void updateNoticeCount(String notice_id) throws Exception;

	// 문의 게시판 조회수 증가
	public void updateQuestCount(int quest_id) throws Exception;

	// 공지 글 카운트 세기
	public int getNoticeTotalCount() throws Exception;

	// 문의 글 카운트 세기
	public int getQuestTotalCount() throws Exception;

	// 문의 글 페이징 처리
	public List<Question_boardDTO> questionListPage(Criteria cri) throws Exception;


	
	
	
}
