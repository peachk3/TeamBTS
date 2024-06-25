package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Notice_boardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;
import com.itwillbs.domain.Question_commendDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.AdminService;

@Controller
@RequestMapping(value="/admin/*")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	// 서비스 객체 주입
	@Inject
	private AdminService aService;

	//http://localhost:8088/admin/admin
	@RequestMapping(value="/admin",method=RequestMethod.GET)
	public String adminMain_GET(HttpSession session,Model model) throws Exception {
//		logger.debug("관리자 페이지 호출");
//		// id정보 가져오기
		String user_id = (String) session.getAttribute("user_id");
		logger.debug("user_id : "+user_id);
		
		// 회원정보 조회
	    AdminDTO resultDTO = aService.getMember(user_id);
	    logger.debug("회원정보: " + resultDTO);
	    
	    // 관리자인지 확인
	    if (resultDTO == null || !resultDTO.isAdmin()) {
	        logger.debug("관리자가 아님");
	        return "redirect:/login/AdminLoginPage";
	    }
	    
	    // 연결된 뷰페이지(/mypage/info.jsp)에 정보 전달
	    model.addAttribute("resultDTO", resultDTO);
	    
	    // 뷰페이지 이동
	    return "/admin/admin";  // admin.jsp로 이동
	}
		
//}	
//	
//    //http://localhost:8088/admin/adminUpdateForm
//    // 관리자 개인정보 수정 - 기존 정보
//    @GetMapping(value = "/adminUpdateForm")
//    public void updateGET(HttpSession session, Model model) throws Exception {
//        String user_id = (String) session.getAttribute("user_id");
//        
//        // 서비스 -> DAO 회원정보 조회
//        AdminDTO resultDTO = aService.getMember(user_id);
////        Game_scheduleDTO gameDTO = sService.gameScheduleList(name)
//        
//        // 연결된 뷰페이지로 정보 전달
//        model.addAttribute("resultDTO", resultDTO);
//        
//        // 연결된 뷰페이지(/admin/adminUpdate.jsp)에 출력
//    }
//    
//    // 관리자 회원정보 수정 - 변경된 내용을 DB에 전달 및 수정
//    @RequestMapping(value = "/adminUpdateForm", method = RequestMethod.POST)
//    public String updatePost(AdminDTO adto) throws Exception {
//    	logger.debug(" /update -> updatePost() 호출 ");
//    	
//    	// 수정할 회원정보를 저장
//    	logger.debug(" adto : " + adto);
//    	
//    	// Service -> DAO 회원정보 수정
//        aService.updateAdminMember(adto);
//        logger.debug(" adto : " + adto);
//        
//        return "redirect:/admin/admin";
//    }
    @GetMapping(value = "/adminUpdateForm")
    public void updateGET(HttpSession session, Model model) throws Exception {
        String user_id = (String) session.getAttribute("user_id");

        // 서비스 -> DAO 회원정보 조회
        AdminDTO resultDTO = aService.getMember(user_id);

        // 연결된 뷰페이지로 정보 전달
        model.addAttribute("resultDTO", resultDTO);

        // 연결된 뷰페이지(/admin/adminUpdate.jsp)에 출력
    }

    // 관리자 회원정보 수정 - 변경된 내용을 DB에 전달 및 수정
    @RequestMapping(value = "/adminUpdateForm", method = RequestMethod.POST)
    public String updatePost(AdminDTO adto, @RequestParam("admin_pwd") String admin_pwd, HttpSession session,Model model) throws Exception {
        String user_id = (String) session.getAttribute("user_id");

        // 현재 비밀번호 확인
        AdminDTO currentAdmin = aService.getMember(user_id);
        if (currentAdmin != null && currentAdmin.getAdmin_pwd().equals(admin_pwd)) {
            // 수정할 회원정보를 저장
            aService.updateAdminMember(adto);
            return "redirect:/admin/admin";
        } else {
            // 비밀번호 불일치 시 처리
            session.setAttribute("alertMessage", "비밀번호가 일치하지않아 수정할 수 없습니다");
            return "redirect:/admin/adminUpdateForm";
        }
    }
	
    //http://localhost:8088/mypage/adminDeleteMember
    // 관리자 회원정보 삭제 - 사용자의 비밀번호 입력 / 아이디 세션
    @GetMapping(value = "/adminDeleteMember")
    public void deleteGET(HttpSession session, Model model) throws Exception {
    	String user_id = (String) session.getAttribute("user_id");
    	AdminDTO resultDTO = aService.getMember(user_id);
    	model.addAttribute("resultDTO", resultDTO);
    }
    
    // 관리자 회원정보 삭제
    @PostMapping(value = "/adminDeleteMember")
    public String deleteMember(AdminDTO adto, HttpSession session,Model model) throws Exception {
    	logger.debug(" /deleteMember -> deleteMember() 호출 ");
    	
    	// 전달정보 저장
    	logger.debug(" userDTO : " + adto );
        
        // 계정 정보 삭제( USE -> OUT으로 상태 변경)
        boolean isDeleted = aService.deleteAdminMember(adto);
        
        if (isDeleted) {
            session.invalidate();  // 세션 무효화
            logger.debug("비밀번호가 일치합니다 -> 회원탈퇴 성공!");
            
            return "redirect:/admin/admin";  // 삭제 성공 시 메인 페이지로 리다이렉트
        } else {
        	   // 삭제 실패 시 현재 세션에서 user_id를 다시 가져와서 resultDTO에 설정
            String user_id = (String) session.getAttribute("user_id");
            AdminDTO resultDTO = aService.getMember(user_id);
            model.addAttribute("resultDTO", resultDTO);
            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");

            logger.debug("비밀번호가 일치하지 않습니다");

            return "admin/adminDeleteMember";  // 삭제 실패 시 다시 삭제 페이지로 이동
	}    
}
	
	
	
	
	
	
	
	@RequestMapping(value="/adminNotice",method=RequestMethod.GET)
	public String adminNotice_GET(HttpSession session,Criteria cri,Model model) throws Exception{
		logger.debug("관리자 공지사항 리스트 호출");
//		// id정보 가져오기
	    String user_id = (String) session.getAttribute("user_id");
	    logger.debug("user_id : "+user_id);
	    AdminDTO resultDTO = aService.getMember(user_id);

	    // 관리자인지 확인
	    if (resultDTO == null || !resultDTO.isAdmin()) {
	        logger.debug("관리자가 아님");
	        return "redirect:/login/AdminLoginPage";
	    }
	    
		// 서비스 -> DB의 정보를 가져오기
//		List<Notice_boardDTO> nBoardList = aService.NoticeList();
		
		// 페이징 처리된 리스트
		List<Notice_boardDTO> nBoardList = aService.NoticeListPage(cri);
		logger.debug("size : "+ nBoardList.size());
	
		// 하단 페이징 처리 
		PageDTO pageDTO = new PageDTO();
		pageDTO.setCri(cri);
		pageDTO.setTotalCount(aService.getNoticeTotalCount());
		
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("nBoardList", nBoardList);
		model.addAttribute("pageDTO", pageDTO);

		return "/admin/adminNotice";

	}
	
	@GetMapping(value="/adminNoticeContent")
	public void adminNoticeContent_GET(@RequestParam("notice_id") int notice_id, Model model) throws Exception{
		// 서비스 -> DB의 정보를 가져오기
		logger.debug("관리자 - 공지사항 본문 내용 호출");
		List<Notice_boardDTO> noticeOneList = aService.noticeOneList(notice_id);
		logger.debug("size : "+ noticeOneList.size());
		
		// 조회수 증가 로직
    	aService.updateNoticeCount(notice_id);

		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("noticeOneList", noticeOneList);
		
		
	}
	
	
	
	
	@RequestMapping(value="/adminNoticeWrite", method=RequestMethod.GET)
	public void adminNoticeWrite_GET(Notice_boardDTO dto, HttpSession session) {
	    logger.debug("관리자 공지사항 글쓰기 호출");
	    logger.debug(" /adminNoticeWrite -> adminNoticeWrite_GET() 호출");
	    
	    // 세션에서 user_id 가져오기
	    String userId = (String) session.getAttribute("user_id");
	    logger.debug("세션에서 가져온 user_id: " + userId);
	    
	    // user_id를 dto의 admin_id에 설정
	    dto.setAdmin_id(userId);

	    logger.debug("dto : " + dto);
	}
	
	@RequestMapping(value="/adminNoticeWrite",method=RequestMethod.POST)
	public String adminNoticeWrite_POST(Notice_boardDTO dto,HttpSession session) throws Exception {
        
        logger.debug("관리자 공지사항 글쓰기 호출");
		logger.debug(" /adminNoticeWrite -> adminNoticenWrite_POST() 호출");
		
		logger.debug("dto : "+ dto);
		
		aService.NoticeJoin(dto);
		
		return "redirect:/admin/adminNotice";
	}	
	
	
