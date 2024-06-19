package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Post_boardDTO;

public interface CommunityDAO {
	
	// 거래 게시글 작성
	public void insertPost(Post_boardDTO dto);
	
	// 거래 게시글 목록 조회
	public List<Post_boardDTO> PostList() throws Exception;

	// 게시글 본문 내용 확인	
	public List<Post_boardDTO> PostOneList(int post_id) throws Exception;
	
	// 게시글 본문 내용 수정
	public void modifyContent(Post_boardDTO pbdto) throws Exception;
	
	// 게시글 삭제
	public void deleteContent(int post_id) throws Exception;


	
	
	
}
