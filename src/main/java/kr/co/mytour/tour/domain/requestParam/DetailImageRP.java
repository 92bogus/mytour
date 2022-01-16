package kr.co.mytour.tour.domain.requestParam;

public class DetailImageRP extends RequestParam {
	private String contentId = "";
	private String imageYN = "Y";
	private String subImageYN = "Y";
	
	public String getContentId() {
		return contentId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	public String getImageYN() {
		return imageYN;
	}
	public void setImageYN(String imageYN) {
		this.imageYN = imageYN;
	}
	public String getSubImageYN() {
		return subImageYN;
	}
	public void setSubImageYN(String subImageYN) {
		this.subImageYN = subImageYN;
	}
	
	@Override
	public String toString() {
		return "DetailImage [contentId=" + contentId + ", imageYN=" + imageYN + ", subImageYN=" + subImageYN + "]";
	}
	
}
