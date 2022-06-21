package com.shinho.tour.tour.service;

import com.shinho.tour.tour.domain.request.AreaBasedListRequest;
import com.shinho.tour.tour.domain.request.AreaCodeRequest;
import com.shinho.tour.tour.domain.request.DetailCommonRequest;
import com.shinho.tour.tour.domain.request.DetailImageRequest;
import com.shinho.tour.tour.domain.request.DetailInfoRequest;
import com.shinho.tour.tour.domain.request.DetailIntroRequest;
import com.shinho.tour.tour.domain.request.CategoryCodeRequest;
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

import java.io.IOException;
import java.util.Map;

public interface TourService {

    Root<AreaCode> getAreaCode(AreaCodeRequest param) throws IOException;

    Root<CategoryCode> getCategoryCode(CategoryCodeRequest param) throws IOException;

    Root<AreaBasedList> getAreaBasedList(AreaBasedListRequest param) throws IOException;

    Root<LocationBasedList> getLocationBasedList(LocationBasedListRequest param) throws IOException;

    Root<SearchKeyword> getSearchKeyword(SearchKeywordRequest param) throws IOException;

    Root<SearchFestival> getSearchFestival(SearchFestivalRequest param) throws IOException;

    Root<SearchStay> getSearchStay(SearchStayRequest param) throws IOException;

    Root<DetailCommon> getDetailCommon(DetailCommonRequest param) throws IOException;

    Root<DetailIntro> getDetailIntro(DetailIntroRequest param) throws IOException;

    Root<DetailInfo> getDetailInfo(DetailInfoRequest param) throws IOException;

    Root<DetailImage> getDetailImage(DetailImageRequest param) throws IOException;

}
