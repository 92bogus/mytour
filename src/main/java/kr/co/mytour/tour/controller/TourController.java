package kr.co.mytour.tour.controller;

import kr.co.mytour.tour.domain.Criteria;
import kr.co.mytour.tour.domain.PageMaker;
import kr.co.mytour.tour.domain.RequestUriMaker;
import kr.co.mytour.tour.domain.request.AreaBasedListRequest;
import kr.co.mytour.tour.domain.request.DetailCommon;
import kr.co.mytour.tour.domain.request.DetailImage;
import kr.co.mytour.tour.domain.request.DetailInfo;
import kr.co.mytour.tour.domain.request.DetailIntro;
import kr.co.mytour.tour.domain.request.LocationBasedList;
import kr.co.mytour.tour.domain.request.SearchKeyword;
import kr.co.mytour.tour.service.TourService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Calendar;
import java.util.Map;

@Controller
@RequestMapping(value = "/tour", method = RequestMethod.GET)
public class TourController {

	private static final Logger logger = LoggerFactory.getLogger(TourController.class);

	private final TourService tourService;
	@Autowired
	public TourController(TourService tourService) {
		this.tourService = tourService;
	}

	@GetMapping("")
	public String goMain(Model model) {
	    Calendar cal = Calendar.getInstance();
	    int year = cal.get(Calendar.YEAR);
	    int month = cal.get(Calendar.MONDAY) + 1;
	    String eventStartDate = "" + year + month + "01";
		AreaBasedListRequest areaBasedListRequestFestival = new AreaBasedListRequest();
		areaBasedListRequestFestival.setNumOfRows("3");
		areaBasedListRequestFestival.setContentTypeId("15");
		//areaBasedListRequestFestival.setEventStartDate(eventStartDate);
		RequestUriMaker requestUriMaker = new RequestUriMaker(areaBasedListRequestFestival);
		Map<String, Object> areaBasedListFestivalMap = tourService.getInfo(requestUriMaker.toString(), true);

		AreaBasedListRequest areaBasedListRequestSights = new AreaBasedListRequest();
		areaBasedListRequestSights.setNumOfRows("3");
		areaBasedListRequestSights.setContentTypeId("12");
		requestUriMaker = new RequestUriMaker(areaBasedListRequestSights);
		Map<String, Object> areaBasedListSightsMap = tourService.getInfo(requestUriMaker.toString(), true);

		AreaBasedListRequest areaBasedListRequestFood = new AreaBasedListRequest();
		areaBasedListRequestFood.setNumOfRows("3");
		areaBasedListRequestFood.setContentTypeId("39");
		requestUriMaker = new RequestUriMaker(areaBasedListRequestFood);
		Map<String, Object> areaBasedListFoodMap = tourService.getInfo(requestUriMaker.toString(), true);

		AreaBasedListRequest areaBasedListRequestCulture = new AreaBasedListRequest();
		areaBasedListRequestCulture.setNumOfRows("3");
		areaBasedListRequestCulture.setContentTypeId("14");
		requestUriMaker = new RequestUriMaker(areaBasedListRequestCulture);
		Map<String, Object> areaBasedListCultureMap = tourService.getInfo(requestUriMaker.toString(), true);

		AreaBasedListRequest areaBasedListRequestShopping = new AreaBasedListRequest();
		areaBasedListRequestShopping.setNumOfRows("3");
		areaBasedListRequestShopping.setContentTypeId("38");
		requestUriMaker = new RequestUriMaker(areaBasedListRequestShopping);
		Map<String, Object> areaBasedListShoppingMap = tourService.getInfo(requestUriMaker.toString(), true);

		AreaBasedListRequest areaBasedListRequestLeports = new AreaBasedListRequest();
		areaBasedListRequestLeports.setNumOfRows("3");
		areaBasedListRequestLeports.setContentTypeId("28");
		requestUriMaker = new RequestUriMaker(areaBasedListRequestLeports);
		Map<String, Object> areaBasedListLeportsMap = tourService.getInfo(requestUriMaker.toString(), true);

		AreaBasedListRequest areaBasedListRequestStay = new AreaBasedListRequest();
		areaBasedListRequestStay.setNumOfRows("3");
		areaBasedListRequestStay.setContentTypeId("32");
		requestUriMaker = new RequestUriMaker(areaBasedListRequestStay);
		Map<String, Object> areaBasedListStayMap = tourService.getInfo(requestUriMaker.toString(), true);

		model.addAttribute("areaBasedListFestivalMap", areaBasedListFestivalMap);
		model.addAttribute("areaBasedListSightsMap", areaBasedListSightsMap);
		model.addAttribute("areaBasedListFoodMap", areaBasedListFoodMap);
		model.addAttribute("areaBasedListCultureMap", areaBasedListCultureMap);
		model.addAttribute("areaBasedListShoppingMap", areaBasedListShoppingMap);
		model.addAttribute("areaBasedListLeportsMap", areaBasedListLeportsMap);
		model.addAttribute("areaBasedListStayMap", areaBasedListStayMap);

		return "tour/newHome";
	}
	
