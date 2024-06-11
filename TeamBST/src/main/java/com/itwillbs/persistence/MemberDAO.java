package com.itwillbs.persistence;

import com.itwillbs.domain.MemberDTO;

public interface MemberDAO {
		
		//회원가입
		public void memberJoin(MemberDTO mdto);
		
		//로그인
		public MemberDTO memberLogin(MemberDTO mdto);
		public MemberDTO memberLogin(String user_id, String user_pwd);
	
}
