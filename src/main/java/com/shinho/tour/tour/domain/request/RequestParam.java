package com.shinho.tour.tour.domain.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RequestParam {
	private String numOfRows = "10";	// 한 페이지 결과 수
	private int pageNo = 1;				// 페이지 번호
	private String MobileOS = "ETC";			// OS 구분
	private String MobileApp = "AppTest";			// 서비스명
	//private String ServiceKey = "lFVLzP9ISWyS58moYZ3pl9xPRb47EmwaVkDvgLlTtXi6UhpDpVaYPFE5U9dBLVw6gyM1gCgWDtDdZr3rkGDcGw%3D%3D"; // TODO: 인증키 따로 관리할 것
	private String ServiceKey = "lFVLzP9ISWyS58moYZ3pl9xPRb47EmwaVkDvgLlTtXi6UhpDpVaYPFE5U9dBLVw6gyM1gCgWDtDdZr3rkGDcGw=="; // TODO: 인증키 따로 관리할 것
	private String _type = "json";

	public void setPageNo(int pageNo) {
		if(pageNo <= 0) {
			this.pageNo = 1;
			return;
		}
		
		this.pageNo = pageNo;
	}
}
