package com.itwillbs.controller;

import java.beans.Encoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.itwillbs.domain.Category;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Post_commendDTO;
import com.itwillbs.domain.Question_commendDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.AdminService;
import com.itwillbs.service.CommunityService;

@Controller
@RequestMapping(value="/community/*")
public class CommunityController {

	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	// 서비스 객체 주입
	@Inject
	private CommunityService cService;
	
	@RequestMapping(value="/community",method=RequestMethod.GET)
	public void coummnityMain_GET(Model model) throws Exception {
		logger.debug("거래 게시판 메인 호출");
		logger.debug(" /community -> coummnityMain_GET() 호출");

	}
	
	// 원래 코드
//	@ResponseBody
//	@RequestMapping(value="/community",method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	public String coummnityMain_POST(@RequestBody Category cate, Model model) throws Exception {
//		logger.debug("거래 게시판 메인 호출");
//		logger.debug(" /community -> coummnityMain_POST() 호출");
//		
//		// 서비스 -> DB의 정보를 가져오기
//		logger.debug("cate : "+ cate);
//		List<Post_boardDTO> pBoardList = cService.PostList(cate);
//		logger.debug("size : "+ pBoardList.size());
//		logger.debug("pBoardList : "+ pBoardList);
//		
//		
//		ObjectMapper mapper = new ObjectMapper();
//		
//        mapper.registerModule(new JavaTimeModule()); // Java 8 날짜 타입 지원
//        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false); // 타임스탬프로 변환하지 않음
//        // 원하는 날짜 포맷 설정 (예: "yyyy-MM-dd")
//        mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
//		
////		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
////        
////        // JSONObject로 변환
////        JSONArray jsonArray = new JSONArray();
////        for (Post_boardDTO post : pBoardList) {
////            JSONObject jsonObject = new JSONObject();
////            jsonObject.put("post_id", post.getPost_id());
////            jsonObject.put("post_writer_id", post.getPost_writer_id());
////            jsonObject.put("post_sub", post.getPost_sub());
////            jsonObject.put("post_cont", post.getPost_cont());
////            jsonObject.put("post_cre_date", sdf.format(post.getPost_cre_date())); // 날짜 포맷 적용
////            jsonObject.put("stad_id", post.getStad_id());
////            jsonObject.put("photo_url", post.getPhoto_url());
////            jsonObject.put("post_view", post.getPost_view());
////            jsonObject.put("sale_status", post.getSale_status());
////            jsonObject.put("sale_ty", post.getSale_ty());
////            jsonObject.put("post_del_at", post.getPost_del_at());
////            jsonObject.put("post_del_date", post.getPost_del_date());
////
////            // userList 처리
////            JSONArray userListJsonArray = new JSONArray();
////            for (UserDTO user : post.getUserList()) {
////                JSONObject userObj = new JSONObject();
////                userObj.put("user_id", user.getUser_id());
////                userObj.put("user_pwd", user.getUser_pwd());
////                userObj.put("user_name", user.getUser_name());
////                userObj.put("user_nick", user.getUser_nick());
////                userObj.put("user_phone", user.getUser_phone());
////                userObj.put("user_email", user.getUser_email());
////                userObj.put("user_birth", user.getUser_birth());
////                userObj.put("join_date", user.getJoin_date());
////                userObj.put("user_serv_agree", user.getUser_serv_agree());
////                userObj.put("user_info_agree", user.getUser_info_agree());
////                userObj.put("user_login_time", user.getUser_login_time());
////                userObj.put("user_active", user.getUser_active());
////                userObj.put("user_status", user.getUser_status());
////                userListJsonArray.put(userObj);
////            }
////            jsonObject.put("userList", userListJsonArray);
////
////            jsonArray.put(jsonObject);
////        }
//        
//        String jsonPOSTBoardList = mapper.writeValueAsString(pBoardList);
//        logger.debug("jsonPOSTBoardList : " + jsonPOSTBoardList);
//        
////        String jsonString = jsonArray.toString();
////        logger.debug("jsonString : " + jsonString);
//
//        return jsonPOSTBoardList;
//		
//	}
	
	
	// gpt 코드
	@ResponseBody
	@RequestMapping(value="/community", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String coummnityMain_POST(@RequestBody Category cate, HttpServletRequest request, Model model) throws Exception {
	    logger.debug("거래 게시판 메인 호출");
	    logger.debug(" /community -> coummnityMain_POST() 호출");

	    int page = Integer.parseInt(request.getHeader("page"));
	    int pageSize = Integer.parseInt(request.getHeader("pageSize"));
	    
	    Criteria cri = new Criteria();
	    cri.setPage(page);
	    cri.setPageSize(pageSize);

	    // 서비스 -> DB의 정보를 가져오기
	    logger.debug("cate : " + cate);
	    logger.debug("cri : " + cri);
	    
	    List<Post_boardDTO> pBoardList = cService.PostList(cate, cri);
	    int totalCount = cService.getTotalCount(cate);

	    logger.debug("size : " + pBoardList.size());
	    logger.debug("pBoardList : " + pBoardList);

	    PageDTO pageDTO = new PageDTO();
	    pageDTO.setCri(cri);
	    pageDTO.setTotalCount(totalCount);

	    model.addAttribute("pBoardList", pBoardList);
	    model.addAttribute("pageDTO", pageDTO);

	    ObjectMapper mapper = new ObjectMapper();
	    mapper.registerModule(new JavaTimeModule());
	    mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
	    mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));

