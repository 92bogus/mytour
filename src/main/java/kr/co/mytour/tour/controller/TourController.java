package kr.co.mytour.tour.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mytour.tour.domain.Criteria;
import kr.co.mytour.tour.domain.PageMaker;
import kr.co.mytour.tour.domain.RequestUriMaker;
import kr.co.mytour.tour.domain.requestParam.AreaBasedListRP;
import kr.co.mytour.tour.domain.requestParam.DetailCommonRP;
import kr.co.mytour.tour.domain.requestParam.DetailImageRP;
import kr.co.mytour.tour.domain.requestParam.DetailInfoRP;
import kr.co.mytour.tour.domain.requestParam.DetailIntroRP;
import kr.co.mytour.tour.domain.requestParam.LocationBasedListRP;
import kr.co.mytour.tour.domain.requestParam.SearchKeywordRP;

@Controller
@RequestMapping("/tour")
public class TourController {
	
	private static final Logger logger = LoggerFactory.getLogger(TourController.class);

	@RequestMapping("")
	public String goMain(Model model) {		
		
//	    Calendar cal = Calendar.getInstance();
//	    int year = cal.get(Calendar.YEAR);
//	    int month = cal.get(Calendar.MONDAY) + 1;
//	    String eventStartDate = "" + year + month + "01";
//		
//		AreaBasedListRP areaBasedListRPFestival = new AreaBasedListRP();
//		areaBasedListRPFestival.setNumOfRows("3");
//		areaBasedListRPFestival.setContentTypeId("15");
//		areaBasedListRPFestival.setEventStartDate(eventStartDate);
//		
//		RequestUriMaker requestUriMaker = new RequestUriMaker(areaBasedListRPFestival);
//		String areaBasedListFestivalText = getData(requestUriMaker.toString());
//		areaBasedListFestivalText = addOverview(areaBasedListFestivalText);
//		
//		Map<String, Object> areaBasedListFestivalMap = jsonToMap(areaBasedListFestivalText);
//		model.addAttribute("areaBasedListFestivalMap", areaBasedListFestivalMap);
//		
//		AreaBasedListRP areaBasedListRPSights = new AreaBasedListRP();
//		areaBasedListRPSights.setNumOfRows("3");
//		areaBasedListRPSights.setContentTypeId("12");
//		
//		requestUriMaker = new RequestUriMaker(areaBasedListRPSights);
//		String areaBasedListSightsText = getData(requestUriMaker.toString());
//		areaBasedListSightsText = addOverview(areaBasedListSightsText);
//		
//		Map<String, Object> areaBasedListSightsMap = jsonToMap(areaBasedListSightsText);
//		model.addAttribute("areaBasedListSightsMap", areaBasedListSightsMap);
//			
//		AreaBasedListRP areaBasedListRPFood = new AreaBasedListRP();
//		areaBasedListRPFood.setNumOfRows("3");
//		areaBasedListRPFood.setContentTypeId("39");
//		
//		requestUriMaker = new RequestUriMaker(areaBasedListRPFood);
//		String areaBasedListFoodText = getData(requestUriMaker.toString());
//		areaBasedListFoodText = addOverview(areaBasedListFoodText);
//		
//		Map<String, Object> areaBasedListFoodMap = jsonToMap(areaBasedListFoodText);
//		model.addAttribute("areaBasedListFoodMap", areaBasedListFoodMap);
//		
//		AreaBasedListRP areaBasedListRPCulture = new AreaBasedListRP();
//		areaBasedListRPCulture.setNumOfRows("3");
//		areaBasedListRPCulture.setContentTypeId("14");
//		
//		requestUriMaker = new RequestUriMaker(areaBasedListRPCulture);
//		String areaBasedListCultureText = getData(requestUriMaker.toString());
//		areaBasedListCultureText = addOverview(areaBasedListCultureText);
//		
//		Map<String, Object> areaBasedListCultureMap = jsonToMap(areaBasedListCultureText);
//		model.addAttribute("areaBasedListCultureMap", areaBasedListCultureMap);
//		
//		AreaBasedListRP areaBasedListRPShopping = new AreaBasedListRP();
//		areaBasedListRPShopping.setNumOfRows("3");
//		areaBasedListRPShopping.setContentTypeId("38");
//		
//		requestUriMaker = new RequestUriMaker(areaBasedListRPShopping);
//		String areaBasedListShoppingText = getData(requestUriMaker.toString());
//		areaBasedListShoppingText = addOverview(areaBasedListShoppingText);
//		
//		Map<String, Object> areaBasedListShoppingMap = jsonToMap(areaBasedListShoppingText);
//		model.addAttribute("areaBasedListShoppingMap", areaBasedListShoppingMap);
//			
//		AreaBasedListRP areaBasedListRPLeports = new AreaBasedListRP();
//		areaBasedListRPLeports.setNumOfRows("3");
//		areaBasedListRPLeports.setContentTypeId("28");
//		
//		requestUriMaker = new RequestUriMaker(areaBasedListRPLeports);
//		String areaBasedListLeportsText = getData(requestUriMaker.toString());
//		areaBasedListLeportsText = addOverview(areaBasedListLeportsText);
//		
//		Map<String, Object> areaBasedListLeportsMap = jsonToMap(areaBasedListLeportsText);
//		model.addAttribute("areaBasedListLeportsMap", areaBasedListLeportsMap);
//		
//		AreaBasedListRP areaBasedListRPStay = new AreaBasedListRP();
//		areaBasedListRPStay.setNumOfRows("3");
//		areaBasedListRPStay.setContentTypeId("32");
//		
//		requestUriMaker = new RequestUriMaker(areaBasedListRPStay);
//		String areaBasedListStayText = getData(requestUriMaker.toString());
//		areaBasedListStayText = addOverview(areaBasedListStayText);
//		
//		Map<String, Object> areaBasedListStayMap = jsonToMap(areaBasedListStayText);
//		model.addAttribute("areaBasedListStayMap", areaBasedListStayMap);
		
		//return "tour/newHome";
		return "tour/tempHome";
	}
	
