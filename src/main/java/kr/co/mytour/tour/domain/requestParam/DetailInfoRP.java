package kr.co.mytour.tour.domain.requestParam;

public class DetailInfoRP extends RequestParam {
	private String contentId = "";
	private String contentTypeId = "";
	private String detailYN = "Y";
	
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
	public String getDetailYN() {
		return detailYN;
	}
	public void setDetailYN(String detailYN) {
		this.detailYN = detailYN;
	}

	@Override
	public String toString() {
		return super.toString() + "DetailInfoRP [contentId=" + contentId + ", contentTypeId=" + contentTypeId + ", detailYN=" + detailYN
				+ "]";
	}

}
