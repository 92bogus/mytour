package kr.co.mytour.tour.domain.requestParam;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LocationBasedListRP extends RequestParam{
	private String mapX = "";
	private String mapY = "";
	private String radius = "10000";
}
