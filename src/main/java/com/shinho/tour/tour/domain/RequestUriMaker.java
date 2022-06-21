package com.shinho.tour.tour.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import com.shinho.tour.tour.domain.request.AreaBasedListRequest;
import com.shinho.tour.tour.domain.request.DetailCommonRequest;
import com.shinho.tour.tour.domain.request.DetailImageRequest;
import com.shinho.tour.tour.domain.request.DetailInfoRequest;
import com.shinho.tour.tour.domain.request.DetailIntroRequest;
import com.shinho.tour.tour.domain.request.LocationBasedListRequest;
import com.shinho.tour.tour.domain.request.SearchKeywordRequest;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class RequestUriMaker {
	UriComponents uriComponents;
	
	private String service;
	
	private String baseUri = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
	
	public RequestUriMaker(AreaBasedListRequest areaBasedListRequest) {
		service = "areaBasedList";
		
		if(areaBasedListRequest.getContentTypeId().equals("15")) {
			service = "searchFestival";
		}
		
		if(areaBasedListRequest.getContentTypeId().equals("32")) {
			service = "searchStay";
		}
		
		uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("ServiceKey", areaBasedListRequest.getServiceKey())
				.queryParam("numOfRows", areaBasedListRequest.getNumOfRows())
				.queryParam("MobileOS", areaBasedListRequest.getMobileOS())
				.queryParam("MobileApp", areaBasedListRequest.getMobileApp())
				.queryParam("_type", areaBasedListRequest.get_type())

				//.queryParam("areaCode", areaBasedListRP.getAreaCode())
				.queryParam("arrange", areaBasedListRequest.getArrange())
				//.queryParam("cat1", areaBasedListRP.getCat1())
				//.queryParam("cat2", areaBasedListRP.getCat2())
				//.queryParam("cat3", areaBasedListRP.getCat3())
				.queryParam("contentTypeId", areaBasedListRequest.getContentTypeId())
				//.queryParam("listYN", areaBasedListRP.getListYN())
				//.queryParam("sigunguCode", areaBasedListRP.getSigunguCode())
				//.queryParam("eventStartDate", areaBasedListRequest.getEventStartDate())
				//.queryParam("eventEndDate", areaBasedListRP.getEventEndDate())
				//.queryParam("hanOk", areaBasedListRP.getHanOk())
				//.queryParam("benikia", areaBasedListRP.getBenikia())
				//.queryParam("goodStay", areaBasedListRP.getGoodStay())
		
				.queryParam("pageNo", areaBasedListRequest.getPageNo()).build();
		
	}
	
    public RequestUriMaker(LocationBasedListRequest locationRP) {
	  service = "locationBasedList";
	  
	  uriComponents = UriComponentsBuilder.newInstance()
	        .queryParam("ServiceKey", locationRP.getServiceKey())
	        .queryParam("MobileOS", locationRP.getMobileOS())
	        .queryParam("MobileApp", locationRP.getMobileApp())
	        .queryParam("_type", locationRP.get_type())
	        .queryParam("numOfRows", locationRP.getNumOfRows())
	        .queryParam("mapX", locationRP.getMapX())
	        .queryParam("mapY", locationRP.getMapY())
	        .queryParam("radius", locationRP.getRadius()).build();
   }
	
	public RequestUriMaker(DetailCommonRequest commonRP) {
		service = "detailCommon";
		
		uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("ServiceKey", commonRP.getServiceKey())
				.queryParam("MobileOS", commonRP.getMobileOS())
				.queryParam("MobileApp", commonRP.getMobileApp())
				.queryParam("_type", commonRP.get_type())
				
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
	
	public RequestUriMaker(DetailIntroRequest introRP) {
		service = "detailIntro";
		
		uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("ServiceKey", introRP.getServiceKey())
				.queryParam("MobileOS", introRP.getMobileOS())
				.queryParam("MobileApp", introRP.getMobileApp())
				.queryParam("_type", introRP.get_type())
				
				.queryParam("contentId", introRP.getContentId())
				.queryParam("contentTypeId", introRP.getContentTypeId())
				.queryParam("introYN", introRP.getIntroYN()).build();
				
				//.queryParam("pageNo", introRP.getPageNo()).build();
		
	}
	
	public RequestUriMaker(DetailInfoRequest infoRP) {
		service = "detailInfo";
		
		uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("ServiceKey", infoRP.getServiceKey())
				.queryParam("MobileOS", infoRP.getMobileOS())
				.queryParam("MobileApp", infoRP.getMobileApp())
				.queryParam("_type", infoRP.get_type())
				
				.queryParam("contentId", infoRP.getContentId())
				.queryParam("contentTypeId", infoRP.getContentTypeId())
				.queryParam("defaultYN", infoRP.getDetailYN()).build();
				
				//.queryParam("pageNo", infoRP.getPageNo()).build();
		
	}
	
	public RequestUriMaker(DetailImageRequest imageRP) {
		service = "detailImage";
		
		uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("ServiceKey", imageRP.getServiceKey())
				.queryParam("MobileOS", imageRP.getMobileOS())
				.queryParam("MobileApp", imageRP.getMobileApp())
				.queryParam("_type", imageRP.get_type())
				
				.queryParam("contentId", imageRP.getContentId())
				.queryParam("imageYN", imageRP.getImageYN()).build();
				//.queryParam("subImageYN", imageRP.getSubImageYN())
				
				//.queryParam("pageNo", imageRP.getPageNo()).build();
		
	}
	
	public RequestUriMaker(SearchKeywordRequest searchKeyword) {
		service = "searchKeyword";
		
		uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("ServiceKey", searchKeyword.getServiceKey())
				.queryParam("MobileOS", searchKeyword.getMobileOS())
				.queryParam("MobileApp", searchKeyword.getMobileApp())
				.queryParam("_type", searchKeyword.get_type())
				
				//.queryParam("listYN", searchKeywordRP.getListYN())
				//.queryParam("arrange", searchKeywordRP.getArrange())
				//.queryParam("contentTypeId", searchKeywordRP.getContentTypeId())
				//.queryParam("areaCode", searchKeywordRP.getAreaCode())
				//.queryParam("sigunguCode", searchKeywordRP.getSigunguCode())
				//.queryParam("cat1", searchKeywordRP.getCat1())
				//.queryParam("cat2", searchKeywordRP.getCat2())
				//.queryParam("cat3", searchKeywordRP.getCat3())
				.queryParam("keyword", encoding(searchKeyword.getKeyword()))
				
				.queryParam("pageNo", searchKeyword.getPageNo()).build();
		
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
	
}
