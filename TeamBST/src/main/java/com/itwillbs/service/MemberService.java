package com.itwillbs.service;

import com.itwillbs.domain.MemberDTO;

public interface MemberService {
	//컨트롤러에서 처리를 수행하는 추상메서드 작성
	
	//회원가입
	public void memberJoin(MemberDTO mdto);
	
  //로그인 체크
	public MemberDTO memberLogin(MemberDTO loginDto);
	
}