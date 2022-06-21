package com.shinho.tour.tour.domain.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LocationBasedListRequest extends RequestParam{
	private String mapX = "";
	private String mapY = "";
	private String radius = "10000";
}
