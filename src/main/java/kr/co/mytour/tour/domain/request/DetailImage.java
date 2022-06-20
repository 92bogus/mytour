package kr.co.mytour.tour.domain.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DetailImage extends RequestParam {
	private String contentId = "";
	private String imageYN = "Y";
	private String subImageYN = "Y";
}
