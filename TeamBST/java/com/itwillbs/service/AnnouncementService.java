package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Notice_boardDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;

public interface AnnouncementService {
	
	// 거래 게시글 작성
	public void QuestionJoin(Question_boardDTO dto);
	
	// 거래 게시글 목록 조회
	public List<Question_boardDTO> QuestionList() throws Exception;

	// 공지사항 목록 조회
	public List<Notice_boardDTO> NoticeList() throws Exception;

	// 공지사항 글 내용 조회
	public List<Post_boardDTO> noticeOneList(String notice_id) throws Exception;
	
	// 문의 게시글 글 내용 조회
	public List<Question_boardDTO> QuestionOneList(int quest_id) throws Exception;

	// 문의 게시글 글 내용 수정
	public void bulletinModify(Question_boardDTO qbdto) throws Exception;

	// 문의 게시글 삭제
	public void bulletinDelete(int quest_id) throws Exception;
	
	// 공지사항 조회수 증가
	public void updateNoticeCount(String notice_id) throws Exception;

	// 문의 게시판 조회수 증가
	public void updateQuestCount(int quest_id) throws Exception;


}
