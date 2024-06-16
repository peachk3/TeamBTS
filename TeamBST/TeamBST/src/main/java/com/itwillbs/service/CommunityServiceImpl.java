package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Post_boardDTO;
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
	public List<Post_boardDTO> PostList() throws Exception {
		logger.debug("공지사항 글목록 조회");
		
		return cdao.PostList();
	}

}
