package com.itwillbs.service;
import java.util.HashMap;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.UserDTO;
import com.itwillbs.persistence.MemberDAO;
import net.nurigo.sdk.message.model.Message;

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
	public void memberJoin(UserDTO udto) {
		logger.debug("memberJoin(MemberDTO mdto) 실행");
		
		mdao.memberJoin(udto); // 오류!!!!!!!!--> mdao.memberJoin(mdto)를 입력하지 않아서 회원가입에 필요한 데이터가 mdto에 불러오지 못함
	
		logger.debug("회원가입 성공~!!");
		
	}
	//로그인 

	@Override
	public UserDTO memberLogin(UserDTO loginDto) {
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

	//이메일 중복체크
	@Override
	public int emailCheck(String user_email) throws Exception {
		int result = mdao.emailCheck(user_email);
		
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

	//핸드폰 본인인증
	

	@Override
	public void sendSmsAndSaveCode(String user_phone, int cerNum) {
		// TODO Auto-generated method stub
		
	}

	/*
	 * public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
	 * String api_key = "NCSEOY0OIVK17B9D"; String api_secret =
	 * "Y1CP03WHUJCXPCOFMUXRY5BUHCZUJGZG"; Message coolsms = new Message(api_key,
	 * api_secret);
	 * 
	 * HashMap<String, String> params = new HashMap<String, String>();
	 * params.put("to", userPhoneNumber); // 수신전화번호 params.put("from", "자신의 번호"); //
	 * 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨 params.put("type", "SMS");
	 * params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용
	 * 입력 params.put("app_version", "test app 1.2"); // application name and version
	 * 
	 * try { JSONObject obj = (JSONObject) coolsms.send(params);
	 * System.out.println(obj.toString()); } catch (CoolsmsException e) {
	 * System.out.println(e.getMessage()); System.out.println(e.getCode()); }
	 * 
	 * }
	 */
	/*
	private final String api_key="NCSEOY0OIVK17B9D";
	private final String api_secret="Y1CP03WHUJCXPCOFMUXRY5BUHCZUJGZG";
	
	@Override
	public void sendSmsAndSaveCode(String user_phone, String cerNum) {

		Message coolsms = new Message(api_key,api_secret);
		
		 HashMap<String, String> params = new HashMap<String, String>();
	        params.put("to", user_phone); // 수신전화번호
	        params.put("from", "010-0000-0000"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	        params.put("type", "SMS");
	        params.put("text", "[모두 야구 예매해] 문자 본인인증 서비스 : 인증번호는 " + "[" + cerNum + "]" + " 입니다.");
	        params.put("app_version", "test app 1.2"); // application name and version
		

	        try {
	            JSONObject obj = (JSONObject)coolsms.send(params);
	            System.out.println(obj.toString());
	        } catch (CoolsmsException e) {
	            System.out.println(e.getMessage());
	            System.out.println(e.getCode());
	        }
		
	}
	*/
	//아이디 찾기

	@Override
	public UserDTO findId(UserDTO udto) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
