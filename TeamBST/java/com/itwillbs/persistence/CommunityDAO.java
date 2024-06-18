package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Post_boardDTO;

public interface CommunityDAO {
	
	// 거래 게시글 작성
	public void insertPost(Post_boardDTO dto);
	
	// 거래 게시글 목록 조회
	public List<Post_boardDTO> PostList() throws Exception;

	public List<Post_boardDTO> PostOneList(String post_id) throws Exception;

	
	
	
}
