package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.AdminDTO;
import com.itwillbs.service.AdminLoginService;



//http://localhost:8088/login/AdminSignupPage
//http://localhost:8088/login/AdminLoginPage

@Controller
@RequestMapping(value="/login/*")
public class AdminLoginController {

	private static final Logger logger = LoggerFactory.getLogger(AdminLoginController.class);
	
	@Inject
	private AdminLoginService aLoginService;

	
	//회원가입
	@RequestMapping(value = "/AdminSignupPage", method = RequestMethod.GET)
	public void adminSignupGET() throws Exception{
		logger.debug("adminSignupGET() --> GET호출");
		logger.debug("/views/login/AdminSignupPage.jsp");
		
	}
	@RequestMapping(value = "/AdminSignupPage", method =RequestMethod.POST)
	public String  adminSignupPOST(AdminDTO adto) throws Exception{
		logger.debug("/AdminSignupPage--> POST()호출");
		logger.debug("AdminDTO" + adto);
		
		//서비스 => DB에 관리자 회원가입 처리 메서드 호출
		aLoginService.adminJoin(adto);
		
		return "redirect:/login/AdminLoginPage";
	}
	
	//관리자 로그인 페이지 매핑 
	@RequestMapping(value = "/AdminLoginPage", method = RequestMethod.GET)
	public void adminLoginGET() throws Exception{
		logger.debug("관리자 adminLoginGET() 호출");
		
		
	}
	//관리자 로그인-입력받은 아이디, 비밀번호 사용해서 확인
	@RequestMapping(value = "/AdminLoginPage", method =  RequestMethod.POST )
	public String adminLoginPost(HttpSession session, AdminDTO adto) throws Exception{
		
		logger.debug("/AdminLoginPage -> adminLoginCheck");
		logger.debug("로그인 정보" + adto);
		
		AdminDTO resultDTO = aLoginService.adminLogin(adto);
	

        logger.debug("로그인 결과: " + resultDTO);
        
        if (resultDTO == null) {
            logger.debug("관리자 로그인 실패");
            session.setAttribute("alertMessage", "로그인에 실패하였습니다");

            
            return "redirect:/login/AdminLoginPage	";
        }
        
        //로그인 성공!
        session.setAttribute("user_id", resultDTO.getAdmin_id());
        
        return "redirect:/admin/adminMember";
	}
	
	
	// 관리자 로그아웃
	@RequestMapping(value = "/adminLogout",method = RequestMethod.POST)
	public String adminLogoutPOST(HttpSession session) throws Exception{
		logger.debug("/logout -> logoutPOST() 호출");
		session.invalidate(); // 세션 무효화
		return "redirect:/login/AdminLoginPage"; // 로그아웃 후 로그인 페이지로 리다이렉트
	}
	
	//-----------------------------------------------------------------
		//아이디 중복 체크 
		@GetMapping("/aidCheck")
		@ResponseBody
		public int aidCheck(@RequestParam("admin_id")String admin_id)throws Exception{
			logger.debug("admin_id" + admin_id);
			
			int result = aLoginService.aidCheck(admin_id);
			
			logger.debug("결과값" + result);
			
			return result;
		}
		
		//----------------------------------------------------------------
		//닉네임 중복체크 
		@GetMapping("/anickCheck")
		@ResponseBody
		public int anickCheck(@RequestParam("admin_nick")String admin_nick) throws Exception{
			logger.debug("admin_nick" + admin_nick);

			int result = aLoginService.anickCheck(admin_nick);
			
			logger.debug("결과 값 : " + result);
			
			return result;
			
		}
		//--------------------------------------------------------------
		// 핸드폰 중복확인
		@GetMapping("/aphoneCheck")
		@ResponseBody 
		public int aphoneCheck(@RequestParam("admin_phone")String admin_phone) throws Exception{
			logger.debug("admin_phone" + admin_phone);
			
			int result = aLoginService.aphoneCheck(admin_phone);
			
			logger.debug("결과값 : " + result);
			
			return result;
		}
		//------------------------------------------------------
		//이메일 중복 체크
		@GetMapping("/aemailCheck")
		@ResponseBody
		public int aemailCheck(@RequestParam("admin_email")String admin_email) throws Exception{
			logger.debug("admin_email" + admin_email);

			int result = aLoginService.aemailCheck(admin_email);
			
			logger.debug( "결과값 : " + result);
			
			return result;
		}
		//----------------------------------------------------------------
		// 아이디 찾기	
		
	
	
}