	    Map<String, Object> response = new HashMap<>();
	    response.put("pBoardList", pBoardList);
	    response.put("pageDTO", pageDTO);

	    String jsonResponse = mapper.writeValueAsString(response);
	    logger.debug("jsonResponse : " + jsonResponse);

	    return jsonResponse;
	}

	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/communityWrite",method=RequestMethod.GET)
	public String coummnityWrite_GET(HttpSession session) {
		
        String user_id = (String) session.getAttribute("user_id");
        logger.debug("user_id : "+ user_id);
		
		  if(user_id != null) {
			  logger.debug("거래 게시판 글쓰기 호출");
			  logger.debug(" /adminScheduleUpload -> adminScheduleUpload_GET() 호출");
	        
	        	return "/community/communityWrite";
	        } else {
	        	
	        	logger.debug("로그인을 해야 예매하기를 할 수 있습니다");
	            session.setAttribute("alertMessage", "로그인을 해야 글을 작성할 수 있습니다");

	        	return "redirect:/login/loginPage";
	        }
		

	}
	
	@RequestMapping(value="/communityWrite",method=RequestMethod.POST)
	public String coummnityWrite_POST(Post_boardDTO dto,HttpSession session) {
        String user_id = (String) session.getAttribute("user_id");
		logger.debug("거래 게시판 글쓰기 호출");
		logger.debug(" /adminScheduleUpload -> adminScheduleUpload_POST() 호출");
		dto.setPost_writer_id(user_id);
		logger.debug("dto : "+ dto);
		
		cService.PostJoin(dto);
		
		return "redirect:/community/community";
	}
	
	//  거래 게시판 본문 확인하기
	@GetMapping(value="/communityContent")
	public void communityContent_GET(@RequestParam("post_id") int post_id,HttpSession session, Model model) throws Exception{
		logger.debug("거래 게시판 본문 내용 호출");
		logger.debug(" /communityContent -> communityContent_GET() 호출");

    	// 본문 내용 호출
    	List<Post_boardDTO> PostOneList = cService.PostOneList(post_id);

    	// 조회수 증가
    	cService.updateCount(post_id);
    	
    	
		logger.debug("size : "+ PostOneList.size());
		logger.debug("size : "+ PostOneList);
		List<Post_commendDTO> commentList = cService.getComments(post_id);
        model.addAttribute("CommentList", commentList);
		// 연결된 뷰페이지로 정보 전달
		model.addAttribute("PostOneList", PostOneList);
    	
	}
	
	@PostMapping(value="/communityContent")
	public String adminbulletinContent_POST(Post_commendDTO pcdto,HttpSession session,@RequestParam("post_id") int post_id) throws Exception{
		logger.debug("관리자 문의게시판 답변 쓰기 호출");
		logger.debug(" /adminbulletinContent -> adminbulletinContent_POST() 호출");
		 // 세션에서 user_id 가져오기
	    String userId = (String) session.getAttribute("user_id");
	    logger.debug("세션에서 가져온 user_id: " + userId);
	    // user_id를 dto의 admin_id에 설정
	    pcdto.setComm_writer_id(userId);
	    pcdto.setPost_id(post_id);
	    // 답변 등록 로직처리
        if(userId != null) {
        	cService.communityCommend(pcdto);
        	logger.debug("pcdto : " + pcdto);
        	return "redirect:/community/communityContent?post_id=" + post_id;
	        
	        } else {
	        	
	        	logger.debug("로그인을 해야 댓글을 작성 할 수 있습니다");
	            session.setAttribute("alertMessage", "로그인을 해야 댓글을 작성 할 수 있습니다");

	        	return "redirect:/login/loginPage";
	        }
	    
	}	
	
	
	