//  관리자- 공지게시글 수정하기(기존의 글정보 확인) - GET
	@GetMapping(value="/adminNoticeModify")
	public String adminNoticeModify_GET(Notice_boardDTO nbdto,HttpSession session,Model model,@RequestParam("notice_id") int notice_id,@RequestParam("admin_id") String admin_id) throws Exception{
		logger.debug(" communityModifyGET() 실행");
			// 전달정보 bno 저장
			logger.debug(" notice_id : "+ notice_id);
			String user_id = (String) session.getAttribute("user_id");
	        logger.debug("user_id : "+ user_id);
	        logger.debug("admin_id : "+ admin_id);
	        
	        if (user_id == null) {
	            logger.debug("로그인을 해야 수정을 할 수 있습니다");
	            return "redirect:/login/loginPage";
	        }
	        
	        if (user_id.equals(nbdto.getAdmin_id())) {
	            List<Notice_boardDTO> noticeOneList = aService.noticeOneList(notice_id);
	            logger.debug("size : " + noticeOneList.size());
	            logger.debug("noticeOneList : " + noticeOneList);
	            
	            // 연결된 뷰페이지로 정보 전달
	            model.addAttribute("noticeOneList", noticeOneList);
	            return "/admin/adminNoticeModify";
	        } else {
	        	logger.debug("본인이 작성한 글이 아닙니다");
	            return "redirect:/admin/adminNoticeContent?notice_id="+notice_id;
	        }
	    }
	
