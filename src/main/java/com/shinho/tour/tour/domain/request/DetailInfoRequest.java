package com.shinho.tour.tour.domain.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DetailInfoRequest extends RequestParam {
	private String contentId = "";
	private String contentTypeId = "";
	private String detailYN = "Y";
}
