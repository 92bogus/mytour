package com.shinho.tour.board.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria {
	private int page;
	private int perPageNum;
	private String searchType;
	private String keyword;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		
		this.page = (page - 1) * this.perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
}
