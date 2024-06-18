package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Notice_boardDTO;
import com.itwillbs.domain.UserDTO;

@Service
public interface AdminService {
	
	
	// 공지사항 작성
	public void NoticeJoin(Notice_boardDTO dto);
	
	// 공지사항 목록 조회
	public List<Notice_boardDTO> NoticeList() throws Exception;
	
	// 경기일정 등록
	public void ScheduleJoin(Game_scheduleDTO dto);

	// 경기일정 수정
	public void updateSchedule(Game_scheduleDTO dto);
	
	// 경기일정 목록 조회
	public List<Game_scheduleDTO> ScheduleList() throws Exception;

	// 경기일정 일부 조회
	public Game_scheduleDTO ScheduleOne(String game_id);
	
	// 일반회원 리스트 조회
	public List<UserDTO> generalMemberList() throws Exception;

	// 탈퇴회원 리스트 조회
	public List<UserDTO> withdrawMemberList() throws Exception;

	public List<Game_scheduleDTO> memberTicketingList(String user_id) throws Exception;
	
}
