package com.shinho.tour.tour.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shinho.tour.tour.domain.RequestUriMaker;
import com.shinho.tour.tour.domain.request.AreaBasedListRequest;
import com.shinho.tour.tour.domain.request.AreaCodeRequest;
import com.shinho.tour.tour.domain.request.CategoryCodeRequest;
import com.shinho.tour.tour.domain.request.DetailCommonRequest;
import com.shinho.tour.tour.domain.request.DetailImageRequest;
import com.shinho.tour.tour.domain.request.DetailInfoRequest;
import com.shinho.tour.tour.domain.request.DetailIntroRequest;
import com.shinho.tour.tour.domain.request.LocationBasedListRequest;
import com.shinho.tour.tour.domain.request.SearchFestivalRequest;
import com.shinho.tour.tour.domain.request.SearchKeywordRequest;
import com.shinho.tour.tour.domain.request.SearchStayRequest;
import com.shinho.tour.tour.domain.response.AreaBasedList;
import com.shinho.tour.tour.domain.response.AreaCode;
import com.shinho.tour.tour.domain.response.CategoryCode;
import com.shinho.tour.tour.domain.response.DetailCommon;
import com.shinho.tour.tour.domain.response.DetailImage;
import com.shinho.tour.tour.domain.response.DetailInfo;
import com.shinho.tour.tour.domain.response.DetailIntro;
import com.shinho.tour.tour.domain.response.LocationBasedList;
import com.shinho.tour.tour.domain.response.Root;
import com.shinho.tour.tour.domain.response.SearchFestival;
import com.shinho.tour.tour.domain.response.SearchKeyword;
import com.shinho.tour.tour.domain.response.SearchStay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.ReflectionUtils;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Service
public class TourServiceImpl implements TourService {

    private final ObjectMapper objectMapper;
    @Autowired
    public TourServiceImpl(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }

    private static final String baseUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";

    private String makeUrl(AreaCodeRequest param) {
        String operation = "areaCode";
        MultiValueMap<String, String> queryParams = new LinkedMultiValueMap<>();

        Arrays.stream(param.getClass().getSuperclass().getDeclaredFields())
                .forEach(f -> {
                    f.setAccessible(true);
                    queryParams.add(f.getName(), ReflectionUtils.getField(f, param) == null ? "" : "" + ReflectionUtils.getField(f, param));
                });

        Arrays.stream(param.getClass().getDeclaredFields())
                .forEach(f -> {
                    f.setAccessible(true);
                    queryParams.add(f.getName(), ReflectionUtils.getField(f, param) == null ? "" : "" + ReflectionUtils.getField(f, param));
                });

        URI uri = UriComponentsBuilder.fromUriString(baseUrl + operation)
                .queryParams(queryParams)
                .build()
                .toUri();

        return uri.toString();
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

    @Override
    public Root<AreaCode> getAreaCode(AreaCodeRequest param) throws JsonProcessingException {
        String url = makeUrl(param);
        System.out.println("[API URL]: " + url);
        String data = getData(url);

        Root<AreaCode> result = objectMapper.readValue(data, new TypeReference<>() {});

        return result;

    }



    @Override
    public Root<CategoryCode> getCategoryCode(CategoryCodeRequest param) throws IOException {
        return null;
    }

    @Override
    public Root<AreaBasedList> getAreaBasedList(AreaBasedListRequest param) throws IOException {
        return null;
    }

    @Override
    public Root<LocationBasedList> getLocationBasedList(LocationBasedListRequest param) throws IOException {
        return null;
    }

    @Override
    public Root<SearchKeyword> getSearchKeyword(SearchKeywordRequest param) throws IOException {
        return null;
    }

    @Override
    public Root<SearchFestival> getSearchFestival(SearchFestivalRequest param) throws IOException {
        return null;
    }

    @Override
    public Root<SearchStay> getSearchStay(SearchStayRequest param) throws IOException {
        return null;
    }

    @Override
    public Root<DetailCommon> getDetailCommon(DetailCommonRequest param) throws IOException {
        return null;
    }

    @Override
    public Root<DetailIntro> getDetailIntro(DetailIntroRequest param) throws IOException {
        return null;
    }

    @Override
    public Root<DetailInfo> getDetailInfo(DetailInfoRequest param) throws IOException {
        return null;
    }

    @Override
    public Root<DetailImage> getDetailImage(DetailImageRequest param) throws IOException {
        return null;
    }
}
