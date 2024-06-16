package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.persistence.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageServiceImpl.class);

    @Inject
    private MypageDAO mypageDAO;
    

    @Override
    public UserDTO getMember(String user_id) {
        return mypageDAO.getMember(user_id);
    }

    @Override
    public void updateMember(UserDTO udto) {
        mypageDAO.updateMember(udto);
    }

    @Override
    public boolean deleteMember(UserDTO ddto) {
        int result =  mypageDAO.deleteMember(ddto);
        
        return result > 0;
       
    }

    @Override
    public List<UserDTO> postBoardList() {
        return mypageDAO.postBoardList();
    }

    @Override
    public List<UserDTO> questionBoardList() {
        return mypageDAO.questionBoardList();
    }

	@Override
	public List<Game_scheduleDTO> previousMatchList(String user_id) throws Exception {
		return mypageDAO.previousMatchList(user_id);
	}

	@Override
	public List<Game_scheduleDTO> openMatchList(String user_id) throws Exception {
		return mypageDAO.openMatchList(user_id);
	}
    
    
}
