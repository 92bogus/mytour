package kr.co.mytour.tour.domain.requestParam;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RequestParam {
	private String numOfRows = "10";
	private int pageNo = 1;
	private String mobileOS = "ETC";
	private String mobileApp = "AppTest";
	private String serviceKey = "e1GpUAmmHNh4QuPc%2BI20PFrJG7%2FJpVS7jjobHgYW6HuoO7OP%2BEcqJLwy0zw6GBGkrEI40XmmuJtwBi8iAPMuQw%3D%3D";
	private String type = "json";

	public void setPageNo(int pageNo) {
		if(pageNo <= 0) {
			this.pageNo = 1;
			return;
		}
		
		this.pageNo = pageNo;
	}
}
