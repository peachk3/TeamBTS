package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;
import com.itwillbs.domain.UserDTO;

public interface MypageService {

    // 회원정보 조회
	public UserDTO getMember(String user_id);
    
    // 회원정보 수정
    public void updateMember(UserDTO udto);
    
    // 회원정보 삭제
    public int deleteMember(UserDTO ddto);
    
    // 내 게시글 목록
    public List<Post_boardDTO> postBoardList(String user_id) throws Exception;
    
    // 내 질문글 목록
    public List<Question_boardDTO> questionBoardList(String user_id) throws Exception;
    
    // 내 지난 경기목록
 	public List<Game_scheduleDTO> previousMatchList(String user_id) throws Exception;
 	
 	// 내 예정 경기목록
 	public List<Game_scheduleDTO> openMatchList(String user_id) throws Exception;

}
