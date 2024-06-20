package com.itwillbs.domain;

/*
  게시판 카테고리 설정을 위해 생성된 객체
  - 판매상태, 구장
 */

public class Category {
	
	private String sale_status;
	private String stad_id;
	
	public Category(){
		this.sale_status = "ALL";
		this.stad_id = "ALL";
	}
	
	public String getSale_status() {
		return sale_status;
	}

	
	public void setSale_status(String sale_status) {
		this.sale_status = sale_status;
	}



	public String getStad_id() {
		return stad_id;
	}



	public void setStad_id(String stad_id) {
		this.stad_id = stad_id;
	}
	

	@Override
	public String toString() {
		return "Category [sale_status=" + sale_status + ", stad_id=" + stad_id + "]";
	}

	
}
