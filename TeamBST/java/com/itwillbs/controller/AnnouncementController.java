package com.itwillbs.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.Notice_boardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;
import com.itwillbs.domain.Question_commendDTO;
import com.itwillbs.service.AnnouncementService;

@Controller
@RequestMapping(value="/announcement/*")
public class AnnouncementController {
	
	private static final Logger logger = LoggerFactory.getLogger(AnnouncementController.class);

	// 서비스 객체 주입
	@Inject
	private AnnouncementService aService;

	@RequestMapping(value="/announcement",method=RequestMethod.GET)
	public String AnnouncementMain_GET(Criteria cri,Model model,HttpSession session) throws Exception {
		logger.debug("공지 게시판 호출");
	    session.setAttribute("viewed_post_ids", new ArrayList<Integer>());	     

		// 서비스 -> DB의 정보를 가져오기
		List<Notice_boardDTO> nBoardList = aService.NoticeList(cri);
		logger.debug("size : "+ nBoardList.size());
		logger.debug("size : "+ nBoardList);
		
		// 하단 페이징 처리 
		PageDTO pageDTO = new PageDTO();
		pageDTO.setCri(cri);
//		pageVO.setTotalCount(5136);
		pageDTO.setTotalCount(aService.getNoticeTotalCount());
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("nBoardList", nBoardList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/announcement/announcement";
		
		
	}
	
	
	@RequestMapping(value="/bulletin",method=RequestMethod.GET)
	public String announcementBulletin_GET(Criteria cri,Model model,HttpSession session) throws Exception {
		logger.debug("문의 게시판 호출");
	    session.setAttribute("viewed_post_ids", new ArrayList<Integer>());	     

		// 서비스 -> DB의 정보를 가져오기
//		List<Question_boardDTO> qBoardList = aService.QuestionList();
		
		List<Question_boardDTO> qBoardList = aService.questionListPage(cri);
		logger.debug("size : "+ qBoardList.size());
		logger.debug("size : "+ qBoardList);
		
		// 하단 페이징 처리 
		PageDTO pageDTO = new PageDTO();
		pageDTO.setCri(cri);
		pageDTO.setTotalCount(aService.getQuestTotalCount());
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("qBoardList", qBoardList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/announcement/bulletin";
		
		
	}
	
	@RequestMapping(value="/bulletinWrite",method=RequestMethod.GET)
	public String announcementBulletinWrite_GET(HttpServletRequest request,
								HttpSession session) throws Exception {
        String user_id = (String) session.getAttribute("user_id");
        
        logger.debug("user_id : "+ user_id);
        if(user_id != null) {
        	logger.debug("문의 게시판 글쓰기 호출");
        	logger.debug(" /adminScheduleUpload -> adminScheduleUpload_GET() 호출");
        
        } if (session.getAttribute("user_id") == null) {
            String redirectUrl = request.getRequestURL().toString();
            String queryString = request.getQueryString();
            if (queryString != null) {
                redirectUrl += "?" + queryString;
            }
            session.setAttribute("alertMessage", "로그인을 해야 글쓰기를 할 수 있습니다");
            return "redirect:/login/loginPage?redirect=" + URLEncoder.encode(redirectUrl, "UTF-8");
        }
        	
        return "/announcement/bulletinWrite";
	}        
        

	
	
	@RequestMapping(value="/bulletinWrite",method=RequestMethod.POST)
	public String announcementBulletinWrite_POST(Question_boardDTO dto,HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		logger.debug("문의 게시판 글쓰기 호출");
		logger.debug(" /adminScheduleUpload -> adminScheduleUpload_POST() 호출");
		
		dto.setQuest_writer_id(user_id);
		
		logger.debug("dto : "+ dto);
		
		aService.QuestionJoin(dto);
		
		return "redirect:/announcement/bulletin";
		
	}
	
//  공지사항 게시판 본문 확인하기
	@GetMapping(value="/announcementContent")
	public void communityContent_GET(@RequestParam("notice_id") int notice_id,Model model,HttpSession session) throws Exception{
		logger.debug("본문 내용 호출");
    	logger.debug(" notice_id : " + notice_id);
		 // 세션에서 'viewed_post_id' 속성 확인
        @SuppressWarnings("unchecked")
        List<Integer> viewedPostIds = (List<Integer>) session.getAttribute("viewed_post_ids");
        
        // 세션에 'viewed_post_id' 속성이 없으면 초기화
        if (viewedPostIds == null) {
            viewedPostIds = new ArrayList<>();
            session.setAttribute("viewed_post_ids", viewedPostIds);
        }
        
        // 현재 포스트 ID가 'viewed_post_id' 리스트에 없는 경우 조회수 증가
        if (!viewedPostIds.contains(notice_id)) {
        	aService.updateNoticeCount(notice_id);
            viewedPostIds.add(notice_id);
        }
        
    	// 조회수 1 증가

    	
    	List<Post_boardDTO> noticeOneList = aService.noticeOneList(notice_id);
    	
		logger.debug("size : "+ noticeOneList.size());
		logger.debug("size : "+ noticeOneList);
		
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("noticeOneList", noticeOneList);
    	
	}
	
	// 기존코드
//  문의 게시판 본문 확인하기
//	@GetMapping(value="/bulletinContent")
//	public void bulletinContent_GET(@RequestParam("quest_id") int quest_id,HttpSession session,  Model model) throws Exception{
//		logger.debug("본문 내용 호출");
//    	logger.debug(" quest_id : " + quest_id);
//        String user_id = (String) session.getAttribute("user_id");
//
//    	
//    	// 조회수 1 증가
//    	aService.updateQuestCount(quest_id);
//
//    	List<Question_boardDTO> QuestionOneList = aService.QuestionOneList(quest_id);
//    	
//    	List<Question_commendDTO> QuestionCommendList = aService.QuestionCommendList(quest_id);
//    	
//    	
//    	logger.debug("size : "+ QuestionOneList.size());
//    	logger.debug("size : "+ QuestionOneList);
//    	
//		
//		// 연결된 뷰페이지로 정보 전달
//		model.addAttribute("QuestionOneList", QuestionOneList);
//		model.addAttribute("QuestionCommendList", QuestionCommendList);
//    	
//	}
	
	// 변경된 코드
//  문의 게시판 본문 확인하기
@GetMapping(value="/bulletinContent")
public String bulletinContent_GET(@RequestParam("quest_id") int quest_id, HttpSession session, Model model) throws Exception {
    logger.debug("본문 내용 호출");
    logger.debug(" quest_id : " + quest_id);
    String user_id = (String) session.getAttribute("user_id");

    // 세션에서 'viewed_post_id' 속성 확인
    @SuppressWarnings("unchecked")
    List<Integer> viewedPostIds = (List<Integer>) session.getAttribute("viewed_post_ids");
    
    // 세션에 'viewed_post_id' 속성이 없으면 초기화
    if (viewedPostIds == null) {
        viewedPostIds = new ArrayList<>();
        session.setAttribute("viewed_post_ids", viewedPostIds);
    }
    
    // 현재 포스트 ID가 'viewed_post_id' 리스트에 없는 경우 조회수 증가
    if (!viewedPostIds.contains(quest_id)) {
    	aService.updateQuestCount(quest_id);
        viewedPostIds.add(quest_id);
    }
    
    // 조회수 1 증가

    List<Question_boardDTO> QuestionOneList = aService.QuestionOneList(quest_id);

    // 게시글의 공개 여부와 작성자 아이디 확인
    if (QuestionOneList.size() > 0) {
        Question_boardDTO question = QuestionOneList.get(0);
        String questPublic = question.getQuest_public(); // 비공개 여부 확인
        String writer_id = question.getQuest_writer_id();

        // 비공개 게시글일 경우 작성자와 현재 사용자 비교
        if ("N".equals(questPublic) && !writer_id.equals(user_id)) {
            session.setAttribute("alertMessage", "본인이 작성한 게시글만 열람할수 있는 게시물입니다");
            return "redirect:/announcement/bulletin"; // 에러 페이지로 이동
        }
    }

    List<Question_commendDTO> QuestionCommendList = aService.QuestionCommendList(quest_id);

    logger.debug("size : " + QuestionOneList.size());
    logger.debug("size : " + QuestionOneList);

    // 연결된 뷰페이지로 정보 전달
    model.addAttribute("QuestionOneList", QuestionOneList);
    model.addAttribute("QuestionCommendList", QuestionCommendList);
    
    return "/announcement/bulletinContent"; // 뷰 페이지 이름 반환
}

	
	
	
	
	
	
	
	
//  게시판 글 수정하기(기존의 글정보 확인) - GET
	@GetMapping(value="/bulletinModify")
	public String bulletinModify_GET(Question_boardDTO qbdto,HttpSession session,HttpServletRequest request,Model model,@RequestParam("quest_id") int quest_id,@RequestParam("quest_writer_id") String quest_writer_id) throws Exception{
		logger.debug(" bulletinModify() 실행");
			// 전달정보 bno 저장
			logger.debug(" quest_id : "+ quest_id);
			String user_id = (String) session.getAttribute("user_id");
	        logger.debug("user_id : "+ user_id);
	        logger.debug("quest_writer_id : "+ quest_writer_id);
	        if (user_id == null) {
	        	 // 로그인 페이지로 리다이렉트할 때 현재 페이지의 URL을 쿼리 파라미터로 전달
	            String redirectUrl = request.getRequestURL().toString() + "?quest_id=" + quest_id+"&quest_writer_id="+quest_writer_id;
	            redirectUrl = URLEncoder.encode(redirectUrl, "UTF-8");

	            logger.debug("로그인을 해야 수정을 할 수 있습니다");
	            session.setAttribute("alertMessage", "로그인을 해야 수정을 할 수 있습니다");

	            return "redirect:/login/loginPage?redirect=" + redirectUrl;
	        }

	        else if (user_id.equals(quest_writer_id)) {
	            List<Question_boardDTO> QuestionOneList = aService.QuestionOneList(quest_id);
	            logger.debug("size : " + QuestionOneList.size());
	            logger.debug("QuestionOneList : " + QuestionOneList);
	            
	            // 연결된 뷰페이지로 정보 전달
	            model.addAttribute("QuestionOneList", QuestionOneList);
	            return "/announcement/bulletinModify";
	        } else {
	        	logger.debug("본인이 작성한 글이 아닙니다");
	        	session.setAttribute("alertMessage", "본인이 작성한 글이 아닙니다");

	            return "redirect:/announcement/bulletinContent?quest_id="+quest_id;
	        }
	    }
			  
		
	
	
//  게시판 글 수정하기(기존의 글정보 확인) - POST
	@PostMapping(value="/bulletinModify")
	public String bulletinModify_POST(Question_boardDTO qbdto,@RequestParam("quest_id") int quest_id) throws Exception{
		logger.debug("bulletinModify()실행 ");
		// 한글처리 인코딩(필터)
		// 전달 정보 저장
		logger.debug("수정할 내용, {} ",qbdto);
		
		// 서비스 - DAO 글내용을 수정
		aService.bulletinModify(qbdto);
		
        return "redirect:/announcement/bulletinContent?quest_id="+quest_id;
	}
	
	

//  게시판 글 삭제하기(기존의 글정보 확인) - POST
	@PostMapping(value="/bulletinDelete")
	public String communityDelete_GET(Question_boardDTO qbdto,HttpSession session,Model model,@RequestParam("quest_id") int quest_id,@RequestParam("quest_writer_id") String quest_writer_id) throws Exception{
		logger.debug(" communityDeleteGET() 실행");
			// 전달정보 post_id 저장
			logger.debug(" quest_id : "+ quest_id);
			String user_id = (String) session.getAttribute("user_id");
	        logger.debug("user_id : "+ user_id);
	        logger.debug("quest_writer_id : "+ quest_writer_id);
	        
	        if (user_id == null) {
	            logger.debug("로그인을 해야 삭제를 할 수 있습니다");
	        	session.setAttribute("alertMessage", "로그인을 해야 삭제를 할 수 있습니다");

	            return "redirect:/login/loginPage";
	        }
	        
	        if (user_id.equals(qbdto.getQuest_writer_id())) {
	        	// 게시글 삭제하기
	        	aService.bulletinDelete(quest_id);
	        	
	            return "redirect:/announcement/bulletin";
	        } else {
	        	logger.debug("본인이 작성한 글이 아닙니다");
	        	session.setAttribute("alertMessage", "본인이 작성한 글이 아닙니다");

	            return "redirect:/announcement/bulletinContent?quest_id="+quest_id;
	        }
	    }	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
