package kr.co.mytour.tour.service;

import kr.co.mytour.tour.domain.request.AreaBasedListRequest;
import kr.co.mytour.tour.domain.request.AreaCodeRequest;
import kr.co.mytour.tour.domain.request.CategoryCodeRequest;
import kr.co.mytour.tour.domain.response.ResponseWrapper;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;

import java.io.IOException;

import static org.assertj.core.api.Assertions.*;

class TourServiceImplTest {
    TourService tourService = new TourServiceImpl();

    @Test
    public void getAreaCodeTest() throws IOException {
        AreaCodeRequest param = new AreaCodeRequest();
        param.setMobileOS("ETC");
        param.setMobileApp("AppTest");
        //param.setServiceKey("lFVLzP9ISWyS58moYZ3pl9xPRb47EmwaVkDvgLlTtXi6UhpDpVaYPFE5U9dBLVw6gyM1gCgWDtDdZr3rkGDcGw%3D%3D");
        ResponseWrapper result = tourService.getAreaCode(param);

        assertThat(result.getResponse().getHeader().getResultCode()).isEqualTo("0000");
    }

    @Test
    public void getCategoryCodeTest() throws IOException {
        CategoryCodeRequest param = new CategoryCodeRequest();
        param.setMobileOS("ETC");
        param.setMobileApp("AppTest");
        //param.setServiceKey("lFVLzP9ISWyS58moYZ3pl9xPRb47EmwaVkDvgLlTtXi6UhpDpVaYPFE5U9dBLVw6gyM1gCgWDtDdZr3rkGDcGw%3D%3D");
        ResponseWrapper result = tourService.getCategoryCode(param);

        assertThat(result.getResponse().getBody().getItems().getItem().size()).isEqualTo(7);
    }

    @Test
    public void getAreaBasedListTest() throws IOException {
        AreaBasedListRequest param = new AreaBasedListRequest();
        param.setMobileOS("ETC");
        param.setMobileApp("AppTest");
        //param.setServiceKey("lFVLzP9ISWyS58moYZ3pl9xPRb47EmwaVkDvgLlTtXi6UhpDpVaYPFE5U9dBLVw6gyM1gCgWDtDdZr3rkGDcGw%3D%3D");
        ResponseWrapper result = tourService.getAreaBasedList(param);

        assertThat(result).isNotNull();
        assertThat(result.getResponse().getHeader().getResultCode()).isEqualTo("0000");
    }



}