package kr.co.mytour.tour.domain.requestParam;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DetailIntroRP extends RequestParam {
	private String contentId = "";
	private String contentTypeId = "";
	private String introYN = "Y";
}
