package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.UserDTO;


/**
 * MemberDAO 인터페이스를 구현한 객체 => 기존의 DAO객체의 동작 수행
 */

//@Repository : 스프링이 해당파일을 DAO(bean)로 인식하도록 설정

@Repository
public class MemberDAOImpl implements MemberDAO {

	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE="com.itwillbs.mapper.MemberMapper.";
	
	//회원가입
	@Override
	public void memberJoin(UserDTO mdto) throws Exception{
		System.out.println("DAO : memberJoin(mdto) 호출");
		
		//mapper 생성된 sql 구문 실행
		//sqlSession.insert(sql구문, 전달할 값);
		sqlSession.insert(NAMESPACE +"memberJoin",mdto); 
		
		System.out.println("DAO : 회원가입 완룡!");
		
	}
	//로그인
	@Override
	public UserDTO memberLogin(UserDTO udto) throws Exception{
		System.out.println("DAO : memberLogin(UserDTO mdto) 실행");
		
		UserDTO resultDTO = sqlSession.selectOne(NAMESPACE+"loginCheck", udto);
		
		System.out.println("결과 : " + resultDTO);
		
		return resultDTO;
	}

	@Override
	public UserDTO memberLogin(String user_id, String user_pwd) throws Exception{
		
		System.out.println("DAO : memberLogin(String user_id, Sting user_pwd) 실행");
		
		Map<String, String> sendDTO = new HashMap<String, String>();
		
		//sendDTO.put ("key: 매핑된 이름", value:전달한 데이터);
		sendDTO.put("user_id", user_id);
		sendDTO.put("user_pwd", user_pwd);
		
		//=> 한번에 저장이 불가능한 데이터를 Map 형태로 저장해서 전달가능(Join)
		
		//결과를 수정없이 전달
		return sqlSession.selectOne(NAMESPACE + "loginCheck", sendDTO);
	}
	
	//아이디 중복체크 
	@Override
	public int idCheck(String user_id) throws Exception {
		int result = sqlSession.selectOne(NAMESPACE+"idCheck",user_id);
		
		logger.debug("result : "+ result);
	
		return result;
		
	}
	//닉네임 중복체크
	@Override
	public int nickCheck(String user_nick) throws Exception {
		int result = sqlSession.selectOne(NAMESPACE+"nickCheck", user_nick);
		
		logger.debug("result : " + result);
		
		return result;
	}
	
	//이메일 중복체크
	@Override
	public int emailCheck(String user_email) throws Exception {
		int result = sqlSession.selectOne(NAMESPACE+"emailCheck", user_email);
		
		logger.debug("result : " + result );
		 
		return result ;
	}

	//핸드폰 중복체크
	
	@Override
	public int phoneCheck(String user_phone) throws Exception{
	
		int result = sqlSession.selectOne(NAMESPACE+"phoneCheck",user_phone);
		
		logger.debug("result : " + result);
		
		return result;
	}
	
	
	
	//아이디 찾기
	@Override
	public UserDTO findId(UserDTO udto) throws Exception {

		return sqlSession.selectOne(NAMESPACE+"findId",udto.getUser_name());
	
	}
	
	
	
	
	
	
	

}
