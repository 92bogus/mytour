package kr.co.mytour.tour.domain.requestParam;

public class DetailCommonRP extends RequestParam {
	private String contentId = "";
	private String contentTypeId = "";
	private String defaultYN = "Y";
	private String firstImageYN = "Y";
	private String areacodeYN = "Y";
	private String catcodeYN = "Y";
	private String addrinfoYN = "Y";
	private String mapinfoYN = "Y";
	private String overviewYN = "Y";
	
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
	public String getDefaultYN() {
		return defaultYN;
	}
	public void setDefaultYN(String defaultYN) {
		this.defaultYN = defaultYN;
	}
	public String getFirstImageYN() {
		return firstImageYN;
	}
	public void setFirstImageYN(String firstImageYN) {
		this.firstImageYN = firstImageYN;
	}
	public String getAreacodeYN() {
		return areacodeYN;
	}
	public void setAreacodeYN(String areacodeYN) {
		this.areacodeYN = areacodeYN;
	}
	public String getCatcodeYN() {
		return catcodeYN;
	}
	public void setCatcodeYN(String catcodeYN) {
		this.catcodeYN = catcodeYN;
	}
	public String getAddrinfoYN() {
		return addrinfoYN;
	}
	public void setAddrinfoYN(String addrinfoYN) {
		this.addrinfoYN = addrinfoYN;
	}
	public String getMapinfoYN() {
		return mapinfoYN;
	}
	public void setMapinfoYN(String mapinfoYN) {
		this.mapinfoYN = mapinfoYN;
	}
	public String getOverviewYN() {
		return overviewYN;
	}
	public void setOverviewYN(String overviewYN) {
		this.overviewYN = overviewYN;
	}

	@Override
	public String toString() {
		return super.toString() + "DetailCommonRP [contentId=" + contentId + ", contentTypeId=" + contentTypeId + ", defaultYN="
				+ defaultYN + ", firstImageYN=" + firstImageYN + ", areacodeYN=" + areacodeYN + ", catcodeYN="
				+ catcodeYN + ", addrinfoYN=" + addrinfoYN + ", mapinfoYN=" + mapinfoYN + ", overviewYN=" + overviewYN
				+ "]";
	}
	
}
