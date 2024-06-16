package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;
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
    
    
    //http://localhost:8088/mypage/mypage
    // 마이페이지
    @GetMapping("/mypage")
    public String mypage(HttpSession session, Model model) {
    	// 필요시 로직 추가
    	return "/mypage/mypage";  // mypage.jsp로 이동
    }
    
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
    public String deleteMember(UserDTO ddto, HttpSession session,Model model) {
    	logger.debug(" /deleteMember -> deleteMember() 호출 ");
    	
    	// 전달정보 저장
    	logger.debug(" userDTO : " + ddto );
        
        // 계정 정보 삭제( USE -> OUT으로 상태 변경)
        boolean isDeleted = mService.deleteMember(ddto);
        
        if (isDeleted) {
            session.invalidate();  // 세션 무효화
            logger.debug("비밀번호가 일치합니다 -> 회원탈퇴 성공!");

            return "redirect:/main/main";  // 삭제 성공 시 메인 페이지로 리다이렉트
        } else {
        	   // 삭제 실패 시 현재 세션에서 user_id를 다시 가져와서 resultDTO에 설정
            String user_id = (String) session.getAttribute("user_id");
            UserDTO resultDTO = mService.getMember(user_id);
            model.addAttribute("resultDTO", resultDTO);
            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");

            logger.debug("비밀번호가 일치하지 않습니다");

            return "mypage/deleteMember";  // 삭제 실패 시 다시 삭제 페이지로 이동
	}    
        }
    	
//    	// Service -> DAO 회원정보 삭제
//    	int result = mService.deleteMember(ddto);
//    	// 삭제 여부에 따른 페이지 이동
//    	if(result == 1) {
//    		logger.debug(" 삭제 성공! ");
//    		// 기존의 사용자정보(세션) 제거
//    		session.invalidate();
//    		return "redirect:/main/main"; // 제거 성공 시 메인페이지로 이동
//    	}
//    	logger.debug(" 삭제 실패, 비밀번호를 다시 확인하세요! ");
    
    
  //http://localhost:8088/mypage/postBoardList
    // 내 게시글
    @GetMapping(value = "/postBoardList")
    public String postBoardList(HttpSession session, Model model) throws Exception {
        String user_id = (String) session.getAttribute("user_id");
        
        List<Post_boardDTO> pBoardList = mService.postBoardList(user_id);
        logger.debug(" 확인 : " + pBoardList.size());
        
        logger.debug(" pBoardList() 실행 ");
        
        model.addAttribute("pBoardList", pBoardList);
        return "/mypage/postBoardList";
    }
    
    // 내 게시글 본문
    @RequestMapping(value = "/pbread",method = RequestMethod.GET)
    public void pbreadGET(@ModelAttribute("post_id") int post_id, Model model) throws Exception {
    	logger.debug(" /pbreadGET() 실행 ");
    	
    	// 전달정보 저장
    	logger.debug(" post_id : " + post_id);
    	
    	// 글 조회(읽음) 카운트 증가 => 조회수 1증가
    	mService.pbUpdateReadCnt(post_id);
    	
    	
//    	// 서비스 - DAO 저장된 정보 가져오기
    	Post_boardDTO pbDTO = mService.pGetBoard(post_id);
    	logger.debug(" pbDTO : {} ", pbDTO);
    	
    	// 전달할 정보를 저장(model)
    	model.addAttribute("pbDTO", pbDTO);
    }
    
    
    
    //http://localhost:8088/mypage/questionBoardList
    // 내 질문글
    @GetMapping(value = "/questionBoardList")
    public String questionBoardList(HttpSession session, Model model) throws Exception {
        String user_id = (String) session.getAttribute("user_id");
        
        List<Question_boardDTO> qBoardList = mService.questionBoardList(user_id);
        logger.debug(" 확인 : " + qBoardList.size());
        
        logger.debug(" qBoardList() 실행 ");
        
        model.addAttribute("qBoardList", qBoardList);
        return "/mypage/questionBoardList";
    }
    
    // http://localhost:8088/mypage/qbread
    
    // 질문글 본문보기 - qbreadGET
 	@RequestMapping(value = "/qbread",method = RequestMethod.GET)
 	public void qbreadGET(@ModelAttribute("quest_id") int quest_id, Model model) throws Exception {
 		// @ModelAttribute("bno") int bno
 		// => 주소줄에 있는 데이터를 가져와서 사용, 연결된 뷰페이지로 이동 $ {bno}
 		//	  request.getParameter("bno") + request.setAttribute();
 		// => 1:N 관계에서 사용 (N - bean(객체), collection)
 		
 		// @RequestParam("bno") int bno
 		// => request.getParameter("bno") 동일함, 자동형변환 포함(문자,숫자,날짜)
 		// => 1:1 관계에서 사용
 		
 		logger.debug(" qbreadGET() 실행 ");
 		
 		// 전달정보 저장
 		logger.debug(" quest_id : " + quest_id);
 		
 		// 글 조회(읽음) 카운트 증가 => 조회수 1증가
 		mService.qbUpdateReadCnt(quest_id);
 		
 		// 서비스 - DAO 저장된 정보를 가져오기
 		Question_boardDTO qbDTO = mService.qGetBoard(quest_id);
 		logger.debug(" qbDTO : {}", qbDTO);
 		
 		// 전달할 정보를 저장(model)
 		model.addAttribute("qbDTO", qbDTO);
 	}
    

@GetMapping(value="/myticket")
public String MyTicket(HttpSession session, @RequestParam(value = "state", required = false) String state, Model model) throws Exception {
    
    String user_id = (String) session.getAttribute("user_id");
    
    if ("will".equals(state)) {
        // 예정 경기 호출
        List<Game_scheduleDTO> oMatchList = mService.openMatchList(user_id);
        model.addAttribute("oMatchList", oMatchList);
    } else if ("previous".equals(state)) {
        // 지난 경기 호출
        List<Game_scheduleDTO> pMatchList = mService.previousMatchList(user_id);
        model.addAttribute("pMatchList", pMatchList);
    } else {
        // 기본: 두 종류의 경기를 모두 조회
        List<Game_scheduleDTO> oMatchList = mService.openMatchList(user_id);
        List<Game_scheduleDTO> pMatchList = mService.previousMatchList(user_id);
        model.addAttribute("oMatchList", oMatchList);
        model.addAttribute("pMatchList", pMatchList);
    }

    return "/mypage/myticket";
}





}
