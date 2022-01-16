package kr.co.mytour.tour.domain.requestParam;

public class RequestParam {
	private String numOfRows = "10";
	private int pageNo = 1;
	private String mobileOS = "ETC";
	private String mobileApp = "AppTest";
	private String serviceKey = "e1GpUAmmHNh4QuPc%2BI20PFrJG7%2FJpVS7jjobHgYW6HuoO7OP%2BEcqJLwy0zw6GBGkrEI40XmmuJtwBi8iAPMuQw%3D%3D";
	private String type = "json";
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getNumOfRows() {
		return numOfRows;
	}
	public void setNumOfRows(String numOfRows) {
		this.numOfRows = numOfRows;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		if(pageNo <= 0) {
			this.pageNo = 1;
			return;
		}
		
		this.pageNo = pageNo;
	}
	public String getMobileOS() {
		return mobileOS;
	}
	public void setMobileOS(String mobileOS) {
		this.mobileOS = mobileOS;
	}
	public String getMobileApp() {
		return mobileApp;
	}
	public void setMobileApp(String mobileApp) {
		this.mobileApp = mobileApp;
	}
	public String getServiceKey() {
		return serviceKey;
	}
	public void setServiceKey(String serviceKey) {
		this.serviceKey = serviceKey;
	}
	
	@Override
	public String toString() {
		return "RequestParam [numOfRows=" + numOfRows + ", pageNo=" + pageNo + ", mobileOS=" + mobileOS + ", mobileApp="
				+ mobileApp + ", serviceKey=" + serviceKey + "]";
	}
	
	
}
