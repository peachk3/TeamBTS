package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.UserDTO;

@Repository
public class MypageDAOImpl implements MypageDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageDAOImpl.class);

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.itwillbs.mapper.MypageMapper.";

	@Override
	public UserDTO getMember(String user_id) {
		return sqlSession.selectOne(NAMESPACE + "getMember", user_id);
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
	public List<UserDTO> postBoardList() {
		return sqlSession.selectList(NAMESPACE + "postBoardList");
	}
		
	@Override
	public List<UserDTO> questionBoardList() {
		return sqlSession.selectList(NAMESPACE + "questionBoardList");
	}

	@Override
	public List<UserDTO> matchList() {
		return sqlSession.selectList(NAMESPACE + "matchList");
	}

	@Override
	public UserDTO getMember(UserDTO vo) {
		// If this method is not required, it should be removed or implemented properly.
		return null;
	}
}
