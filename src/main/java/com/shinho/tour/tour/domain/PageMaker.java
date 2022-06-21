package com.shinho.tour.tour.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import com.shinho.tour.tour.domain.request.AreaBasedListRequest;
import com.shinho.tour.tour.domain.request.RequestParam;
import com.shinho.tour.tour.domain.request.SearchKeywordRequest;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.util.UriComponentsBuilder;

@Getter
@Setter
public class PageMaker {
	private int totalCount;
	private int startPage;	
	private int endPage;
	private boolean prev;	
	private boolean next;
	private int lastPage;
	private int perPageNum = 10;
	private int displayPageNum = 10;
	private RequestParam rp;

	public void setTotalCount(String totalCount) {
		this.totalCount = Integer.parseInt(totalCount);
		calcData();
	}
	
	private void calcData() {
		endPage = (int) (Math.ceil(rp.getPageNo() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		
		lastPage = (int) (Math.ceil(totalCount / (double) perPageNum));
		
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage * perPageNum >= totalCount ? false : true;
	}
	
	public String makeQuery(int pageNo) {
		UriComponentsBuilder uriComponents = UriComponentsBuilder.newInstance();
		
		if(this.rp instanceof AreaBasedListRequest) {
			//uriComponents.queryParam("areaCode", ((AreaBasedListRP) rp).getAreaCode());
			//uriComponents.queryParam("arrange", ((AreaBasedListRP) rp).getArrange());
			//uriComponents.queryParam("cat1", ((AreaBasedListRP) rp).getCat1());
			//uriComponents.queryParam("cat2", ((AreaBasedListRP) rp).getCat2());
			//uriComponents.queryParam("cat3", ((AreaBasedListRP) rp).getCat3());
			uriComponents.queryParam("contentTypeId", ((AreaBasedListRequest) rp).getContentTypeId());
			//uriComponents.queryParam("listYN", ((AreaBasedListRP) rp).getListYN());
			//uriComponents.queryParam("sigunguCode", ((AreaBasedListRP) rp).getSigunguCode());
			//uriComponents.queryParam("eventStartDate", ((AreaBasedListRequest) rp).getEventStartDate());
			//uriComponents.queryParam("eventEndDate", ((AreaBasedListRP) rp).getEventEndDate());
			//uriComponents.queryParam("hanOk", ((AreaBasedListRP) rp).getHanOk());
			//uriComponents.queryParam("benikia", ((AreaBasedListRP) rp).getBenikia());
			//uriComponents.queryParam("goodStay", ((AreaBasedListRP) rp).getGoodStay());
		}
		
		if(this.rp instanceof SearchKeywordRequest) {
			//uriComponents.queryParam("listYN", ((SearchKeywordRP) rp).getListYN());
			//uriComponents.queryParam("arrange", ((SearchKeywordRP) rp).getArrange());
			uriComponents.queryParam("contentTypeId", ((SearchKeywordRequest) rp).getContentTypeId());
			//uriComponents.queryParam("areaCode", ((SearchKeywordRP) rp).getAreaCode());
			//uriComponents.queryParam("sigunguCode", ((SearchKeywordRP) rp).getSigunguCode());
			//uriComponents.queryParam("cat1", ((SearchKeywordRP) rp).getCat1());
			//uriComponents.queryParam("cat2", ((SearchKeywordRP) rp).getCat2());
			//uriComponents.queryParam("cat3", ((SearchKeywordRP) rp).getCat3());
			uriComponents.queryParam("keyword", ((SearchKeywordRequest) rp).getKeyword());
		}
		
		uriComponents.queryParam("pageNo", pageNo);
		uriComponents.build();
		
		return uriComponents.toUriString();
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
