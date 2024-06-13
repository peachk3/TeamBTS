package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Notice_boardDTO;

@Service
public interface AdminService {
	
	
	// 공지사항 작성
	public void NoticeJoin(Notice_boardDTO dto);
	
	// 글 전체 목록 조회
	public List<Notice_boardDTO> NoticeList() throws Exception;
	
	// 경기일정 등록
	public void ScheduleJoin(Game_scheduleDTO dto);

	
}
