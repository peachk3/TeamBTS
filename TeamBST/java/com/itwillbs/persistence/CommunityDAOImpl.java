package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Category;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Post_commendDTO;

@Repository
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
	public List<Post_boardDTO> PostListAll() throws Exception {
		logger.debug("DAO : PostListAll() 호출");
		
		return sqlSession.selectList(NAMESPACE + "PostListAll");
	}

	// 원래 코드
//	@Override
//	public List<Post_boardDTO> PostList(Category cate) throws Exception {
//		logger.debug("DAO : PostList() 호출");
//		
//		return sqlSession.selectList(NAMESPACE + "PostList", cate);
//	}

	// gpt 코드
	public List<Post_boardDTO> PostList(Category cate, Criteria cri) throws Exception {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("cate", cate);
	    paramMap.put("cri", cri);
	    return sqlSession.selectList(NAMESPACE + "PostList", paramMap);
	}

	public int getTotalCount(Category cate) throws Exception {
	    return sqlSession.selectOne(NAMESPACE + "getTotalCount", cate);
	}

	
	
	
	
	
	
	
	
	
	@Override
	public List<Post_boardDTO> PostOneList(int post_id) throws Exception {
		logger.debug("DAO : PostOneList(int PostOneList) 호출");

		return sqlSession.selectList(NAMESPACE + "PostOneList",post_id);
	}

	@Override
	public void modifyContent(Post_boardDTO pbdto) throws Exception {
		logger.debug("DAO : modifyContent(Post_boardDTO pbdto");
		
		sqlSession.update(NAMESPACE+"modifyContent",pbdto);
	}

	@Override
	public void deleteContent(int post_id) throws Exception {
		logger.debug("DAO : deleteContent(int post_id)");
			
		sqlSession.update(NAMESPACE+"deleteContent",post_id);
	}

	@Override
	public void updateCount(int post_id) throws Exception {
		logger.debug("DAO : updateCount(int post_id)");
		
		sqlSession.update(NAMESPACE+"updateCount",post_id);
		
		
	}

	@Override
	public void communityCommend(Post_commendDTO pcdto) throws Exception{
		logger.debug(" DAO : communityCommend(Post_commendDTO pcdto) ");

		sqlSession.insert(NAMESPACE+"communityCommend",pcdto);
		
		
	}
	
	
	
	
	
	
}
