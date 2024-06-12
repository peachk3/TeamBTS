package com.itwillbs.persistence;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Notice_boardDTO;

public interface AdminDAO {
	
	/* 공지사항 */
	
	// 공지사항 작성
	public void insertNotice(Notice_boardDTO dto);
	
	// 경기일정 등록
	public void insertSchedule(Game_scheduleDTO dto);
	

}
