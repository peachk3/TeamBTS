package com.itwillbs.service;

import com.itwillbs.domain.UserDTO;

public interface MemberService {
	//컨트롤러에서 처리를 수행하는 추상메서드 작성
	
	//회원가입
	public void memberJoin(UserDTO udto);
	
  //로그인 체크
	public UserDTO memberLogin(UserDTO loginDto);

	//아이디 중복체크
	public int idCheck(String user_id) throws Exception;
	
	//닉네임 중복체크
	public int nickCheck(String user_nick) throws Exception;
	
	//이메일 중복체크
	public int emailCheck(String user_email)throws Exception;

	//아이디찾기
	public UserDTO findId(String user_name, String user_phone);
	
}