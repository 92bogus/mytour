package kr.co.mytour.tour.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import kr.co.mytour.tour.domain.requestParam.AreaBasedListRP;
import kr.co.mytour.tour.domain.requestParam.RequestParam;
import kr.co.mytour.tour.domain.requestParam.SearchKeywordRP;
import org.springframework.web.util.UriComponentsBuilder;

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
	
	public RequestParam getRp() {
		return rp;
	}
	public void setRp(RequestParam rp) {
		this.rp = rp;
	}
	public String getTotalCount() {
		return "" + totalCount;
	}
	public void setTotalCount(String totalCount) {
		this.totalCount = Integer.parseInt(totalCount);
		calcData();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getLastPage() {
		return lastPage;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
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
		
		if(this.rp instanceof AreaBasedListRP) {
			//uriComponents.queryParam("areaCode", ((AreaBasedListRP) rp).getAreaCode());
			//uriComponents.queryParam("arrange", ((AreaBasedListRP) rp).getArrange());
			//uriComponents.queryParam("cat1", ((AreaBasedListRP) rp).getCat1());
			//uriComponents.queryParam("cat2", ((AreaBasedListRP) rp).getCat2());
			//uriComponents.queryParam("cat3", ((AreaBasedListRP) rp).getCat3());
			uriComponents.queryParam("contentTypeId", ((AreaBasedListRP) rp).getContentTypeId());
			//uriComponents.queryParam("listYN", ((AreaBasedListRP) rp).getListYN());
			//uriComponents.queryParam("sigunguCode", ((AreaBasedListRP) rp).getSigunguCode());
			uriComponents.queryParam("eventStartDate", ((AreaBasedListRP) rp).getEventStartDate());
			//uriComponents.queryParam("eventEndDate", ((AreaBasedListRP) rp).getEventEndDate());
			//uriComponents.queryParam("hanOk", ((AreaBasedListRP) rp).getHanOk());
			//uriComponents.queryParam("benikia", ((AreaBasedListRP) rp).getBenikia());
			//uriComponents.queryParam("goodStay", ((AreaBasedListRP) rp).getGoodStay());
		}
		
		if(this.rp instanceof SearchKeywordRP) {
			//uriComponents.queryParam("listYN", ((SearchKeywordRP) rp).getListYN());
			//uriComponents.queryParam("arrange", ((SearchKeywordRP) rp).getArrange());
			uriComponents.queryParam("contentTypeId", ((SearchKeywordRP) rp).getContentTypeId());
			//uriComponents.queryParam("areaCode", ((SearchKeywordRP) rp).getAreaCode());
			//uriComponents.queryParam("sigunguCode", ((SearchKeywordRP) rp).getSigunguCode());
			//uriComponents.queryParam("cat1", ((SearchKeywordRP) rp).getCat1());
			//uriComponents.queryParam("cat2", ((SearchKeywordRP) rp).getCat2());
			//uriComponents.queryParam("cat3", ((SearchKeywordRP) rp).getCat3());
			uriComponents.queryParam("keyword", ((SearchKeywordRP) rp).getKeyword());
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
	
	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", lastPage=" + lastPage + ", perPageNum=" + perPageNum
				+ ", displayPageNum=" + displayPageNum + ", rp=" + rp + "]";
	}
	
	
}
