package com.itwillbs.persistence;


import com.itwillbs.domain.UserDTO;

public interface MemberDAO {
		
		//회원가입
		public void memberJoin(UserDTO udto);
		
		//로그인
		public UserDTO memberLogin(UserDTO udto);
		
		
		
		public UserDTO memberLogin(String user_id, String user_pwd);
	
}
