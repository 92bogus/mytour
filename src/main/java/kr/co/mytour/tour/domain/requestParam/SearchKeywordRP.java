package kr.co.mytour.tour.domain.requestParam;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchKeywordRP extends RequestParam {
	private String listYN = "Y";
	private String arrange = "Q";
	private String contentTypeId = "";
	private String areaCode = "";
	private String sigunguCode = "";
	private String cat1 = "";
	private String cat2 = "";
	private String cat3 = "";
	private String keyword = "";
}
