package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Notice_boardDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;
import com.itwillbs.domain.Question_commendDTO;
import com.itwillbs.domain.UserDTO;

@Service
public interface AdminService {
	
	
	// 공지사항 작성
	public void NoticeJoin(Notice_boardDTO dto) throws Exception;
	
	// 공지사항 목록 조회
	public List<Notice_boardDTO> NoticeList() throws Exception;
	
	// 경기일정 등록
	public void ScheduleJoin(Game_scheduleDTO dto) throws Exception;

	// 경기일정 수정
	public void updateSchedule(Game_scheduleDTO dto) throws Exception;
	
	// 경기일정 목록 조회
	public List<Game_scheduleDTO> ScheduleList() throws Exception;

	// 경기일정 일부 조회
	public Game_scheduleDTO ScheduleOne(int game_id) throws Exception;
	
	// 일반회원 리스트 조회
	public List<UserDTO> generalMemberList() throws Exception;

	// 탈퇴회원 리스트 조회
	public List<UserDTO> withdrawMemberList() throws Exception;


	// 공지사항 본문 조회
	public List<Notice_boardDTO> noticeOneList(int notice_id) throws Exception;
	
	// 관리자 - 문의 게시판 리스트 조회
	public List<Question_boardDTO> questionList() throws Exception;

	// 관리자 - 문의 게시판 본문 조회
	public List<Question_boardDTO> QuestionOneList(int quest_id) throws Exception;

	// 관리자 - 문의 게시판 답변하기 
	public void questionCommend(Question_commendDTO qcdto) throws Exception;

	
	public List<Game_scheduleDTO> memberTicketingList(String user_id) throws Exception;

	// 관리자 - 공지사항 글 수정
	public void adminNoticeModify(Notice_boardDTO nbdto) throws Exception;

	// 관리자 - 공지사항 글 삭제
	public void deleteNoticeContent(int notice_id) throws Exception;

	// 관리자 - 공지사항 조회수 증가
	public void updateNoticeCount(int notice_id) throws Exception;

	// 관리자 - 문의글 조회수 증가
	public void updateQuestCount(int quest_id) throws Exception;

	// 관리자 - 일반 회원수 출력
	public int generalMemberCount() throws Exception;

	// 관리자 - 탈퇴 회원수 출력
	public int withdrawMemberCount() throws Exception;


	
}
