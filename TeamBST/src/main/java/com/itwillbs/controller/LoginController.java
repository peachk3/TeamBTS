package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.MemberService;

//http://localhost:8088/login/signupPage
//http://localhost:8088/login/loginPage


@Controller
@RequestMapping(value="/login/*")
public class LoginController{
 private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

@Inject
private MemberService mService;

@RequestMapping(value = "/signupPage", method = RequestMethod.GET)
	public void signupGET() {
    logger.debug("/views/login/signupPage.jsp");
    
    
}

// 회원가입 - 입력 받은 정보 처리(POST)
@RequestMapping(value = "/signupPage", method = RequestMethod.POST)
public String signupPOST(UserDTO udto) {
    logger.debug("/signupPage -> signupPOST() 호출");
    logger.debug("UserDTO : " + udto);

    // 서비스 => DB에 회원가입 처리 메서드를 호출 
    mService.memberJoin(udto);
     

     return "redirect:/login/loginPage"; // 리다이렉트할 경로 반환
}

//-----------------------------------------------------------------------
// 회원로그인 
@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
public void loginGET() {
	logger.debug("/login -> loginGET() 호출");
	
}

//로그인 - 입력받은 아이디, 비밀번호를 사용해서 확인

@RequestMapping(value = "/loginPage", method = RequestMethod.POST)										
public String loginPOST(HttpSession session, UserDTO udto){ // 파라미터에 ->전달한 정보 저장(아이디, 비밀번호)
	
	logger.debug("/loginPage -> loginPOST() 호출");
	logger.debug("로그인 정보"+ udto );
	
	UserDTO resultDTO = mService.memberLogin(udto);
	
	logger.debug("로그인 결과 " + resultDTO);
	
	
	if(resultDTO == null) {
		logger.debug("로그인 실패");
		
		return "redirect:/login/loginPage";
	}
	
	//로그인 성공!
	session.setAttribute("id", resultDTO.getUser_id());
	
	
	return "redirect:/login/loginPage";
	
	}
//-----------------------------------------------------
// 회원 로그아웃 







//===============================================
//아이디 중복 체크 (비동기식)
	

}