	@GetMapping("/areaBasedList")
	public String getAreaBasedList(@RequestParam @ModelAttribute String contentTypeId, @ModelAttribute("rp") AreaBasedListRequest rp, Model model) {
		RequestUriMaker restUri = new RequestUriMaker(rp);
		Map<String, Object> areaBasedListMap = tourService.getAreaBasedList(restUri.toString());

		String totalCount = "" + ((Map<String, Object>)((Map<String, Object>) areaBasedListMap.get("response")).get("body")).get("totalCount");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setRp(rp);
		pageMaker.setTotalCount(totalCount);

		model.addAttribute("areaBasedListMap", areaBasedListMap);
		model.addAttribute("pageMaker", pageMaker);
		
		return "/tour/areaBasedList";
	}
	
	@GetMapping("/detail")
	public String goDetail(@RequestParam @ModelAttribute String contentTypeId, DetailCommon detailCommon,
						   DetailIntro detailIntro, DetailInfo detailInfo, DetailImage detailImage, Model model,
						   @ModelAttribute("cri") Criteria cri) {

		/* 기본 정보 */
		Map<String, Map<String, Object>> detailMap = tourService.getDetail(detailCommon, detailIntro, detailInfo, detailImage);

		/* 위치 기반 정보 */
		String[] mapXY = getMapXY(detailMap);
	    LocationBasedList locationBasedList = new LocationBasedList();
	    locationBasedList.setNumOfRows("3");
	    locationBasedList.setMapX(mapXY[0]);
	    locationBasedList.setMapY(mapXY[1]);
	    RequestUriMaker detailLocationUri = new RequestUriMaker(locationBasedList);
	    Map<String, Object> detailLocationMap = tourService.getInfo(detailLocationUri.toString(), false);

		/* 행사 정보 */
	    AreaBasedListRequest areaBasedListRequestFestival = new AreaBasedListRequest();
	    Calendar cal = Calendar.getInstance();
	    int year = cal.get(Calendar.YEAR);
	    int month = cal.get(Calendar.MONDAY) + 1;
	    String eventStartDate = "" + year + month + "01";
	    areaBasedListRequestFestival.setNumOfRows("2");
	    areaBasedListRequestFestival.setContentTypeId("15");
	    areaBasedListRequestFestival.setArrange("P");
	    //areaBasedListRequestFestival.setEventStartDate(eventStartDate);
	    RequestUriMaker detailPopularFestivalUri = new RequestUriMaker(areaBasedListRequestFestival);
	    Map<String, Object> detailPopularFestivalMap = tourService.getInfo(detailPopularFestivalUri.toString(), false);

		/* 인기있는 장소 */
	    AreaBasedListRequest areaBasedListRequestSights = new AreaBasedListRequest();
	    areaBasedListRequestSights.setNumOfRows("3");
	    areaBasedListRequestSights.setContentTypeId("12");
	    areaBasedListRequestSights.setArrange("P");
	    RequestUriMaker detailTopSightsUri = new RequestUriMaker(areaBasedListRequestSights);
	    Map<String, Object> detailTopSightsMap = tourService.getInfo(detailTopSightsUri.toString(), false);

		/* 기본 정보 */
		model.addAttribute("detailCommonMap", detailMap.get("detailCommonMap"));
		model.addAttribute("detailIntroMap", detailMap.get("detailIntroMap"));
		model.addAttribute("detailInfoMap", detailMap.get("detailInfoMap"));
		model.addAttribute("detailImageMap", detailMap.get("detailImageMap"));

		/* 위치 기반 정보 */
		model.addAttribute("detailLocationMap", detailLocationMap);

		/* 행사 정보 */
		model.addAttribute("month", month);
		model.addAttribute("detailPopularFestivalMap", detailPopularFestivalMap);

		/* 인기있는 장소 */
		model.addAttribute("detailTopSightsMap", detailTopSightsMap);

		return "tour/detail";
		
	}

	@GetMapping("/searchKeyword")
	public String getSearchKeyword(@ModelAttribute("rp") SearchKeyword searchKeyword, Model model) {
		RequestUriMaker searchKeywordUri = new RequestUriMaker(searchKeyword);
		Map<String, Object> searchKeywordMap = tourService.getInfo(searchKeywordUri.toString(), true);
		
		String totalCount = "" + ((Map<String, Object>)((Map<String, Object>) searchKeywordMap.get("response")).get("body")).get("totalCount");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setRp(searchKeyword);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("searchKeywordMap", searchKeywordMap);
		model.addAttribute("pageMaker", pageMaker);
		
		return "tour/searchKeyword";
	}

	private String[] getMapXY(Map<String, Map<String, Object>> detailMap) {
		String[] result = new String[2];

		Map<String, Object> detailCommonMap = detailMap.get("detailCommonMap");
		Map<String, Object> responseMap = (Map<String, Object>) detailCommonMap.get("response");
		Map<String, Object> bodyMap = (Map<String, Object>) responseMap.get("body");
		Map<String, Object> itemsMap = (Map<String, Object>) bodyMap.get("items");
		Map<String, Object> itemMap = (Map<String, Object>) itemsMap.get("item");

		String mapX = "" + itemMap.get("mapx");
		String mapY = "" + itemMap.get("mapy");

		result[0] = mapX;
		result[1] = mapY;

		return result;
	}
	
}
