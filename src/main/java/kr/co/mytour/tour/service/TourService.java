package kr.co.mytour.tour.service;

import kr.co.mytour.tour.domain.request.AreaBasedListRequest;
import kr.co.mytour.tour.domain.request.AreaCodeRequest;
import kr.co.mytour.tour.domain.request.DetailCommon;
import kr.co.mytour.tour.domain.request.DetailImage;
import kr.co.mytour.tour.domain.request.DetailInfo;
import kr.co.mytour.tour.domain.request.DetailIntro;
import kr.co.mytour.tour.domain.request.CategoryCodeRequest;
import kr.co.mytour.tour.domain.response.ResponseWrapper;

import java.io.IOException;
import java.util.Map;

public interface TourService {
    Map<String, Object> getAreaBasedList(String uri);

    Map<String, Map<String, Object>> getDetail(DetailCommon detailCommon, DetailIntro detailIntro, DetailInfo detailInfo, DetailImage detailImage);

    Map<String, Object> getInfo(String uri, boolean overviewYn);

    ResponseWrapper getAreaCode(AreaCodeRequest param) throws IOException;

    ResponseWrapper getCategoryCode(CategoryCodeRequest param) throws IOException;

    ResponseWrapper getAreaBasedList(AreaBasedListRequest param) throws IOException;
}
