package com.itwillbs.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Notice_boardDTO;
import com.itwillbs.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	private AdminDAO adao;

	@Override
	public void NoticeJoin(Notice_boardDTO dto) {
		
		logger.debug("NoticeJoin(dto) 실행");
		
		// DAO 메서드 호출
		adao.insertNotice(dto);
		
		logger.debug("공지사항 작성 성공");
		
	}

	@Override
	public void ScheduleJoin(Game_scheduleDTO dto) {

		logger.debug("NoticeJoin(dto) 실행");
		
		// DAO 메서드 호출
		adao.insertSchedule(dto);
		
		logger.debug("공지사항 작성 성공");
		
	}
	
	
	
	

}
