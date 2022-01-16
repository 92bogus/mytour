package kr.co.mytour.tour.domain.requestParam;

public class DetailIntroRP extends RequestParam {
	private String contentId = "";
	private String contentTypeId = "";
	private String introYN = "Y";
	
	public String getContentId() {
		return contentId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	public String getContentTypeId() {
		return contentTypeId;
	}
	public void setContentTypeId(String contentTypeId) {
		this.contentTypeId = contentTypeId;
	}
	public String getIntroYN() {
		return introYN;
	}
	public void setIntroYN(String introYN) {
		this.introYN = introYN;
	}
	
	@Override
	public String toString() {
		return super.toString() + "DetailIntroRP [contentId=" + contentId + ", contentTypeId=" + contentTypeId + ", introYN=" + introYN
				+ "]";
	}
	
}
