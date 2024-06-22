package com.itwillbs.domain;

public class MyBoardDTO{
	
	private String board_id;
	private String board_sub;
	private String board_cre_date;
	private String board_view;
	
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	
	public String getBoard_sub() {
		return board_sub;
	}
	public void setBoard_sub(String board_sub) {
		this.board_sub = board_sub;
	}
	
	public String getBoard_cre_date() {
		return board_cre_date;
	}
	public void setBoard_cre_date(String board_cre_date) {
		this.board_cre_date = board_cre_date;
	}
	
	public String getBoard_view() {
		return board_view;
	}
	public void setBoard_veiw(String board_view) {
		this.board_view = board_view;
	}
	
	@Override
	public String toString() {
		return "MyBoardDTO [board_id=" + board_id + ", board_sub=" + board_sub + ", board_cre_date=" + board_cre_date
				+ ", board_view=" + board_view + "]";
	}
	
	
}