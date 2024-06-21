package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public void adminSignupGET() {
		logger.debug("adminSignupGET() --> GET호출");
		logger.debug("/views/login/AdminSignupPage.jsp");
		
	}
	@RequestMapping(value = "/AdminSignupPage", method =RequestMethod.POST)
	public String  adminSignupPOST(AdminDTO adto) {
		logger.debug("/AdminSignupPage--> POST()호출");
		logger.debug("AdminDTO" + adto);
		
		//서비스 => DB에 관리자 회원가입 처리 메서드 호출
		aLoginService.adminJoin(adto);
		
		return "redirect:/login/AdminLoginPage";
	}
	
	//관리자 로그인 페이지 매핑 
	@RequestMapping(value = "/AdminLoginPage", method = RequestMethod.GET)
	public void adminLoginGET() {
		logger.debug("관리자 adminLoginGET() 호출");
		
		
	}
	//관리자 로그인-입력받은 아이디, 비밀번호 사용해서 확인
	@RequestMapping(value = "/AdminLoginPage", method =  RequestMethod.POST )
	public String adminLoginPost(HttpSession session, AdminDTO adto) {
		
		logger.debug("/AdminLoginPage -> adminLoginCheck");
		logger.debug("로그인 정보" + adto);
		
		AdminDTO resultDTO = aLoginService.adminLogin(adto);
	

        logger.debug("로그인 결과: " + resultDTO);
        
        if (resultDTO == null) {
            logger.debug("관리자 로그인 실패");
            
            
            return "redirect:/login/AdminLoginPage	";
        }
        
        //로그인 성공!
        session.setAttribute("user_id", resultDTO.getAdmin_id());
        
        return "redirect:/admin/adminMember";
	}
}