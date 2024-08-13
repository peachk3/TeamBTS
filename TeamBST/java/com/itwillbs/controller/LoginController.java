package com.itwillbs.controller;


import java.net.URLDecoder;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

//회원가입 - 입력 받은 정보 처리(GET)
@RequestMapping(value = "/signupPage", method = RequestMethod.GET)
	public String signupGET() throws Exception{
    logger.debug("/views/login/signupPage.jsp");
    
    return "/login/signupPage";
}

// 회원가입 - 입력 받은 정보 처리(POST)
@RequestMapping(value = "/signupPage", method = RequestMethod.POST)
public String signupPOST(UserDTO udto) throws Exception{
    logger.debug("/signupPage -> signupPOST() 호출");
    logger.debug("UserDTO : " + udto);

    // 서비스 => DB에 회원가입 처리 메서드를 호출 
    mService.memberJoin(udto);
     

     return "redirect:/login/loginPage"; // 리다이렉트할 경로 반환
}


//-----------------------------------------------------------------------
// 회원로그인 
@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
public String loginGET() throws Exception{
	logger.debug("/login -> loginGET() 호출");
	
	return "/login/loginPage";
}

//로그인 - 입력받은 아이디, 비밀번호를 사용해서 확인

@RequestMapping(value = "/loginPage", method = RequestMethod.POST)										
public String loginPOST(HttpSession session, 
						UserDTO udto,
						@RequestParam(required = false) String redirect)
						throws Exception{ // 파라미터에 ->전달한 정보 저장(아이디, 비밀번호)
	
	logger.debug("/loginPage -> loginPOST() 호출");
	logger.debug("로그인 정보"+ udto );
	
	UserDTO resultDTO = mService.memberLogin(udto);
	
	logger.debug("로그인 결과 " + resultDTO);
	
	
	if(resultDTO == null) {
		logger.debug("로그인 실패");
        session.setAttribute("alertMessage", "로그인에 실패하였습니다");
		return "redirect:/login/loginPage";
	}
	
	//로그인 성공!
	session.setAttribute("user_id", resultDTO.getUser_id());
	
    if (redirect != null && !redirect.isEmpty()) {
        String decodedRedirect = URLDecoder.decode(redirect, "UTF-8");
        logger.debug("로그인 후 리다이렉트할 URL: " + decodedRedirect);
        return "redirect:" + decodedRedirect;
    }
	 
	 
	 	return "redirect:/main/main";
	
	}


//-----------------------------------------------------
// 회원 로그아웃 
@RequestMapping(value = "/generalLogout",method = RequestMethod.POST)
public String generalLogoutPOST(HttpSession session) throws Exception{
	logger.debug("/logout -> logoutPOST() 호출");
	session.invalidate(); // 세션 무효화
	return "redirect:/login/loginPage"; // 로그아웃 후 로그인 페이지로 리다이렉트
}


//-----------------------------------------------------
//아이디 중복 체크 
@GetMapping("/idCheck")
@ResponseBody
public int idCheck(@RequestParam("user_id")String user_id) throws Exception{
	logger.debug("user_id" + user_id);
	
	int result = mService.idCheck(user_id);
	
	logger.debug("결과값" + result);
	
	return result;
}
	
//------------------------------------------------------
//닉네임 중복 체크
@GetMapping("/nickCheck")
@ResponseBody
public int nickCheck(@RequestParam("user_nick")String user_nick)throws Exception{
	logger.debug("user_nick " + user_nick);

	int result = mService.nickCheck(user_nick);
	
	logger.debug("결과값 : "  + result );

	return result;
}

//------------------------------------------------------
//이메일 중복 체크
@GetMapping("/emailCheck")
@ResponseBody
public int emailCheck(@RequestParam("user_email")String user_email) throws Exception{
	logger.debug("user_email" + user_email);





//아이디 중복 체크
	
	int result = mService.emailCheck(user_email);
	
	logger.debug( "결과값 : " + result);
	
	return result;
}

//---------------------------------------------------------
// 핸드폰 중복확인
@GetMapping("/phoneCheck")
@ResponseBody 
public int phoneCheck(@RequestParam("user_phone")String user_phone) throws Exception{
	logger.debug("user_phone" + user_phone);
	
	int result = mService.phoneCheck(user_phone);
	
	logger.debug("결과값 : " + result);
	
	return result;
}

//-----------------------------------------------------------
//이메일 본인인증 

//---------------------------------------------------------
//아이디 찾기
@GetMapping(value = "/findId")
public String findIdGET() throws Exception{
	logger.debug("/findId -> loginGET() 호출");
	
	
	return "/login/findId";
}

@RequestMapping(value = "/findId", method = RequestMethod.POST)
public String findIdPOST(HttpServletRequest request,Model model, UserDTO udto,
		@RequestParam String user_name,
		@RequestParam String user_phone) {
	
		/*
		 * logger.debug("/findId -> findIdPOST() 호출");
		 * 
		 * try { udto.setUser_name(user_name); udto.setUser_phone(user_phone); UserDTO
		 * fid = mService.findId(udto);
		 * 
		 * model.addAttribute("findId", fid); } catch(Exception e) {
		 * model.addAttribute("msg", "오류가 발생되었습니다"); e.printStackTrace(); }
		 */
	return "/login/findId_result";
	
}

//비밀번호 찾기 페이지로 이동 
@RequestMapping(value = "AdminFindpw")
public String findPwdGET() throws Exception {
	
	
	
	return "/login/AdminFindpw";
}

//비밀번호 찾기 실행

}