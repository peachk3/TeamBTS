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

}