//  게시판 글 수정하기(기존의 글정보 확인) - GET
	@GetMapping(value="/communityModify")
	public String communityModify_GET(Post_boardDTO pbdto,HttpSession session,Model model,@RequestParam("post_id") int post_id,@RequestParam("post_writer_id") String post_writer_id) throws Exception{
		logger.debug("거래 게시판 본문 수정 호출");
		logger.debug(" /communityModify -> communityModify_GET() 호출");
			// 전달정보 bno 저장
			logger.debug(" post_id : "+ post_id);
			String user_id = (String) session.getAttribute("user_id");
	        logger.debug("user_id : "+ user_id);
	        logger.debug("post_writer_id : "+ post_writer_id);
	        
	        if (user_id == null) {
	            logger.debug("로그인을 해야 수정을 할 수 있습니다");
	            session.setAttribute("alertMessage", "로그인을 해야 수정을 할 수 있습니다");
	            return "redirect:/login/loginPage";
	        }
	        
	        if (user_id.equals(pbdto.getPost_writer_id())) {
	            List<Post_boardDTO> PostOneList = cService.PostOneList(post_id);
	            logger.debug("size : " + PostOneList.size());
	            logger.debug("PostOneList : " + PostOneList);
	            
	            // 연결된 뷰페이지로 정보 전달
	            model.addAttribute("PostOneList", PostOneList);
	            return "/community/communityModify";
	        } else {
	        	logger.debug("본인이 작성한 글이 아닙니다");
	            session.setAttribute("alertMessage", "본인이 작성한 글이 아닙니다");
	            return "redirect:/community/communityContent?post_id="+post_id;
	        }
	    }
			  
		
	
	
//  게시판 글 수정하기(기존의 글정보 확인) - POST
	@PostMapping(value="/communityModify")
	public String communityModify_POST(Post_boardDTO pbdto,@RequestParam("post_id") int post_id) throws Exception{
		logger.debug("거래 게시판 본문 수정 호출");
		logger.debug(" /communityModify -> communityModify_POST() 호출");
		// 한글처리 인코딩(필터)
		// 전달 정보 저장
		logger.debug("수정할 내용, {} ",pbdto);
		
		// 서비스 - DAO 글내용을 수정
		cService.modifyContent(pbdto);
		
        return "redirect:/community/communityContent?post_id="+post_id;
	}
	
	

//  게시판 글 삭제하기(기존의 글정보 확인) - POST
	@PostMapping(value="/communityDelete")
	public String communityDelete_GET(Post_boardDTO pbdto,HttpSession session,Model model,@RequestParam("post_id") int post_id,@RequestParam("post_writer_id") String post_writer_id) throws Exception{
		logger.debug("거래 게시판 글 삭제 호출");
		logger.debug(" /communityDelete -> communityDelete_GET() 호출");
			// 전달정보 post_id 저장
			logger.debug(" post_id : "+ post_id);
			String user_id = (String) session.getAttribute("user_id");
	        logger.debug("user_id : "+ user_id);
	        logger.debug("post_writer_id : "+ post_writer_id);
	        
	        if (user_id == null) {
	            logger.debug("로그인을 해야 삭제를 할 수 있습니다");
	            session.setAttribute("alertMessage", "로그인을 해야 삭제를 할 수 있습니다");

	            return "redirect:/login/loginPage";
	        }
	        
	        if (user_id.equals(pbdto.getPost_writer_id())) {
	        	// 게시글 삭제하기
	        	cService.deleteContent(post_id);
	        	
	            return "redirect:/community/community";
	        } else {
	        	logger.debug("본인이 작성한 글이 아닙니다");
	        	session.setAttribute("alertMessage", "본인이 작성한 글이 아닙니다");
	            return "redirect:/community/communityContent?post_id="+post_id;
	        }
	    }
			  

	
	
	
	
}
