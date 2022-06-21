package com.shinho.tour.tour.domain.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DetailIntroRequest extends RequestParam {
	private String contentId = "";
	private String contentTypeId = "";
	private String introYN = "Y";
}
