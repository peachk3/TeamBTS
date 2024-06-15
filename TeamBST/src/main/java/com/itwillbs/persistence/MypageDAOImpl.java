package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;
import com.itwillbs.domain.UserDTO;

@Repository
public class MypageDAOImpl implements MypageDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageDAOImpl.class);

	// DB 연결정보 -> 주입
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.itwillbs.mapper.MypageMapper.";

	@Override
	public UserDTO getMember(String user_id) {
		return sqlSession.selectOne(NAMESPACE + "getMember", user_id);
	}
	
	@Override
	public UserDTO getMember(UserDTO vo) {
		return null;
	}
	
	@Override
	public void updateMember(UserDTO udto) {
		sqlSession.update(NAMESPACE + "updateMember", udto);
	}

	@Override
	public int deleteMember(UserDTO ddto) {
		return sqlSession.delete(NAMESPACE + "deleteMember", ddto);
	}
	
	

	@Override
	public List<Post_boardDTO> postBoardList(String user_id) {
		return sqlSession.selectList(NAMESPACE + "postBoardList",user_id);
	}
		
	@Override
	public void pbUpdateReadCnt(int post_id) throws Exception {
		logger.debug(" pbUpateReadCnt(int post_id) 실행 ");
		sqlSession.update(NAMESPACE + "pbUpdateReadCnt",post_id);
	}
	
	@Override
	public Post_boardDTO pGetBoard(int post_id) throws Exception {
		logger.debug(" pGetBoard(int post_id) 실행 ");
		return sqlSession.selectOne(NAMESPACE + "pGetBoard", post_id);
	}
	
	
	


	@Override
	public List<Question_boardDTO> questionBoardList(String user_id) {
		return sqlSession.selectList(NAMESPACE + "questionBoardList",user_id);
	}
	
	@Override
	public void qbUpdateReadCnt(int quest_id) throws Exception {
		logger.debug(" qbUpdateReadCnt(int quest_id) 실행 ");
		
		sqlSession.update(NAMESPACE + "qbUpdateReadCnt", quest_id);
	}
	
	@Override
	public Question_boardDTO qGetBoard(int quest_id) throws Exception {
		logger.debug(" qGetBoard(int quest_id) 실행 " );
		return sqlSession.selectOne(NAMESPACE + "qGetBoard", quest_id);
	}
	
	

	@Override
	public List<Game_scheduleDTO> previousMatchList(String user_id) {
		logger.debug(" previousMatchList(String user_id) 실행 ");
		return sqlSession.selectList(NAMESPACE + "previousMatchList",user_id);
	}

	@Override
	public List<Game_scheduleDTO> openMatchList(String user_id) {
		logger.debug(" openMatchList(String user_id) 실행 ");
		return sqlSession.selectList(NAMESPACE + "openMatchList",user_id);
	}


	
	
}
