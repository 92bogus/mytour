package kr.co.mytour.tour.domain.requestParam;

public class AreaBasedListRP extends RequestParam {
	private String listYN = "Y";
	private String arrange = "Q";
	private String contentTypeId = "";
	private String areaCode = "";
	private String sigunguCode = "";
	private String eventStartDate = "";
	private String eventEndDate = "";
	private String cat1 = "";
	private String cat2 = "";
	private String cat3 = "";
	private String hanOk = "";
	private String benikia = "";
	private String goodStay = "";
	
	public String getListYN() {
		return listYN;
	}
	public void setListYN(String listYN) {
		this.listYN = listYN;
	}
	public String getArrange() {
		return arrange;
	}
	public void setArrange(String arrange) {
		this.arrange = arrange;
	}
	public String getContentTypeId() {
		return contentTypeId;
	}
	public void setContentTypeId(String contentTypeId) {
		this.contentTypeId = contentTypeId;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getSigunguCode() {
		return sigunguCode;
	}
	public void setSigunguCode(String sigunguCode) {
		this.sigunguCode = sigunguCode;
	}
	public String getEventStartDate() {
		return eventStartDate;
	}
	public void setEventStartDate(String eventStartDate) {
		this.eventStartDate = eventStartDate;
	}
	public String getEventEndDate() {
		return eventEndDate;
	}
	public void setEventEndDate(String eventEndDate) {
		this.eventEndDate = eventEndDate;
	}
	public String getCat1() {
		return cat1;
	}
	public void setCat1(String cat1) {
		this.cat1 = cat1;
	}
	public String getCat2() {
		return cat2;
	}
	public void setCat2(String cat2) {
		this.cat2 = cat2;
	}
	public String getCat3() {
		return cat3;
	}
	public void setCat3(String cat3) {
		this.cat3 = cat3;
	}
	public String getHanOk() {
		return hanOk;
	}
	public void setHanOk(String hanOk) {
		this.hanOk = hanOk;
	}
	public String getBenikia() {
		return benikia;
	}
	public void setBenikia(String benikia) {
		this.benikia = benikia;
	}
	public String getGoodStay() {
		return goodStay;
	}
	public void setGoodStay(String goodStay) {
		this.goodStay = goodStay;
	}
	
	@Override
	public String toString() {
		return "AreaBasedListRP [listYN=" + listYN + ", arrange=" + arrange + ", contentTypeId=" + contentTypeId
				+ ", areaCode=" + areaCode + ", sigunguCode=" + sigunguCode + ", eventStartDate=" + eventStartDate
				+ ", eventEndDate=" + eventEndDate + ", cat1=" + cat1 + ", cat2=" + cat2 + ", cat3=" + cat3 + ", hanOk="
				+ hanOk + ", benikia=" + benikia + ", goodStay=" + goodStay + "]";
	}
	
}
