package kr.co.mytour.tour.domain.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DetailIntro extends RequestParam {
	private String contentId = "";
	private String contentTypeId = "";
	private String introYN = "Y";
}
