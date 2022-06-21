package com.shinho.tour.board.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class BoardVO {
	private Integer bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int viewcnt;
	private String[] files;
	private int replycnt;
	private String ipAddr;
	private int recommend;
	private char delyn;
	private Date update_date;
}
