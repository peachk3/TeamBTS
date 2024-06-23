package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Category;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Post_commendDTO;
import com.itwillbs.persistence.CommunityDAO;

@Service
public class CommunityServiceImpl implements CommunityService{
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityServiceImpl.class);
	
	@Inject
	private CommunityDAO cdao;

	@Override
	public void PostJoin(Post_boardDTO dto) {
		logger.debug("NoticeJoin(dto) 실행");
		
		// DAO 메서드 호출
		cdao.insertPost(dto);
		
		logger.debug("공지사항 작성 성공");
	}
	
	@Override
	public List<Post_boardDTO> PostListAll() throws Exception {
		logger.debug("공지사항 글목록 조회");
		
		return cdao.PostListAll();
	}

	@Override
	public List<Post_boardDTO> PostList(Category cate) throws Exception {
		logger.debug("공지사항 글목록 조회");
		logger.debug("cate"+ cate);
		
		return cdao.PostList(cate);
	}

	@Override
	public List<Post_boardDTO> PostOneList(int post_id) throws Exception {
		logger.debug("글 내용 조회");
		
		return cdao.PostOneList(post_id);
	}

	@Override
	public void modifyContent(Post_boardDTO pbdto) throws Exception {
		logger.debug("글 내용 수정");

		cdao.modifyContent(pbdto);
	}

	@Override
	public void deleteContent(int post_id) throws Exception {
		logger.debug("게시글 삭제");
		
		cdao.deleteContent(post_id);
	}

	@Override
	public void updateCount(int post_id) throws Exception {
		logger.debug(" 조회수 증가 ");
		
		
		cdao.updateCount(post_id);
	}

	@Override
	public void communityCommend(Post_commendDTO pcdto) throws Exception{
		logger.debug(" 거래게시글 댓글 달기 ");

		
		cdao.communityCommend(pcdto);
	}

	
	
	
}
