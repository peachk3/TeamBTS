package com.itwillbs.persistence;


import com.itwillbs.domain.UserDTO;

public interface MemberDAO {
		
		//회원가입
		public void memberJoin(UserDTO udto) throws Exception;
		
		//로그인
		public UserDTO memberLogin(UserDTO udto) throws Exception;
		
		
		
		public UserDTO memberLogin(String user_id, String user_pwd) throws Exception;

		//아이디 중복체크
		public int idCheck(String user_id) throws Exception;
		
		//닉네임 중복체크
		public int nickCheck(String user_id) throws Exception;
	
		//이메일 중복체크
		public int emailCheck(String user_email) throws Exception;

		//핸드폰 중복체크
		public int phoneCheck(String user_phone) throws Exception;
		
		//아이디찾기
		public UserDTO findId(UserDTO udto) throws Exception;

}
