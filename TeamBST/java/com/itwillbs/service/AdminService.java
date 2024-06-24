package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Notice_boardDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;
import com.itwillbs.domain.Question_commendDTO;
import com.itwillbs.domain.UserDTO;

@Service
public interface AdminService {
	
	
	// 공지사항 작성
	public void NoticeJoin(Notice_boardDTO dto) throws Exception;
	
	// 공지사항 목록 조회
	public List<Notice_boardDTO> NoticeList() throws Exception;
	
	// 경기일정 등록
	public void ScheduleJoin(Game_scheduleDTO dto) throws Exception;

	// 경기일정 수정
	public void updateSchedule(Game_scheduleDTO dto) throws Exception;
	
	// 경기일정 목록 조회
	public List<Game_scheduleDTO> ScheduleList() throws Exception;

	// 경기일정 일부 조회
	public Game_scheduleDTO ScheduleOne(int game_id) throws Exception;
	
	// 일반회원 리스트 조회
	public List<UserDTO> generalMemberList() throws Exception;

	// 탈퇴회원 리스트 조회
	public List<UserDTO> withdrawMemberList() throws Exception;


	// 공지사항 본문 조회
	public List<Notice_boardDTO> noticeOneList(int notice_id) throws Exception;
	
	// 관리자 - 문의 게시판 리스트 조회
	public List<Question_boardDTO> questionList() throws Exception;

	// 관리자 - 문의 게시판 본문 조회
	public List<Question_boardDTO> QuestionOneList(int quest_id) throws Exception;

	// 관리자 - 문의 게시판 답변하기 
	public void questionCommend(Question_commendDTO qcdto) throws Exception;

	// 예매 내역 조회
	public List<Game_scheduleDTO> memberTicketingList(String user_id) throws Exception;

	// 예매 내역 조회 - GPT 코드
    List<Game_scheduleDTO> memberTicketingList(String user_id, Criteria cri) throws Exception;
    int getTotalCount(String user_id) throws Exception;
	
	
	
	
	// 관리자 - 공지사항 글 수정
	public void adminNoticeModify(Notice_boardDTO nbdto) throws Exception;

	// 관리자 - 공지사항 글 삭제
	public void deleteNoticeContent(int notice_id) throws Exception;

	// 관리자 - 공지사항 조회수 증가
	public void updateNoticeCount(int notice_id) throws Exception;

	// 관리자 - 문의글 조회수 증가
	public void updateQuestCount(int quest_id) throws Exception;

	// 관리자 - 일반 회원수 출력
	public int generalMemberCount() throws Exception;

	// 관리자 - 탈퇴 회원수 출력
	public int withdrawMemberCount() throws Exception;

	// 관리자 - 개인정보 확인
	public AdminDTO getMember(String user_id) throws Exception;

	// 관리자 - 공지사항 페이징 처리
	public List<Notice_boardDTO> NoticeListPage(Criteria cri) throws Exception;

	// 관리자 - 공지사항 총 글 개수 확인
	public int getNoticeTotalCount() throws Exception;

	// 관리자 - 문의 게시판 페이징 처리
	public List<Notice_boardDTO> questionListPage(Criteria cri) throws Exception;

	// 관리자 - 문의 게시판 총 게시글 수 
	public int getQestionTotalCount() throws Exception;

	// 관리자 - 경기일정 페이징 처리
	public List<Notice_boardDTO> ScheduleListPage(Criteria cri) throws Exception;

	// 관리자 - 경기일정 총 개수 찾기
	public int getScheduleTotalCount() throws Exception;

	// 관리자 - 일반회원 리스트 페이징처리
	public List<UserDTO> generalMemberList(Criteria cri) throws Exception;

	// 관리자 - 일반회원 리스트 총 인원수 확인
	public int getGeneralMemberTotalCount() throws Exception;

	// 관리자 - 탈퇴회원 리스트 페이징처리
	public List<UserDTO> withdrawMemberListPage(Criteria cri) throws Exception;

	// 관리자 - 탈퇴회원 리스트 총 인원수 확인
	public int getwithdrawMemberTotalCount() throws Exception;

	
	// 관리자 - 관리자 개인 정보 수정
	public void updateAdminMember(AdminDTO adto) throws Exception;

	// 관리자 - 관리자 개인 탈퇴
	public boolean deleteAdminMember(AdminDTO adto) throws Exception;

	// 관리지 - 답변호출
	public List<Question_commendDTO> getComments(int quest_id) throws Exception;

	// 관리자 - 답변 잇는지 여부
	public boolean isAnswered(int quest_id) throws Exception;
	


	
}
