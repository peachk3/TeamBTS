package com.itwillbs.persistence;

import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Notice_boardDTO;

public interface AdminDAO {
	
	/*관리자 회원가입/ 로그인*/
	
	//관리자 - 회원가입
	public void adminJoin(AdminDTO adto);
	
	//관리자 - 로그인 
	public AdminDTO adminLogin(AdminDTO adto);
	//관리자 - 로그인 체크 
	public AdminDTO adminLogin(String admin_id, String admin_pwd);
	
	
	
	//===============================================
	
	/* 공지사항 */
	
	// 공지사항 작성
	public void insertNotice(Notice_boardDTO dto);
	
	// 경기일정 등록
	public void insertSchedule(Game_scheduleDTO dto);
	

}
