package kr.co.mytour.tour.domain.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AreaBasedListRequest extends RequestParam {
	private String listYN;
	private String arrange;
	private String contentTypeId;
	private String areaCode;
	private String sigunguCode;
	private String cat1;
	private String cat2;
	private String cat3;
	private String modifiedtime;
}
