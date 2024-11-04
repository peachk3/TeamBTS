package com.itwillbs.service;
import java.util.HashMap;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.UserDTO;
import com.itwillbs.persistence.MemberDAO;


import java.util.Random;
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
	public void memberJoin(UserDTO udto) throws Exception{
		logger.debug("memberJoin(MemberDTO mdto) 실행");
		
		mdao.memberJoin(udto); // 오류!!!!!!!!--> mdao.memberJoin(mdto)를 입력하지 않아서 회원가입에 필요한 데이터가 mdto에 불러오지 못함
	
		logger.debug("회원가입 성공~!!");
		
	}
	//로그인 

	@Override
	public UserDTO memberLogin(UserDTO loginDto) throws Exception{
		logger.debug("memberLogin(loginDto) 호출");
		
		UserDTO resultDTO = mdao.memberLogin(loginDto);
		logger.debug("DAO 처리결과 -> 서비스 ");
		logger.debug("서비스 -> 컨트롤러 ");
		
		return resultDTO;
		
	}

	//아이디 중복체크 
	@Override
	public int idCheck(String user_id) throws Exception {
		int result = mdao.idCheck(user_id);
		
		logger.debug("result : 	"+ result);
		
		return result;
	}

	//닉네임 중복체크
	@Override
	public int nickCheck(String user_nick) throws Exception {
		int result = mdao.nickCheck(user_nick);
		
		logger.debug("result" + result);
		
		return result;
	}

	
	//핸드폰번호 중복체크
	
	@Override
	public int phoneCheck(String user_phone) throws Exception {

		int result  = mdao.phoneCheck(user_phone);
		
		logger.debug("result :" + result);
		
		return result;
	}

	//이메일 중복체크
		@Override
		public int emailCheck(String user_email) throws Exception {
			int result = mdao.emailCheck(user_email);
			
			logger.debug("result" + result);
			
			return result;
		}
	

	//아이디 찾기

	@Override
	public UserDTO findId(UserDTO udto) throws Exception{
		// TODO Auto-generated method stub
		return null;
	}
	
}
