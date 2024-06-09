package com.itwillbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/mypage/*")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value="mypage",method=RequestMethod.GET)
	public void mypageMain() {
		logger.debug("마이페이지 호출");

	}
	@RequestMapping(value="myticket",method=RequestMethod.GET)
	public void mypageMyticket() {
		logger.debug("마이티켓 호출");

	}	@RequestMapping(value="mywrite",method=RequestMethod.GET)
	public void mypageMywrite() {
		logger.debug("나의 작성글 호출");

	}
	@RequestMapping(value="withdraw",method=RequestMethod.GET)
	public void mypageWithdraw() {
		logger.debug("회원탈퇴 호출");

	}
}
