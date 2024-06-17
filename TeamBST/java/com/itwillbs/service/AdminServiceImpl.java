package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Notice_boardDTO;
import com.itwillbs.domain.UserDTO;
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
	public List<Notice_boardDTO> NoticeList() throws Exception {
		logger.debug("공지사항 글목록 조회");
		
		return adao.NoticeList();
	}

	@Override
	public void ScheduleJoin(Game_scheduleDTO dto) {

		logger.debug("ScheduleJoin(dto) 실행");
		
		// DAO 메서드 호출
		adao.insertSchedule(dto);
		
		logger.debug("경기일정 작성 성공");
		
	}
	
	@Override
	public List<Game_scheduleDTO> ScheduleList() throws Exception {
		logger.debug("경기일정 글목록 조회");
		
		return adao.ScheduleList();
	}
	
	@Override
	public void updateSchedule(Game_scheduleDTO dto) {
		
		logger.debug("updateSchedule(dto) 실행");
		
		// DAO 메서드 호출
		adao.updateSchedule(dto);
		
		logger.debug("경기일정 수정 성공");
		
	}
	
	@Override
	public Game_scheduleDTO ScheduleOne(String game_id) {
		logger.debug("경기일정 글 일부 조회");
		
		return adao.ScheduleOne(game_id);
	}

	@Override
	public List<UserDTO> generalMemberList() throws Exception {
		logger.debug("일반회원 정보 조회");
		
		return adao.generalMemberList();
	}

	@Override
	public List<UserDTO> withdrawMemberList() throws Exception {
		logger.debug("탈퇴회원 정보 조회");
		
		return adao.withdrawMemberList();
	}

	@Override
	public List<Game_scheduleDTO> memberTicketingList(String user_id) throws Exception {
		logger.debug("일반회원 예매현황 조회");
		
		return adao.memberTicketingList(user_id);
	}
	
	
	

}
