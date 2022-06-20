package kr.co.mytour.tour.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.co.mytour.tour.domain.RequestUriMaker;
import kr.co.mytour.tour.domain.request.AreaBasedListRequest;
import kr.co.mytour.tour.domain.request.DetailCommon;
import kr.co.mytour.tour.domain.request.DetailImage;
import kr.co.mytour.tour.domain.request.DetailInfo;
import kr.co.mytour.tour.domain.request.DetailIntro;
import kr.co.mytour.tour.domain.request.AreaCodeRequest;
import kr.co.mytour.tour.domain.request.CategoryCodeRequest;
import kr.co.mytour.tour.domain.response.ResponseWrapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Service
public class TourServiceImpl implements TourService {

    private final ObjectMapper objectMapper = new ObjectMapper();

//    @Autowired
//    public TourServiceImpl(ObjectMapper objectMapper) {
//        this.objectMapper = objectMapper;
//    }

    @Override
    public Map<String, Object> getAreaBasedList(String uri) {
        Map<String, Object> result = jsonToMap(addOverview(getData(uri)));
        return result;
    }

    @Override
    public Map<String, Map<String, Object>> getDetail(DetailCommon detailCommon, DetailIntro detailIntro, DetailInfo detailInfo, DetailImage detailImage) {
        Map<String, Map<String, Object>> result = new HashMap<>();

        RequestUriMaker detailCommonUri = new RequestUriMaker(detailCommon);
        RequestUriMaker detailIntroUri = new RequestUriMaker(detailIntro);
        RequestUriMaker detailInfoUri = new RequestUriMaker(detailInfo);
        RequestUriMaker detailImageUri = new RequestUriMaker(detailImage);

        String detailCommonText = getData(detailCommonUri.toString());
        String detailIntroText = getData(detailIntroUri.toString());
        String detailInfoText = getData(detailInfoUri.toString());
        String detailImageText = getData(detailImageUri.toString());

        Map<String, Object> detailCommonMap = jsonToMap(detailCommonText);
        Map<String, Object> detailIntroMap = jsonToMap(detailIntroText);
        Map<String, Object> detailInfoMap = jsonToMap(detailInfoText);
        Map<String, Object> detailImageMap = jsonToMap(detailImageText);

        result.put("detailCommonMap", detailCommonMap);
        result.put("detailIntroMap", detailIntroMap);
        result.put("detailInfoMap", detailInfoMap);
        result.put("detailImageMap", detailImageMap);

        return result;
    }

    @Override
    public Map<String, Object> getInfo(String uri, boolean overviewYn) {
        if (overviewYn)
            return jsonToMap(addOverview(getData(uri)));
        else
            return jsonToMap(getData(uri));
    }

    @Override
    public ResponseWrapper getAreaCode(AreaCodeRequest param) throws IOException {
        String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode";
        String queryString = "?MobileOS=" + param.getMobileOS() +
                "&MobileApp=" + param.getMobileApp() + "&ServiceKey=" + param.getServiceKey() + "&_type=" + param.get_type();

        String resultString = getData(url + queryString);
        ResponseWrapper result = objectMapper.readValue(resultString, ResponseWrapper.class);

        return result;
    }

    @Override
    public ResponseWrapper getCategoryCode(CategoryCodeRequest param) throws IOException {
        String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode";
        String queryString = "?MobileOS=" + param.getMobileOS() +
                "&MobileApp=" + param.getMobileApp() + "&ServiceKey=" + param.getServiceKey() + "&_type=" + param.get_type();

        String resultString = getData(url + queryString);
        ResponseWrapper result = objectMapper.readValue(resultString, ResponseWrapper.class);
        return result;
    }

    @Override
    public ResponseWrapper getAreaBasedList(AreaBasedListRequest param) throws IOException {
        String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList";
        String queryString = "?MobileOS=" + param.getMobileOS() +
                "&MobileApp=" + param.getMobileApp() + "&ServiceKey=" + param.getServiceKey() + "&_type=" + param.get_type();

        String resultString = getData(url + queryString);
        ResponseWrapper result = objectMapper.readValue(resultString, ResponseWrapper.class);
        return result;
    }


    private String getData(String urlPath) {
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

    private static Map<String, Object> toMap(JSONObject object) throws Exception {
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

    private static List<Object> toList(JSONArray array) throws Exception {
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

    private Map<String, Object> jsonToMap(String resultText) {
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



    private String addOverview(String resultText) {

        DetailCommon detailCommon = new DetailCommon();
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
                detailCommon.setContentId(contentId);
                requestUriMaker = new RequestUriMaker(detailCommon);
                String detailCommonText = getData(requestUriMaker.toString());

                String overview = getOverview(detailCommonText);
                item.put("overview", overview);
            }

            return resultObj.toJSONString();

        } catch(Exception e) {
            return resultText;
        }

    }

    private String getOverview(String detailCommonText) {

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
