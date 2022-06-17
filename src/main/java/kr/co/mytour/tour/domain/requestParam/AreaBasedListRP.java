package kr.co.mytour.tour.domain.requestParam;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AreaBasedListRP extends RequestParam {
	private String listYN = "Y";
	private String arrange = "Q";
	private String contentTypeId = "";
	private String areaCode = "";
	private String sigunguCode = "";
	private String eventStartDate = "";
	private String eventEndDate = "";
	private String cat1 = "";
	private String cat2 = "";
	private String cat3 = "";
	private String hanOk = "";
	private String benikia = "";
	private String goodStay = "";
}
