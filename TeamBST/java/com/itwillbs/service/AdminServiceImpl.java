package com.itwillbs.service;

import java.util.List;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Notice_boardDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;
import com.itwillbs.domain.Question_commendDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.persistence.AdminDAO;


@Service
public class AdminServiceImpl implements AdminService{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	private AdminDAO adao;

	@Override
	public void NoticeJoin(Notice_boardDTO dto) throws Exception {
		
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
	public void ScheduleJoin(Game_scheduleDTO dto) throws Exception{

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
	public void updateSchedule(Game_scheduleDTO dto) throws Exception {
		
		logger.debug("updateSchedule(dto) 실행");
		
		// DAO 메서드 호출
		adao.updateSchedule(dto);
		
		logger.debug("경기일정 수정 성공");
		
	}
	
	@Override
	public Game_scheduleDTO ScheduleOne(int game_id) throws Exception {
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
	public List<Notice_boardDTO> noticeOneList(int notice_id) throws Exception {
		logger.debug("관리자 - 공지사항 본문 조회");

		
		return adao.noticeOneList(notice_id);
	}

	@Override
	public List<Question_boardDTO> questionList() throws Exception {
		logger.debug("관리자 - 문의 게시판 리스트 조회");

		
		return adao.questionList();
	}

	@Override
	public List<Question_boardDTO> QuestionOneList(int quest_id) throws Exception {
		logger.debug("관리자 - 문의 게시판 본문 조회");

		
		return adao.QuestionOneList(quest_id);
	}

	@Override
	public void questionCommend(Question_commendDTO qcdto) throws Exception {
		logger.debug("관리자 - 문의 게시판 답변 달기");
		
		adao.questionCommend(qcdto);
	}


	public List<Game_scheduleDTO> memberTicketingList(String user_id) throws Exception {
		logger.debug("일반회원 예매현황 조회");
		
		return adao.memberTicketingList(user_id);
	}
	
	
	// 예매 내역 조회 - gpt 코드
	   @Override
	    public List<Game_scheduleDTO> memberTicketingList(String user_id, Criteria cri) throws Exception {
	        return adao.memberTicketingList(user_id, cri);
	    }

	    @Override
	    public int getTotalCount(String user_id) throws Exception {
	        return adao.getTotalCount(user_id);
	    }
	
	
	
	
	
	

	@Override
	public void adminNoticeModify(Notice_boardDTO nbdto) throws Exception {
		logger.debug("관리자 - 공지사항 글 수정 ");

		adao.adminNoticeModify(nbdto);
	}

	@Override
	public void deleteNoticeContent(int notice_id) throws Exception {
		logger.debug("관리자 - 공지사항 글 삭제");
			
		
		adao.deleteNoticeContent(notice_id);
	}

	@Override
	public void updateNoticeCount(int notice_id) throws Exception {
		logger.debug("관리자 - 공지사항 조회수 증가");
		
		adao.updateNoticeCount(notice_id);
	}

	@Override
	public void updateQuestCount(int quest_id) throws Exception {
		logger.debug("관리자 - 문의게시글 조회수 증가");
		
		adao.updateQuestCount(quest_id);
	}

	@Override
	public int generalMemberCount() throws Exception{
		logger.debug("관리자 - 일반 회원수 출력");
		
		return adao.generalMemberCount();
		
	}

	@Override
	public int withdrawMemberCount() throws Exception {
		logger.debug("관리자 - 탈퇴 회원수 출력");
		
		return adao.withdrawMemberCount();
	}

	@Override
	public AdminDTO getMember(String user_id) throws Exception {
		logger.debug("관리자 - 개인 정보 확인");

		
		return adao.getMember(user_id);
	}

	@Override
	public List<Notice_boardDTO> NoticeListPage(Criteria cri) throws Exception {
		logger.debug("관리자 - 공지사항 페이징 처리");

		
		return adao.NoticeListPage(cri);
	}

	@Override
	public int getNoticeTotalCount() throws Exception {
		logger.debug("관리자 - 공지사항 글 총 개수 세기");

		
		return adao.getNoticeTotalCount();
	}

	@Override
	public List<Notice_boardDTO> questionListPage(Criteria cri) throws Exception {
		logger.debug("관리자 - 문의 게시글 페이징 처리");

		
		return adao.questionListPage(cri);
	}

	@Override
	public int getQestionTotalCount() throws Exception {
		logger.debug("관리자 - 문의 게시글 총 게시글 수");

		
		return adao.getQestionTotalCount();
	}

	@Override
	public List<Notice_boardDTO> ScheduleListPage(Criteria cri) throws Exception{
		logger.debug("관리자 - 경기 일정 페이지 페이징 처리");

		
		return adao.ScheduleListPage(cri);
	}

	@Override
	public int getScheduleTotalCount() throws Exception {
		logger.debug("관리자 - 경기일정 총 개수 찾기");

		
		
		return adao.getScheduleTotalCount();
	}

	@Override
	public List<UserDTO> generalMemberList(Criteria cri) throws Exception {

		logger.debug("관리자 - 일반회원 리스트 페이징 처리");

		
		return adao.generalMemberList(cri);
	}

	@Override
	public int getGeneralMemberTotalCount() throws Exception {

		logger.debug("관리자 - 일반회원 리스트 회원 총인원수 확인");

		
		return adao.getGeneralMemberTotalCount();
	}

	@Override
	public List<UserDTO> withdrawMemberListPage(Criteria cri) throws Exception {

		logger.debug("관리자 - 탈퇴회원 리스트 회원 총인원수 확인");

		
		return adao.withdrawMemberListPage(cri);
	}

	@Override
	public int getwithdrawMemberTotalCount() throws Exception {

		logger.debug("관리자 - 탈퇴회원 리스트 회원 총 인원수 확인");

		
		return adao.getwithdrawMemberTotalCount();
	}

	@Override
	public void updateAdminMember(AdminDTO adto) throws Exception {
		logger.debug("관리자 - 관리자 개인 정보 수정");

		
		adao.updateAdminMember(adto);
	}

	@Override
	public boolean deleteAdminMember(AdminDTO adto) throws Exception {
        int result =  adao.deleteAdminMember(adto);
        
        return result > 0;
	}

	@Override
	public List<Question_commendDTO> getComments(int quest_id) throws Exception {
		  return adao.selectCommentsByQuestId(quest_id);
	}
	
	@Override
    public boolean isAnswered(int quest_id) throws Exception{
        return adao.countAnswersByQuestId(quest_id) > 0;
    }

	@Override
	public void deleteBulletinComment(int quest_id) throws Exception {
		
		adao.deleteBulletinComment(quest_id);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
