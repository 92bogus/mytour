package kr.co.mytour.tour.domain.requestParam;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
}
