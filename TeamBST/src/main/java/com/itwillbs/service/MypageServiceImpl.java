package com.itwillbs.service;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Category;
import com.itwillbs.domain.Game_scheduleDTO;
import com.itwillbs.domain.MyBoardDTO;
import com.itwillbs.domain.Post_boardDTO;
import com.itwillbs.domain.Question_boardDTO;
import com.itwillbs.domain.Reservation_infoDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.persistence.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageServiceImpl.class);

    @Inject
    private MypageDAO mypageDAO;
    

    @Override
    public UserDTO getMember(String user_id) throws Exception {
        return mypageDAO.getMember(user_id);
    }

    @Override
    public void updateMember(UserDTO udto) throws Exception {
        mypageDAO.updateMember(udto);
    }

    @Override
    public boolean deleteMember(UserDTO ddto) throws Exception {
        int result =  mypageDAO.deleteMember(ddto);
        
        return result > 0;
       
    }
    
    /*
    @Override
    public List<Post_boardDTO> postBoardList(String user_id) throws Exception {
        return mypageDAO.postBoardList(user_id);
    }
    
    @Override
    public List<Question_boardDTO> questionBoardList(String user_id) throws Exception {
    	return mypageDAO.questionBoardList(user_id);
    }
    */
    
    @Override
    public List<MyBoardDTO> MyBoardList(Category cate) throws Exception{
    	return mypageDAO.MyBoardList(cate);
    }
    
    
    @Override
	public void pbUpdateReadCnt(int post_id) throws Exception {
		mypageDAO.pbUpdateReadCnt(post_id);
	}

	@Override
    public Post_boardDTO pGetBoard(int post_id) throws Exception {
    	logger.debug(" pGetBoard(int post_id) 실행 ");
    	return mypageDAO.pGetBoard(post_id);
    }
    
    @Override
    public void qbUpdateReadCnt(int quest_id) throws Exception {
    	mypageDAO.qbUpdateReadCnt(quest_id);
    }
    
    @Override
    public Question_boardDTO qGetBoard(int quest_id) throws Exception {
    	logger.debug( "qGetBoard(int quest_id) 실행" );
    	return mypageDAO.qGetBoard(quest_id);
    }

    /*
	@Override
	public List<Game_scheduleDTO> previousMatchList(String user_id) throws Exception {
		return mypageDAO.previousMatchList(user_id);
	}

	@Override
	public List<Game_scheduleDTO> openMatchList(String user_id) throws Exception {
		return mypageDAO.openMatchList(user_id);
	}
	*/

	@Override
	public List<Game_scheduleDTO> TicketList(Category cate) throws Exception {
		logger.debug( "TicketList(cate) 실행" );
		logger.debug("cate : "+ cate);
		
		return mypageDAO.TicketList(cate);
	}
	
	@Override
	public List<Game_scheduleDTO> getMyTickets(Category cate) throws Exception {
		logger.debug(" getMyTickets(Category cate) 실행 ");
		
		List<Game_scheduleDTO> getticketList = mypageDAO.getTicketList(cate);

		// 좌석 ID 리스트로 변환
//        for (Game_scheduleDTO ticket : getticketList) {
//            // 예시로 seat1_ids에서 좌석 정보를 설정하는 로직
//                String seatIdsString = ticket.getSeatIds(); // 좌석 ID 문자열 가져오기
//                if (seatIdsString != null && !seatIdsString.isEmpty()) {
//                    String[] seatArray = seatIdsString.split(","); // 문자열을 배열로 변환
//                    ticket.setSeats(Arrays.asList(seatArray)); // 리스트로 설정
//                }
//            }
//		
		return getticketList;
	}

	@Override
	public String getPassword(String user_id) throws Exception {

		
		return mypageDAO.getPassword(user_id);
	}

	@Override
	public List<Reservation_infoDTO> SeatList(Category cate) throws Exception {
		
		return mypageDAO.getReserSeatList(cate);
	}
	
	
	
    
    
}
