package com.itwillbs.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.UserDTO;
import com.itwillbs.persistence.MemberDAO;

/**
 * 서비스는 컨트롤러와 DAO를 연결
 * => 서비스는 DAO를 호출한다 -> DAO는 mapper를 통해 db와 연결
 *
 */

// @Service : 해당객체를 Service 객체(bean)로 root-context.xml 이 인식하도록 설정

@Service
public class MemberServiceImpl implements MemberService{

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	// DAO를 호출하기 (객체를 생성)=> 의존객체 주입
	// MemberDAO mado = new MemberDAOImpl(); (직접 생성x)
	// root-context.xml에 생성 되어있는 DAO객체(빈)을 주입

	@Inject
	private MemberDAO mdao;

	//회원가입
	@Override
	public void memberJoin(UserDTO udto) {
		logger.debug("memberJoin(MemberDTO mdad) 실행");
		
		mdao.memberJoin(udto); // 오류!!!!!!!!--> mdao.memberJoin(mdto)를 입력하지 않아서 회원가입에 필요한 데이터가 mdto에 불러오지 못함
	
		logger.debug("회원가입 성공~!!");
		
	}
	//로그인 

	@Override
	public UserDTO memberLogin(UserDTO loginDto) {
		logger.debug("memberLogin(loginDTO) 호출");
		
		UserDTO resultDTO = mdao.memberLogin(loginDto);
		logger.debug("DAO 처리결과 -> 서비스 ");
		logger.debug("서비스 -> 컨트롤러 ");
		
		return resultDTO;
		
	}
	
}
