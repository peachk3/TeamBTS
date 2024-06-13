package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.UserDTO;

public interface MypageService {

    // 회원정보 조회
	public UserDTO getMember(String user_id);
    
    // 회원정보 수정
    public void updateMember(UserDTO udto);
    
    // 회원정보 삭제
    public int deleteMember(UserDTO ddto);
    
    // 내 게시글 목록
    public List<UserDTO> postBoardList() throws Exception;
    
    // 내 질문글 목록
    public List<UserDTO> questionBoardList() throws Exception;
    
    // 내 경기목록
    public List<UserDTO> matchList() throws Exception;

}
