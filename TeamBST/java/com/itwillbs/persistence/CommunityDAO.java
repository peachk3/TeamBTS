package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Category;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Post_commendDTO;

public interface CommunityDAO {
	
	// 거래 게시글 작성
	public void insertPost(Post_boardDTO dto);
	
	// 거래 게시글 목록 전체 조회
	public List<Post_boardDTO> PostListAll() throws Exception;
	
	// 거래 게시글 목록 조회 - 원래 코드
//	public List<Post_boardDTO> PostList(Category cate) throws Exception;

	
	// gpt 코드
	public List<Post_boardDTO> PostList(Category cate, Criteria cri) throws Exception;
	
	public int getTotalCount(Category cate) throws Exception;
	
	
	
	
	
	
	
	// 게시글 본문 내용 확인	
	public List<Post_boardDTO> PostOneList(int post_id) throws Exception;
	
	// 게시글 본문 내용 수정
	public void modifyContent(Post_boardDTO pbdto) throws Exception;
	
	// 게시글 삭제
	public void deleteContent(int post_id) throws Exception;

	// 게시글 조회수 증가
	public void updateCount(int post_id) throws Exception;

	// 거래 게시글 댓글 달기
	public void communityCommend(Post_commendDTO pcdto) throws Exception;

	// 거래 게시판 댓긇 확인
	public List<Post_commendDTO> getComments(int post_id) throws Exception;


	
	
	
}
