package com.itwillbs.service;

import com.itwillbs.domain.Notice_boardDTO;

public interface AdminService {
	
	// 공지사항 작성
	public void NoticeJoin(Notice_boardDTO dto);

}
