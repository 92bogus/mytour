package com.shinho.tour.tour.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria {
	private String eventStartDate = "";
	private String contentTypeId = "";
	private String keyword = "";
	private String service = "areaBasedList";
	private String pageNo = "1";
}
