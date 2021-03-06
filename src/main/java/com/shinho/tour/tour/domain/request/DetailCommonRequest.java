package com.shinho.tour.tour.domain.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DetailCommonRequest extends RequestParam {
	private String contentId = "";
	private String contentTypeId = "";
	private String defaultYN = "Y";
	private String firstImageYN = "Y";
	private String areacodeYN = "Y";
	private String catcodeYN = "Y";
	private String addrinfoYN = "Y";
	private String mapinfoYN = "Y";
	private String overviewYN = "Y";
}
