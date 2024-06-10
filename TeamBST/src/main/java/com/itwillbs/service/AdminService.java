package com.itwillbs.service;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.Notice_boardDTO;

@Service
public interface AdminService {
	
	// 공지사항 작성
	public void NoticeJoin(Notice_boardDTO dto);

}
