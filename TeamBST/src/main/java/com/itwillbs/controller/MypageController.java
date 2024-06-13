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

import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.MypageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping(value = "/mypage/*")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

    @Inject
    private MypageService mService;

    @RequestMapping(value="/info", method = RequestMethod.GET)
    public String infoGET(HttpSession session, Model model) {
        String user_id = (String) session.getAttribute("user_id");
        UserDTO resultDTO = mService.getMember(user_id);
        logger.debug("회원정보: " + resultDTO);
        model.addAttribute("user", resultDTO);
        return "/mypage/info";
    }

    @GetMapping(value = "/updateForm")
    public void updateGET(HttpSession session, Model model) {
        String user_id = (String) session.getAttribute("user_id");
        UserDTO resultDTO = mService.getMember(user_id);
        model.addAttribute("user", resultDTO);
    }

    @RequestMapping(value = "/updateForm", method = RequestMethod.POST)
    public String updatePost(UserDTO udto) {
        mService.updateMember(udto);
        return "redirect:/mypage/info";
    }
    
    @PostMapping(value = "/deleteMember")
    public String deleteMember(UserDTO userDTO, HttpSession session, RedirectAttributes redirectAttributes) {
    	// 비밀번호 확인
    	UserDTO user = mService.getMember(userDTO.getUser_id());
    	if(user != null && user.getUser_pwd().equals(userDTO.getUser_pwd())) {
    		int result = mService.deleteMember(userDTO);
    		if (result > 0) {
                session.invalidate();  // 세션 종료
                redirectAttributes.addFlashAttribute("message", "회원 탈퇴가 완료되었습니다.");
                return "redirect:/login"; // 로그인 페이지로 리다이렉트
            } else {
                redirectAttributes.addFlashAttribute("error", "회원 탈퇴에 실패했습니다. 다시 시도해주세요.");
            }
        } else {
            redirectAttributes.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
        }
        return "redirect:/mypage/info"; // 정보 페이지로 리다이렉트
    }
    
    @GetMapping(value = "/postBoardList")
    public String postBoardList(HttpSession session, Model model) throws Exception {
        String user_id = (String) session.getAttribute("user_id");
        List<UserDTO> postBoardList = mService.postBoardList();
        model.addAttribute("postBoardList", postBoardList);
        return "/mypage/postBoardList";
    }

    @GetMapping(value = "/questionBoardList")
    public String questionBoardList(HttpSession session, Model model) throws Exception {
        String user_id = (String) session.getAttribute("user_id");
        List<UserDTO> questionBoardList = mService.questionBoardList();
        model.addAttribute("questionBoardList", questionBoardList);
        return "/mypage/questionBoardList";
    }

    @GetMapping(value = "/matchList")
    public String matchList(HttpSession session, Model model) throws Exception {
        String user_id = (String) session.getAttribute("user_id");
        List<UserDTO> matchList = mService.matchList();
        model.addAttribute("matchList", matchList);
        return "/mypage/matchList";
    }
    
    @GetMapping("/mypage")
    public String mypage(HttpSession session, Model model) {
        // 필요시 로직 추가
        return "/mypage/mypage";  // mypage.jsp로 이동
    }

}
