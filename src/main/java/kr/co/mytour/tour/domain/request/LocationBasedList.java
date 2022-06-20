package kr.co.mytour.tour.domain.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LocationBasedList extends RequestParam{
	private String mapX = "";
	private String mapY = "";
	private String radius = "10000";
}
