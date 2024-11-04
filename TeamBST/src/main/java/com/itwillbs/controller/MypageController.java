package com.itwillbs.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.itwillbs.domain.Category;
import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.MyBoardDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;
import com.itwillbs.domain.Reservation_infoDTO;
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
    public String mypage(HttpSession session, Model model) throws Exception {
    	
    	// id정보 가져오기
        String user_id = (String) session.getAttribute("user_id");
        
        // 서비스 -> DAO 회원정보 조회
        UserDTO resultDTO = mService.getMember(user_id);
        logger.debug("회원정보: " + resultDTO);
        
        // 연결된 뷰페이지(/mypage/info.jsp)에 정보 전달
        model.addAttribute("resultDTO", resultDTO);
        
        // 뷰페이지 이동
    	return "/mypage/mypage";  // mypage.jsp로 이동
    }
    
    //http://localhost:8088/mypage/updateForm
    // 회원정보 수정 - 기존 회원정보
    @GetMapping(value = "/updateForm")
    public String updateGET(HttpSession session, Model model) throws Exception{
        String user_id = (String) session.getAttribute("user_id");
        
        // 서비스 -> DAO 회원정보 조회
        UserDTO resultDTO = mService.getMember(user_id);
//        Game_scheduleDTO gameDTO = sService.gameScheduleList(name)
        
        // 연결된 뷰페이지로 정보 전달
        model.addAttribute("resultDTO", resultDTO);
        
        return "/mypage/updateForm";
        
    }
    
 // 회원정보 수정 - 변경된 내용을 DB에 전달 및 수정
    @RequestMapping(value = "/updateForm", method = RequestMethod.POST)
    public String updatePost(@RequestParam("user_id") String user_id, 
                             @RequestParam("user_pwd") String user_pwd,
                             UserDTO udto, HttpSession session, Model model) throws Exception {
        logger.debug(" /update -> updatePost() 호출 ");
        
        // 사용자 ID로 현재 비밀번호 조회
        String currentPwd = mService.getPassword(user_id);
        
        // 입력한 비밀번호와 현재 비밀번호를 비교
        if (!user_pwd.equals(currentPwd)) {
            session.setAttribute("alertMessage", "비밀번호가 틀려 수정에 실패했습니다");
            UserDTO resultDTO = mService.getMember(user_id);
            model.addAttribute("resultDTO", resultDTO);
        	return "/mypage/updateForm"; // 수정 페이지로 다시 이동
        }
        
        // 비밀번호가 일치하면 회원정보 수정
        mService.updateMember(udto);
        
        return "redirect:/mypage/mypage";
    }
    
    
    //http://localhost:8088/mypage/deleteMember
    // 회원정보 삭제 - 사용자의 비밀번호 입력 / 아이디 세션
    @GetMapping(value = "/deleteMember")
    public String deleteGET(HttpSession session, Model model) throws Exception {
    	String user_id = (String) session.getAttribute("user_id");
    	UserDTO resultDTO = mService.getMember(user_id);
    	model.addAttribute("resultDTO", resultDTO);
    	
    	
    	return "/mypage/deleteMember";
    }
    
    // 회원정보 삭제
    @PostMapping(value = "/deleteMember")
    public String deleteMember(UserDTO ddto, HttpSession session,Model model) throws Exception {
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

            return "/mypage/deleteMember";  // 삭제 실패 시 다시 삭제 페이지로 이동
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
    
    /*
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
    */
    
    // 내 게시글 본문
    @RequestMapping(value = "/pbread",method = RequestMethod.GET)
    public String pbreadGET(@ModelAttribute("post_id") int post_id, Model model) throws Exception {
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
    	
    	return "/mypage/pbread";
    }
    
    // http://localhost:8088/mypage/qbread
    // 질문글 본문보기 - qbreadGET
 	@RequestMapping(value = "/qbread",method = RequestMethod.GET)
 	public String qbreadGET(@ModelAttribute("quest_id") int quest_id, Model model) throws Exception {
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
 		
 		return "/mypage/qbread";
 	}
    
/*
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
*/
 	
 	@GetMapping(value="/myticket")
	public String MyTicket_GET() throws Exception {
	    
 		logger.debug("마이페이지 myTicket 리스트 호출");
		logger.debug(" /myticket -> MyTicket_GET() 호출");
		
		return "/mypage/myticket";
	}
 	
 	@ResponseBody
 	@PostMapping(value="/myticket", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
 	/*public String myTicket_POST(String ticket_status, Model model, HttpSession session) throws Exception {
 		
 		Category cate = new Category();
 		cate.setUser_id((String)session.getAttribute("user_id"));
 		cate.setTicket_status(ticket_status);		*/
	public String myTicket_POST(@RequestBody Category cate, HttpSession session) throws Exception {
		
		cate.setUser_id((String)session.getAttribute("user_id"));
 		
 		logger.debug("마이페이지 myTicket 리스트 호출");
 		logger.debug(" /myticket -> myTicket_POST() 호출");
		
		// 서비스 -> DB의 정보를 가져오기
		logger.debug("cate : "+ cate);
		
		List<Game_scheduleDTO> mTicketList = mService.TicketList(cate);
		
		logger.debug("size : "+ mTicketList.size());
		
		ObjectMapper mapper = new ObjectMapper();
		
        mapper.registerModule(new JavaTimeModule()); // Java 8 날짜 타입 지원
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false); // 타임스탬프로 변환하지 않음
        // 원하는 날짜 포맷 설정 (예: "yyyy-MM-dd")
        mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
        
        String jsonMyTiketList = mapper.writeValueAsString(mTicketList);
        
        List<Reservation_infoDTO> reserSeatList = mService.SeatList(cate);
        logger.debug("@@ 예약 좌석 : " + reserSeatList);
        
        for (Reservation_infoDTO seatInfo : reserSeatList) {
            logger.debug("seat1_id: " + seatInfo.getSeat1_id()); // seat1_id 가져오기
            logger.debug("seat2_id: " + seatInfo.getSeat2_id()); // seat2_id 가져오기
            logger.debug("seat3_id: " + seatInfo.getSeat3_id()); // seat3_id 가져오기
            logger.debug("seat4_id: " + seatInfo.getSeat4_id()); // seat4_id 가져오기
            logger.debug("seat5_id: " + seatInfo.getSeat5_id()); // seat5_id 가져오기
            logger.debug("seat6_id: " + seatInfo.getSeat6_id()); // seat6_id 가져오기
            logger.debug("seat7_id: " + seatInfo.getSeat7_id()); // seat7_id 가져오기
            logger.debug("seat8_id: " + seatInfo.getSeat8_id()); // seat8_id 가져오기
        }
        
        
        logger.debug("**pBoardList : " + mTicketList); // 전체 목록 출력
      
        logger.debug("jsonMyTiketList : " + jsonMyTiketList);
        
        return jsonMyTiketList;
 		
 	}
	
 	/*
	@GetMapping(value="/mywrite")
	public void Mywrite_GET(HttpSession session,Model model) throws Exception{
		String user_id = (String) session.getAttribute("user_id");
		
		// 판매 게시글 확인하기
		List<Post_boardDTO> postBoardList = mService.postBoardList(user_id);
		
		// 문의 게시글 확인하기
		List<Question_boardDTO> questionBoardList = mService.questionBoardList(user_id);
		
		model.addAttribute("postBoardList", postBoardList);
		model.addAttribute("questionBoardList", questionBoardList);
	}
	*/
	
	@GetMapping(value="/mywrite")
	public String myWrite_GET() throws Exception{
		logger.debug("마이페이지 myWrite 리스트 호출");
		logger.debug(" /mywrite -> myWrite_GET() 호출");
	
		return "/mypage/mywrite";
	}

	@ResponseBody
	@RequestMapping(value="/mywrite",method = RequestMethod.POST , produces = MediaType.APPLICATION_JSON_UTF8_VALUE, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String myWrite_POST(@RequestBody Category cate, HttpSession session) throws Exception {
		
		cate.setUser_id((String)session.getAttribute("user_id"));
		
		logger.debug("마이페이지 myWrite 리스트 호출");
		logger.debug(" /mywrite -> myWrite_POST() 호출");
		
		// 서비스 -> DB의 정보를 가져오기
		logger.debug("cate : "+ cate);
		List<MyBoardDTO> mBoardList = mService.MyBoardList(cate);
		logger.debug("size : "+ mBoardList.size());
		logger.debug("mWriteList : "+ mBoardList);
		
		ObjectMapper mapper = new ObjectMapper();
		
		mapper.registerModule(new JavaTimeModule()); // Java 8 날짜 타입 지원
		mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false); // 타임스탬프로 변환하지 않음
		// 원하는 날짜 포맷 설정 (예: "yyyy-MM-dd")
		mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
		
		String jsonMyBoardList = mapper.writeValueAsString(mBoardList);
		logger.debug("jsonMyBoardList : " + jsonMyBoardList);
		
		return jsonMyBoardList;
		
	}






}
