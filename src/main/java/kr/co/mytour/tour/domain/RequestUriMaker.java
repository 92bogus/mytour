package kr.co.mytour.tour.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import kr.co.mytour.tour.domain.requestParam.AreaBasedListRP;
import kr.co.mytour.tour.domain.requestParam.DetailCommonRP;
import kr.co.mytour.tour.domain.requestParam.DetailImageRP;
import kr.co.mytour.tour.domain.requestParam.DetailInfoRP;
import kr.co.mytour.tour.domain.requestParam.DetailIntroRP;
import kr.co.mytour.tour.domain.requestParam.LocationBasedListRP;
import kr.co.mytour.tour.domain.requestParam.SearchKeywordRP;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class RequestUriMaker {
	UriComponents uriComponents;
	
	private String service;
	
	private String baseUri = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
	
	public RequestUriMaker(AreaBasedListRP areaBasedListRP) {
		service = "areaBasedList";
		
		if(areaBasedListRP.getContentTypeId().equals("15")) {
			service = "searchFestival";
		}
		
		if(areaBasedListRP.getContentTypeId().equals("32")) {
			service = "searchStay";
		}
		
		uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("ServiceKey", areaBasedListRP.getServiceKey())
				.queryParam("numOfRows", areaBasedListRP.getNumOfRows())
				.queryParam("MobileOS", areaBasedListRP.getMobileOS())
				.queryParam("MobileApp", areaBasedListRP.getMobileApp())
				.queryParam("_type", areaBasedListRP.getType())
		
				//.queryParam("areaCode", areaBasedListRP.getAreaCode())
				.queryParam("arrange", areaBasedListRP.getArrange())
				//.queryParam("cat1", areaBasedListRP.getCat1())
				//.queryParam("cat2", areaBasedListRP.getCat2())
				//.queryParam("cat3", areaBasedListRP.getCat3())
				.queryParam("contentTypeId", areaBasedListRP.getContentTypeId())
				//.queryParam("listYN", areaBasedListRP.getListYN())
				//.queryParam("sigunguCode", areaBasedListRP.getSigunguCode())
				.queryParam("eventStartDate", areaBasedListRP.getEventStartDate())
				//.queryParam("eventEndDate", areaBasedListRP.getEventEndDate())
				//.queryParam("hanOk", areaBasedListRP.getHanOk())
				//.queryParam("benikia", areaBasedListRP.getBenikia())
				//.queryParam("goodStay", areaBasedListRP.getGoodStay())
		
				.queryParam("pageNo", areaBasedListRP.getPageNo()).build();
		
	}
	
   public RequestUriMaker(LocationBasedListRP locationRP) {
	  service = "locationBasedList";
	  
	  uriComponents = UriComponentsBuilder.newInstance()
	        .queryParam("ServiceKey", locationRP.getServiceKey())
	        .queryParam("MobileOS", locationRP.getMobileOS())
	        .queryParam("MobileApp", locationRP.getMobileApp())
	        .queryParam("_type", locationRP.getType())
	        .queryParam("numOfRows", locationRP.getNumOfRows())
	        .queryParam("mapX", locationRP.getMapX())
	        .queryParam("mapY", locationRP.getMapY())
	        .queryParam("radius", locationRP.getRadius()).build();
   }
	
	public RequestUriMaker(DetailCommonRP commonRP) {
		service = "detailCommon";
		
		uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("ServiceKey", commonRP.getServiceKey())
				.queryParam("MobileOS", commonRP.getMobileOS())
				.queryParam("MobileApp", commonRP.getMobileApp())
				.queryParam("_type", commonRP.getType())
				
				.queryParam("contentId", commonRP.getContentId())
				.queryParam("contentTypeId", commonRP.getContentTypeId())
				.queryParam("defaultYN", commonRP.getDefaultYN())
				.queryParam("firstImageYN", commonRP.getFirstImageYN())
				//.queryParam("areacodeYN", commonRP.getAreacodeYN())
				//.queryParam("catcodeYN", commonRP.getCatcodeYN())
				.queryParam("addrinfoYN", commonRP.getAddrinfoYN())
				.queryParam("mapinfoYN", commonRP.getMapinfoYN())
				.queryParam("overviewYN", commonRP.getOverviewYN()).build();
				
				//.queryParam("pageNo", commonRP.getPageNo()).build();
		
	}
	
	public RequestUriMaker(DetailIntroRP introRP) {
		service = "detailIntro";
		
		uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("ServiceKey", introRP.getServiceKey())
				.queryParam("MobileOS", introRP.getMobileOS())
				.queryParam("MobileApp", introRP.getMobileApp())
				.queryParam("_type", introRP.getType())
				
				.queryParam("contentId", introRP.getContentId())
				.queryParam("contentTypeId", introRP.getContentTypeId())
				.queryParam("introYN", introRP.getIntroYN()).build();
				
				//.queryParam("pageNo", introRP.getPageNo()).build();
		
	}
	
	public RequestUriMaker(DetailInfoRP infoRP) {
		service = "detailInfo";
		
		uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("ServiceKey", infoRP.getServiceKey())
				.queryParam("MobileOS", infoRP.getMobileOS())
				.queryParam("MobileApp", infoRP.getMobileApp())
				.queryParam("_type", infoRP.getType())
				
				.queryParam("contentId", infoRP.getContentId())
				.queryParam("contentTypeId", infoRP.getContentTypeId())
				.queryParam("defaultYN", infoRP.getDetailYN()).build();
				
				//.queryParam("pageNo", infoRP.getPageNo()).build();
		
	}
	
	public RequestUriMaker(DetailImageRP imageRP) {
		service = "detailImage";
		
		uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("ServiceKey", imageRP.getServiceKey())
				.queryParam("MobileOS", imageRP.getMobileOS())
				.queryParam("MobileApp", imageRP.getMobileApp())
				.queryParam("_type", imageRP.getType())
				
				.queryParam("contentId", imageRP.getContentId())
				.queryParam("imageYN", imageRP.getImageYN()).build();
				//.queryParam("subImageYN", imageRP.getSubImageYN())
				
				//.queryParam("pageNo", imageRP.getPageNo()).build();
		
	}
	
	public RequestUriMaker(SearchKeywordRP searchKeywordRP) {
		service = "searchKeyword";
		
		uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("ServiceKey", searchKeywordRP.getServiceKey())
				.queryParam("MobileOS", searchKeywordRP.getMobileOS())
				.queryParam("MobileApp", searchKeywordRP.getMobileApp())
				.queryParam("_type", searchKeywordRP.getType())
				
				//.queryParam("listYN", searchKeywordRP.getListYN())
				//.queryParam("arrange", searchKeywordRP.getArrange())
				//.queryParam("contentTypeId", searchKeywordRP.getContentTypeId())
				//.queryParam("areaCode", searchKeywordRP.getAreaCode())
				//.queryParam("sigunguCode", searchKeywordRP.getSigunguCode())
				//.queryParam("cat1", searchKeywordRP.getCat1())
				//.queryParam("cat2", searchKeywordRP.getCat2())
				//.queryParam("cat3", searchKeywordRP.getCat3())
				.queryParam("keyword", encoding(searchKeywordRP.getKeyword()))
				
				.queryParam("pageNo", searchKeywordRP.getPageNo()).build();
		
	}
	
	private String encoding(String keyword) {
		if(keyword == null || keyword.trim().length() == 0) {
			return "";
		}
		
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch(UnsupportedEncodingException e) {
			return "";
		}
	}
	
	@Override
	public String toString() {
		return baseUri + service + uriComponents.toUriString();
	}
	
}
