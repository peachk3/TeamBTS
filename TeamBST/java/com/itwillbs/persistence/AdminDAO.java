package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Notice_boardDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;
import com.itwillbs.domain.UserDTO;

public interface AdminDAO {
	
	
	/* 공지사항 */
	
	// 공지사항 작성
	public void insertNotice(Notice_boardDTO dto);
	
	// 공지사항 리스트
	public List<Notice_boardDTO> NoticeList() throws Exception;
	
	// 경기일정 등록
	public void insertSchedule(Game_scheduleDTO dto);
	
	// 경기일정 수정
	public void updateSchedule(Game_scheduleDTO dto);
	
	// 경기일정 리스트
	public List<Game_scheduleDTO> ScheduleList() throws Exception;

	// 경기일정 일부 출력
	public Game_scheduleDTO ScheduleOne(String game_id);
	
	
	// 일반 회원 리스트 
	public List<UserDTO> generalMemberList() throws Exception;

	// 탈퇴 회원 리스트
	public List<UserDTO> withdrawMemberList() throws Exception;

	// 관리자 - 공지사항 본문 	
	public List<Notice_boardDTO> noticeOneList(String notice_id) throws Exception;
	
	// 관리자 - 문의 게시판 리스트
	public List<Question_boardDTO> questionList() throws Exception;

	// 관리자 - 문의 게시판 본문 
	public List<Post_boardDTO> QuestionOneList(String quest_id) throws Exception;
	
	
}
