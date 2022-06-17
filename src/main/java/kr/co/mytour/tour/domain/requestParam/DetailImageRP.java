package kr.co.mytour.tour.domain.requestParam;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DetailImageRP extends RequestParam {
	private String contentId = "";
	private String imageYN = "Y";
	private String subImageYN = "Y";
}
