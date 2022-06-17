package kr.co.mytour.tour.domain.requestParam;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DetailInfoRP extends RequestParam {
	private String contentId = "";
	private String contentTypeId = "";
	private String detailYN = "Y";
}
