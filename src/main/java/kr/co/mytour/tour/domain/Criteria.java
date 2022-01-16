package kr.co.mytour.tour.domain;

public class Criteria {
	private String eventStartDate = "";
	private String contentTypeId = "";
	private String keyword = "";
	private String service = "areaBasedList";
	private String pageNo = "1";
	
	public String getEventStartDate() {
		return eventStartDate;
	}
	public void setEventStartDate(String eventStartDate) {
		this.eventStartDate = eventStartDate;
	}
	public String getContentTypeId() {
		return contentTypeId;
	}
	public void setContentTypeId(String contentTypeId) {
		this.contentTypeId = contentTypeId;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	
	@Override
	public String toString() {
		return "Criteria [eventStartDate=" + eventStartDate + ", contentTypeId=" + contentTypeId + ", keyword="
				+ keyword + ", service=" + service + ", pageNo=" + pageNo + "]";
	}
	
}