	@RequestMapping(value = "/areaBasedList", method = RequestMethod.GET)
	public String getAreaBasedList(@RequestParam String contentTypeId, @ModelAttribute("rp") AreaBasedListRP rp, Model model) throws Exception {	
		
		RequestUriMaker restUri = new RequestUriMaker(rp);
	
		String areaBasedListText = getData(restUri.toString());
		areaBasedListText = addOverview(areaBasedListText);
		
		Map<String, Object> areaBasedListMap = jsonToMap(areaBasedListText);
		
		Map<String, Object> responseMap = (Map<String, Object>) areaBasedListMap.get("response");
		Map<String, Object> bodyMap = (Map<String, Object>) responseMap.get("body");
		String totalCount = "" + bodyMap.get("totalCount");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setRp(rp);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("contentTypeId", contentTypeId);
		model.addAttribute("areaBasedListMap", areaBasedListMap);
		model.addAttribute("pageMaker", pageMaker);
		
		return "/tour/areaBasedList";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String goDetail(@RequestParam String contentTypeId, DetailCommonRP detailCommonRP,
			DetailIntroRP detailIntroRP, DetailInfoRP detailInfoRP, DetailImageRP detailImageRP, Model model,
			@ModelAttribute("cri") Criteria cri) throws Exception {	
		
		RequestUriMaker detailCommonUri = new RequestUriMaker(detailCommonRP);
		RequestUriMaker detailIntroUri = new RequestUriMaker(detailIntroRP);
		RequestUriMaker detailInfoUri = new RequestUriMaker(detailInfoRP);
		RequestUriMaker detailImageUri = new RequestUriMaker(detailImageRP);
		
		String detailCommonText = getData(detailCommonUri.toString());
		String detailIntroText = getData(detailIntroUri.toString());
		String detailInfoText = getData(detailInfoUri.toString());
		String detailImageText = getData(detailImageUri.toString());
		
		Map<String, Object> detailCommonMap = jsonToMap(detailCommonText);
		Map<String, Object> detailIntroMap = jsonToMap(detailIntroText);
		Map<String, Object> detailInfoMap = jsonToMap(detailInfoText);
		Map<String, Object> detailImageMap = jsonToMap(detailImageText);
		
		model.addAttribute("contentTypeId", contentTypeId);
		model.addAttribute("detailCommonMap", detailCommonMap);
		model.addAttribute("detailIntroMap", detailIntroMap);
		model.addAttribute("detailInfoMap", detailInfoMap);
		model.addAttribute("detailImageMap", detailImageMap);
		
		Map<String, Object> responseMap = (Map<String, Object>) detailCommonMap.get("response");
	    Map<String, Object> bodyMap = (Map<String, Object>) responseMap.get("body");
	    Map<String, Object> itemsMap = (Map<String, Object>) bodyMap.get("items");
	    Map<String, Object> itemMap = (Map<String, Object>) itemsMap.get("item");
	      
	    String mapX = "" + itemMap.get("mapx");
	    String mapY = "" + itemMap.get("mapy");
	      
	    LocationBasedListRP locationBasedListRP = new LocationBasedListRP();
	      
	    locationBasedListRP.setNumOfRows("3");
	    locationBasedListRP.setMapX(mapX);
	    locationBasedListRP.setMapY(mapY);
	      
	    RequestUriMaker detailLocationUri = new RequestUriMaker(locationBasedListRP);
	    String detailLocationText = getData(detailLocationUri.toString());
	      
	    Map<String, Object> detailLocationMap = jsonToMap(detailLocationText);
	    model.addAttribute("detailLocationMap", detailLocationMap);
	    
	    AreaBasedListRP areaBasedListRPFestival = new AreaBasedListRP();
	    
	    Calendar cal = Calendar.getInstance();
	    int year = cal.get(Calendar.YEAR);
	    int month = cal.get(Calendar.MONDAY) + 1;
	    String eventStartDate = "" + year + month + "01";
	    
	    areaBasedListRPFestival.setNumOfRows("2");
	    areaBasedListRPFestival.setContentTypeId("15");
	    areaBasedListRPFestival.setArrange("P");
	    areaBasedListRPFestival.setEventStartDate(eventStartDate);
	    
	    RequestUriMaker detailPopularFestivalUri = new RequestUriMaker(areaBasedListRPFestival);
	    String detailPopularFestivalText = getData(detailPopularFestivalUri.toString());
	    
	    Map<String, Object> detailPopularFestivalMap = jsonToMap(detailPopularFestivalText);
	    model.addAttribute("month", month);
	    model.addAttribute("detailPopularFestivalMap", detailPopularFestivalMap);
	    
	    AreaBasedListRP areaBasedListRPSights = new AreaBasedListRP();
	    areaBasedListRPSights.setNumOfRows("3");
	    areaBasedListRPSights.setContentTypeId("12");
	    areaBasedListRPSights.setArrange("P");
	   
	    RequestUriMaker detailTopSightsUri = new RequestUriMaker(areaBasedListRPSights);
	    String detailTopSightsText = getData(detailTopSightsUri.toString());
	    
	    Map<String, Object> detailTopSightsMap = jsonToMap(detailTopSightsText);
	    model.addAttribute("detailTopSightsMap", detailTopSightsMap);
		
		return "tour/detail";
		
	}
	
	@RequestMapping(value = "/searchKeyword", method = RequestMethod.GET)
	public String getSearchKeyword(@ModelAttribute("rp") SearchKeywordRP searchKeywordRP, Model model) {
		RequestUriMaker searchKeywordUri = new RequestUriMaker(searchKeywordRP);
		String searchKeywordText = getData(searchKeywordUri.toString());
		searchKeywordText = addOverview(searchKeywordText);
		
		Map<String, Object> searchKeywordMap = jsonToMap(searchKeywordText);
		
		String totalCount = "" + ((Map<String, Object>)((Map<String, Object> ) 
				searchKeywordMap.get("response")).get("body")).get("totalCount");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setRp(searchKeywordRP);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("searchKeywordMap", searchKeywordMap);
		model.addAttribute("pageMaker", pageMaker);
		
		return "tour/searchKeyword";
	}
	
	public String getData(String urlPath) {
		BufferedReader in = null;
		StringBuffer lineBuffer = new StringBuffer();
		
		try {
			URL obj = new URL(urlPath); 
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));      
            
            String line = "";
            
            while((line = in.readLine()) != null) {
            	lineBuffer.append(line);
            }
        } catch(Exception e) {
        	e.printStackTrace();
        } finally {
            if(in != null) { 
            	try { 
            		in.close(); 
            	} catch(Exception e) { 
            		e.printStackTrace(); 
            	}
            }
        }
		 
