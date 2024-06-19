package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.Post_boardDTO;

@Service
public interface CommunityService {
	
	// 거래 게시글 작성
	public void PostJoin(Post_boardDTO dto);
	
	// 거래 게시글 목록 조회
	public List<Post_boardDTO> PostList() throws Exception;

	// 거래 게시글 본문 조회
	public List<Post_boardDTO> PostOneList(int post_id) throws Exception;

	// 거래 게시글 수정
	public void modifyContent(Post_boardDTO pbdto) throws Exception;

	// 거래 게시글 삭제
	public void deleteContent(int post_id) throws Exception;


	
	
	
	
	
}