//  관리자- 공지게시글 수정하기(기존의 글정보 확인) - POST
	@PostMapping(value="/adminNoticeModify")
	public String communityModify_POST(Notice_boardDTO nbdto,@RequestParam("notice_id") int notice_id) throws Exception{
		logger.debug("modifyPOST()실행 ");
		// 한글처리 인코딩(필터)
		// 전달 정보 저장
		logger.debug("수정할 내용, {} ",nbdto);
		
		// 서비스 - DAO 글내용을 수정
		aService.adminNoticeModify(nbdto);
		
        return "redirect:/admin/adminNoticeContent?notice_id="+notice_id;
	}	
	
//  공지사항 글  삭제하기(기존의 글정보 확인) - POST
	@PostMapping(value="/adminNoticeDelete")
	public String adminNoticeDelete_GET(Notice_boardDTO nbdto,HttpSession session,Model model,@RequestParam("notice_id") int notice_id,@RequestParam("admin_id") String admin_id) throws Exception{
		logger.debug(" communityDeleteGET() 실행");
			// 전달정보 post_id 저장
			logger.debug(" notice_id : "+ notice_id);
			String user_id = (String) session.getAttribute("user_id");
	        logger.debug("user_id : "+ user_id);
	        logger.debug("admin_id : "+ admin_id);
	        
	        if (user_id == null) {
	            logger.debug("로그인을 해야 삭제를 할 수 있습니다");
	            return "redirect:/login/loginPage";
	        }
	        
	        if (user_id.equals(nbdto.getAdmin_id())) {
	        	// 게시글 삭제하기
	        	aService.deleteNoticeContent(notice_id);
	        	
	            return "redirect:/admin/adminNotice";
	        } else {
	        	logger.debug("본인이 작성한 글이 아닙니다");
	            return "redirect:/admin/adminNoticeContent?notice_id="+notice_id;
	        }
	    }
	
	
	
	
	
	
	
	@RequestMapping(value="/adminMember",method=RequestMethod.GET)
	public String adminMember_GET(HttpSession session,Model model) throws Exception{
		logger.debug("관리자 회원현황 호출");
//		// id정보 가져오기
	    String user_id = (String) session.getAttribute("user_id");
	    logger.debug("user_id : "+user_id);
	    AdminDTO resultDTO = aService.getMember(user_id);

	    // 관리자인지 확인
	    if (resultDTO == null || !resultDTO.isAdmin()) {
	        logger.debug("관리자가 아님");
	        return "redirect:/login/AdminLoginPage";
	    }
		// 일반 회원수 출력
		int generalMemberNum = aService.generalMemberCount();
		model.addAttribute("generalMemberNum", generalMemberNum);
		
		// 탈퇴 회원 수 출력
		int withdrawMemberNum = aService.withdrawMemberCount();
		model.addAttribute("withdrawMemberNum", withdrawMemberNum);
		

		
		
		return "/admin/adminMember";

	}
	
	@RequestMapping(value="/adminGeneralMember",method=RequestMethod.GET)
	public String adminGeneralUserList_GET(Criteria cri,Model model) throws Exception {
		logger.debug("관리자 일반회원 호출");
		
		// 일반회원 리스트
//		List<UserDTO> generalMemberList = aService.generalMemberList();
		// 페이징 처리한 일반회원
		List<UserDTO> generalMemberList = aService.generalMemberList(cri);
		
		logger.debug("size : "+ generalMemberList.size());
		logger.debug("size : "+ generalMemberList);
		
		// 하단 페이징 처리 
		PageDTO pageDTO = new PageDTO();
		pageDTO.setCri(cri);
//		pageVO.setTotalCount(5136);
		pageDTO.setTotalCount(aService.getGeneralMemberTotalCount());
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("generalMemberList", generalMemberList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/admin/adminGeneralMember";
		
	}	
	
	@RequestMapping(value="/adminWithdrawMember",method=RequestMethod.GET)
	public String adminWithdrawMember_GET(Criteria cri,Model model) throws Exception {
		logger.debug("관리자 탈퇴회원 호출");
		
		// 탈퇴회원 리스트
//		List<UserDTO> withdrawMemberList = aService.withdrawMemberList();
		
		// 페이징 처리한 탈퇴회원
		List<UserDTO> withdrawMemberList = aService.withdrawMemberListPage(cri);
		
		logger.debug("size : "+ withdrawMemberList.size());
		logger.debug("size : "+ withdrawMemberList);
		
		// 하단 페이징 처리 
		PageDTO pageDTO = new PageDTO();
		pageDTO.setCri(cri);
//		pageVO.setTotalCount(5136);
		pageDTO.setTotalCount(aService.getwithdrawMemberTotalCount());
		
		// 연결된 뷰페이지로 정보 전달
		
		
		model.addAttribute("withdrawMemberList", withdrawMemberList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/admin/adminWithdrawMember";
		
		
	}

	
	
	@RequestMapping(value="/adminSchedule",method=RequestMethod.GET)
	public String adminSchedule_GET(HttpSession session,Criteria cri,Model model) throws Exception {
		logger.debug("관리자 경기일정 호출");
//		// id정보 가져오기
	    String user_id = (String) session.getAttribute("user_id");
	    logger.debug("user_id : "+user_id);
	    AdminDTO resultDTO = aService.getMember(user_id);

	    // 관리자인지 확인
	    if (resultDTO == null || !resultDTO.isAdmin()) {
	        logger.debug("관리자가 아님");
	        return "redirect:/login/AdminLoginPage";
	    }
		// 서비스 -> DB의 정보를 가져오기
//		List<Game_scheduleDTO> gScheduleList = aService.ScheduleList();

		// 페이징 처리된 리스트
		List<Notice_boardDTO> gScheduleList = aService.ScheduleListPage(cri);
		logger.debug("size : "+ gScheduleList.size());
	
		// 하단 페이징 처리 
		PageDTO pageDTO = new PageDTO();
		pageDTO.setCri(cri);
		pageDTO.setTotalCount(aService.getScheduleTotalCount());
		
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("gScheduleList", gScheduleList);
		model.addAttribute("pageDTO", pageDTO);
		
		
		return "admin/adminSchedule";

	}	
	
	@RequestMapping(value="/adminScheduleUpload",method=RequestMethod.GET)
	public void adminScheduleUpload_GET() throws Exception{
		logger.debug("관리자 경기일정 업로드 호출");
		
		
		logger.debug(" /adminScheduleUpload -> adminScheduleUpload_GET() 호출");
		
		
		
		
		
	}
	
	@RequestMapping(value="/adminScheduleUpload",method=RequestMethod.POST)
	public String adminScheduleUpload_POST(Game_scheduleDTO dto) throws Exception{
		logger.debug("관리자 경기일정 업로드 호출");
		logger.debug(" /adminScheduleUpload -> adminScheduleUpload_POST() 호출");
		
		logger.debug("dto : "+ dto);
		
		aService.ScheduleJoin(dto);
		
		return "redirect:/admin/adminSchedule";
		
	}
	
	// 경기 일정 수정 GET / 페이지 호출
	@RequestMapping(value="/adminScheduleUpdate",method=RequestMethod.GET)
	public String  adminScheduleUpdate_GET(@RequestParam("game_id") int game_id, Model model) throws Exception{
		logger.debug(" /adminScheduleUpdate -> adminScheduleUpdate_GET() 호출");
		logger.debug(" @@@@@@@@@@@@@@@@@@@@@@@ "+ game_id);

		// 서비스 -> DB의 정보를 가져오기
		Game_scheduleDTO gScheduleOne = aService.ScheduleOne(game_id);
		
		logger.debug("gScheduleOne : "+ gScheduleOne);
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("gScheduleOne", gScheduleOne);
	
	    return "admin/adminScheduleUpdate"; 
	}
	
	
	@RequestMapping(value="/adminScheduleUpdate", method=RequestMethod.POST)
	public String adminScheduleUpdate_POST(Game_scheduleDTO dto) throws Exception {
	    logger.debug(" /adminScheduleUpdate -> adminScheduleUpdate_POST() 호출");
	    logger.debug("dto : " + dto);
	    
	    aService.updateSchedule(dto);
	    
	    return "redirect:/admin/adminSchedule";
	}
	
	
	
	@RequestMapping(value="/adminBulletin",method=RequestMethod.GET)
	public void adminWithdrawBulletin_GET(Criteria cri,Model model) throws Exception{
		logger.debug("관리자 문의 게시판 호출");

//			List<Question_boardDTO> questionList = aService.questionList();
			List<Notice_boardDTO> questionList = aService.questionListPage(cri);
			// 페이징 처리된 리스트
			logger.debug("size : "+ questionList.size());
		
			// 하단 페이징 처리 
			PageDTO pageDTO = new PageDTO();
			pageDTO.setCri(cri);
			pageDTO.setTotalCount(aService.getQestionTotalCount());
			
			
			// 연결된 뷰페이지로 정보 전달
			model.addAttribute("questionList", questionList);
			model.addAttribute("pageDTO", pageDTO);
			
			
			
		}
		
	
// 기존 코드
	
//  관리자 - 문의 게시판 본문 확인하기
//	@GetMapping(value="/adminbulletinContent")
//	public void adminbulletinContent_GET(@RequestParam("quest_id") int quest_id, Model model) throws Exception{
//		logger.debug("관리자 - 문의게시판 본문 내용 호출");
//    	logger.debug(" quest_id : " + quest_id);
//
//    	// 본문 호출
//    	List<Question_boardDTO> QuestionOneList = aService.QuestionOneList(quest_id);
//    	
//    	// 조회수 증가 로직
//    	aService.updateQuestCount(quest_id);
//    	
//		logger.debug("size : "+ QuestionOneList.size());
//		logger.debug("size : "+ QuestionOneList);
//		
//		// 연결된 뷰페이지로 정보 전달
//		model.addAttribute("QuestionOneList", QuestionOneList);
//		
//	}
//	
//	@PostMapping(value="/adminbulletinContent")
//	public String adminbulletinContent_POST(Question_commendDTO qcdto,HttpSession session,@RequestParam("quest_id") int quest_id) throws Exception{
//		logger.debug("관리자 문의게시판 답변 쓰기 호출");
//		logger.debug(" /adminbulletinContent -> adminbulletinContent_POST() 호출");
//		 // 세션에서 user_id 가져오기
//	    String userId = (String) session.getAttribute("user_id");
//	    logger.debug("세션에서 가져온 user_id: " + userId);
//	    
//	    // user_id를 dto의 admin_id에 설정
//	    qcdto.setAdmin_id(userId);
//	    qcdto.setQuest_id(quest_id);
//	    // 답변 등록 로직처리
//        aService.questionCommend(qcdto);
//        logger.debug("qcdto : " + qcdto);
//	    
//	    
//        return "redirect:/admin/adminbulletinContent?quest_id=" + quest_id;
//	}
		
	
// gpt 코드
	// 관리자 - 문의 게시판 본문 확인하기
	@GetMapping(value="/adminbulletinContent")
	public String adminbulletinContent_GET(@RequestParam("quest_id") int quest_id, Model model) throws Exception{
	    logger.debug("관리자 - 문의게시판 본문 내용 호출");
	    logger.debug("quest_id : " + quest_id);

	    // 본문 호출
	    List<Question_boardDTO> QuestionOneList = aService.QuestionOneList(quest_id);
	    
	    // 답변 호출
	    List<Question_commendDTO> CommentList = aService.getComments(quest_id);

	    // 조회수 증가 로직
	    aService.updateQuestCount(quest_id);
	    
	    logger.debug("QuestionOneList size : "+ QuestionOneList.size());
	    logger.debug("QuestionOneList : "+ QuestionOneList);
	    logger.debug("CommentList size : "+ CommentList.size());
	    logger.debug("CommentList : "+ CommentList);
	    
	    // 연결된 뷰페이지로 정보 전달
	    model.addAttribute("QuestionOneList", QuestionOneList);
	    model.addAttribute("CommentList", CommentList);

	    return "/admin/adminbulletinContent"; // JSP 파일 경로 수정 필요
	}


	@PostMapping(value="/adminbulletinContent")
	public String adminbulletinContent_POST(Question_commendDTO qcdto, HttpSession session, @RequestParam("quest_id") int quest_id) throws Exception{
	    logger.debug("관리자 문의게시판 답변 쓰기 호출");
	    logger.debug(" /adminbulletinContent -> adminbulletinContent_POST() 호출");
	    // 세션에서 user_id 가져오기
	    String userId = (String) session.getAttribute("user_id");
	    logger.debug("세션에서 가져온 user_id: " + userId);
	    
	    // user_id를 dto의 admin_id에 설정
	    qcdto.setAdmin_id(userId);
	    qcdto.setQuest_id(quest_id);
	    // 답변 등록 로직처리
	    aService.questionCommend(qcdto);
	    logger.debug("qcdto : " + qcdto);
	    
	    return "redirect:/admin/adminbulletinContent?quest_id=" + quest_id;
	}	
		
	
	
	

	
	// 일반회원의 예매 내역 조회
//	@GetMapping(value="/adminMemberTicket")
//	public void adminMemberticketing(@RequestParam("user_id") String user_id, Model model) throws Exception {
//		logger.debug("관리자 - 일반회원의 예매 내역 리스트 조회");
//		
//		logger.debug("user_id = "+user_id);
//		
//		List<Game_scheduleDTO> memberTicketingList = aService.memberTicketingList(user_id);
//		
//		// 연결된 뷰페이지로 정보 전달
//		model.addAttribute("memberTicketingList", memberTicketingList);
//		
//	}
//	
//	
	
	// gpt 코드
	@GetMapping(value="/adminMemberTicket")
	public String adminMemberticketing(@RequestParam("user_id") String user_id,
	                                   @RequestParam(value = "page", defaultValue = "1") int page,
	                                   @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
	                                   Model model) throws Exception {
	    logger.debug("관리자 - 일반회원의 예매 내역 리스트 조회");
	    logger.debug("user_id = " + user_id);
	    
	    Criteria cri = new Criteria();
	    cri.setPage(page);
	    cri.setPageSize(pageSize);
	    
	    List<Game_scheduleDTO> memberTicketingList = aService.memberTicketingList(user_id, cri);
	    int totalCount = aService.getTotalCount(user_id);  // 총 예매 내역 수를 가져오는 메소드 호출
	    
	    PageDTO pageDTO = new PageDTO();
	    pageDTO.setCri(cri);
	    pageDTO.setTotalCount(totalCount);
	    
	    model.addAttribute("memberTicketingList", memberTicketingList);
	    model.addAttribute("pageDTO", pageDTO);  // pageMaker에서 pageDTO로 수정
	    
	    return "admin/adminMemberTicket";  // 해당 JSP 페이지로 이동
	}


	
	
	
	
	
	
	
	
}