		return lineBuffer.toString();
	}
	
	public Map<String, Object> jsonToMap(String resultText) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			JSONParser jsonParser = new JSONParser();
	        JSONObject resultObj = (JSONObject) jsonParser.parse(resultText);
	        map = toMap(resultObj);
			
		} catch (Exception e) {
            e.printStackTrace();
        } 

		return map;
	}
	
	public static Map<String, Object> toMap(JSONObject object) throws Exception {
	    Map<String, Object> map = new HashMap<String, Object>();
	    
	    Iterator<String> keysItr = object.keySet().iterator();

	    while(keysItr.hasNext()) {
	        String key = keysItr.next();
	        Object value = object.get(key);

	        if(value instanceof JSONArray) {
	            value = toList((JSONArray) value);
	        } else if(value instanceof JSONObject) {
	            value = toMap((JSONObject) value);
	        }

	        map.put(key, value);
	    }

	    return map;
	}

	public static List<Object> toList(JSONArray array) throws Exception {
	    List<Object> list = new ArrayList<Object>();

	    for(int i=0; i<array.size(); i++) {
	        Object value = array.get(i);

	        if(value instanceof JSONArray) {
	            value = toList((JSONArray) value);
	        } else if(value instanceof JSONObject) {
	            value = toMap((JSONObject) value);
	        }
	      
	        list.add(value);
	    }
	    
	    return list;
	}	
	
	public String addOverview(String resultText) {
		
		DetailCommonRP detailCommonRP = new DetailCommonRP();
		RequestUriMaker requestUriMaker;
		
		try {
			JSONParser jsonParser = new JSONParser();
			JSONObject resultObj = (JSONObject) jsonParser.parse(resultText);
			JSONObject responseObj = (JSONObject) resultObj.get("response");
			JSONObject bodyObj = (JSONObject) responseObj.get("body");
			JSONObject itemsObj = (JSONObject) bodyObj.get("items");
			JSONArray itemArray = (JSONArray) itemsObj.get("item");
			
			for(int i=0; i<itemArray.size(); i++) {
				JSONObject item = (JSONObject) itemArray.get(i);
				
				String contentId = "" + item.get("contentid");
				detailCommonRP.setContentId(contentId);
				requestUriMaker = new RequestUriMaker(detailCommonRP);
				String detailCommonText = getData(requestUriMaker.toString());
				
				String overview = getOverview(detailCommonText);
				item.put("overview", overview);
			}
			
			return resultObj.toJSONString();
			
		} catch(Exception e) {
			return resultText;
		}
		
	}
	
	public String getOverview(String detailCommonText) {
		
		String overview = "";
		
		try {
			JSONParser jsonParser = new JSONParser();
			JSONObject resultObj = (JSONObject) jsonParser.parse(detailCommonText);
			JSONObject responseObj = (JSONObject) resultObj.get("response");
			JSONObject bodyObj = (JSONObject) responseObj.get("body");
			JSONObject itemsObj = (JSONObject) bodyObj.get("items");
			JSONObject itemObj = (JSONObject) itemsObj.get("item");
			
			overview = "" + itemObj.get("overview");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return overview;
	}
	
}
