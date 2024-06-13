package com.itwillbs.service;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Notice_boardDTO;

@Service
public interface AdminService {
	
	
	// 공지사항 작성
	public void NoticeJoin(Notice_boardDTO dto);
	
	// 경기일정 등록
	public void ScheduleJoin(Game_scheduleDTO dto);

	
}
