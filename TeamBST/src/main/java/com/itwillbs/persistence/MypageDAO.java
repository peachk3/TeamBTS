package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.UserDTO;

public interface MypageDAO {
	
	
	
	// 회원정보 조회
	public UserDTO getMember(UserDTO vo);
	public UserDTO getMember(String user_id);
	
	
	// 회원정보 수정
	public void updateMember(UserDTO udto);
	
	// 회원정보 삭제
	public int deleteMember(UserDTO ddto);
	
	// 내 게시글 목록
	public List<UserDTO> postBoardList();
	
	// 내 질문글 목록
	public List<UserDTO> questionBoardList();
	
	// 내 지난 경기목록
	public List<UserDTO> previousMatchList();
	
	// 내 예정 경기목록
	public List<UserDTO> openMatchList();
}
