package com.shinho.tour.tour.domain.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DetailImageRequest extends RequestParam {
	private String contentId = "";
	private String imageYN = "Y";
	private String subImageYN = "Y";
}
