package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.MypageService;
import com.itwillbs.service.ScheduleService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping(value = "/mypage/*")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

    @Inject
    private MypageService mService;
    
//    @Inject
//    private ScheduleService sService;
    
    //http://localhost:8088/mypage/info
    // 회원정보 조회
    @RequestMapping(value="/info", method = RequestMethod.GET)
    public String infoGET(HttpSession session, Model model) {
    	logger.debug(" /info -> infoGET() 호출 ");
    	
    	// id정보 가져오기
        String user_id = (String) session.getAttribute("user_id");
        
        // 서비스 -> DAO 회원정보 조회
        UserDTO resultDTO = mService.getMember(user_id);
        logger.debug("회원정보: " + resultDTO);
        
        // 연결된 뷰페이지(/mypage/info.jsp)에 정보 전달
        model.addAttribute("resultDTO", resultDTO);
        
        // 뷰페이지 이동
        return "/mypage/info";
    }
    
    
    //http://localhost:8088/mypage/updateForm
    // 회원정보 수정 - 기존 회원정보
    @GetMapping(value = "/updateForm")
    public void updateGET(HttpSession session, Model model) {
        String user_id = (String) session.getAttribute("user_id");
        
        // 서비스 -> DAO 회원정보 조회
        UserDTO resultDTO = mService.getMember(user_id);
//        Game_scheduleDTO gameDTO = sService.gameScheduleList(name)
        
        // 연결된 뷰페이지로 정보 전달
        model.addAttribute("resultDTO", resultDTO);
        
        // 연결된 뷰페이지(/mypage/update.jsp)에 출력
    }
    
    // 회원정보 수정 - 변경된 내용을 DB에 전달 및 수정
    @RequestMapping(value = "/updateForm", method = RequestMethod.POST)
    public String updatePost(UserDTO udto) {
    	logger.debug(" /update -> updatePost() 호출 ");
    	
    	// 수정할 회원정보를 저장
    	logger.debug(" udto : " + udto);
    	
    	// Service -> DAO 회원정보 수정
        mService.updateMember(udto);
        
        return "redirect:/mypage/mypage";
    }
    
    
    //http://localhost:8088/mypage/deleteMember
    // 회원정보 삭제 - 사용자의 비밀번호 입력 / 아이디 세션
    @GetMapping(value = "/deleteMember")
    public void deleteGET(HttpSession session, Model model) {
    	String user_id = (String) session.getAttribute("user_id");
    	UserDTO resultDTO = mService.getMember(user_id);
    	model.addAttribute("resultDTO", resultDTO);
    }
    
    // 회원정보 삭제
    @PostMapping(value = "/deleteMember")
    public String deleteMember(UserDTO userDTO, HttpSession session) {
    	logger.debug(" /deleteMember -> deleteMember() 호출 ");
    	
    	// 전달정보 저장
    	logger.debug(" userDTO : " + userDTO );
    	
    	// Service -> DAO 회원정보 삭제
    	int result = mService.deleteMember(userDTO);
    	// 삭제 여부에 따른 페이지 이동
    	if(result == 1) {
    		logger.debug(" 삭제 성공! ");
    		// 기존의 사용자정보(세션) 제거
    		session.invalidate();
    		return "redirect:/main/main"; // 제거 성공 시 메인페이지로 이동
    	}
    	logger.debug(" 삭제 실패, 비밀번호를 다시 확인하세요! ");
        return "redirect:/mypage/deleteMember"; // 제거 성공 실패 시 삭제 페이지로 다시 이동  
    }
    
    
    //http://localhost:8088/mypage/postBoardList
    // 내 게시글
    @GetMapping(value = "/postBoardList")
    public String postBoardList(HttpSession session, Model model) throws Exception {
        String user_id = (String) session.getAttribute("user_id");
        List<UserDTO> pBoardList = mService.postBoardList();
        model.addAttribute("pBoardList", pBoardList);
        return "/mypage/postBoardList";
    }
    
    
    //http://localhost:8088/mypage/questionBoardList
    // 내 질문글
    @GetMapping(value = "/questionBoardList")
    public String questionBoardList(HttpSession session, Model model) throws Exception {
        String user_id = (String) session.getAttribute("user_id");
        List<UserDTO> qBoardList = mService.questionBoardList();
        model.addAttribute("qBoardList", qBoardList);
        return "/mypage/questionBoardList";
    }
    
    //http://localhost:8088/mypage/previousMatchList
    // 경기예약내역
    @GetMapping(value = "/previousMatchList")
    public String previousMatchList(HttpSession session, Model model) throws Exception {
        String user_id = (String) session.getAttribute("user_id");
        
        List<UserDTO> pMatchList = mService.previousMatchList();
        logger.debug(" pMatchList() 실행 ");
        
        model.addAttribute("pMatchList", pMatchList);
        return "/mypage/previousMatchList";
    }
    
    //http://localhost:8088/mypage/openMatchList
    // 경기예약내역
    @GetMapping(value = "/openMatchList")
    public String OpenMatchList(HttpSession session, Model model) throws Exception {
    	String user_id = (String) session.getAttribute("user_id");
    	
    	List<UserDTO> oMatchList = mService.openMatchList();
    	logger.debug(" oMatchList() 실행 ");
    	
    	model.addAttribute("openMatchList", oMatchList);
    	return "/mypage/openMatchList";
    }
    
    //http://localhost:8088/mypage/mypage
    // 마이페이지
    @GetMapping("/mypage")
    public String mypage(HttpSession session, Model model) {
        // 필요시 로직 추가
        return "/mypage/mypage";  // mypage.jsp로 이동
    }

}
