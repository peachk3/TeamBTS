package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.itwillbs.domain.Post_boardDTO;

public class CommunityDAOImpl implements CommunityDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityDAOImpl.class);
	
	private static final String NAMESPACE = "com.itwillbs.mapper.CommunityMapper.";
	
	@Inject
	public SqlSession sqlSession;

	@Override
	public void insertPost(Post_boardDTO dto) {
		logger.debug("DAO : insertPost(dto) 호출");
		
		logger.debug("dto : "+ dto);
		sqlSession.insert(NAMESPACE + "PostJoin", dto);
		
		logger.debug("DAO : 공지사항 작성 완료");
		
	}

	@Override
	public List<Post_boardDTO> PostList() throws Exception {
		logger.debug("DAO : PostList() 호출");
		
		return sqlSession.selectList(NAMESPACE + "PostList");
	}
	

}
