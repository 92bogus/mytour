package kr.co.mytour.tour.domain.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DetailInfo extends RequestParam {
	private String contentId = "";
	private String contentTypeId = "";
	private String detailYN = "Y";
}
