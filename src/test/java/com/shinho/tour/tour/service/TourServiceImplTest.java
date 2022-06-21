package com.shinho.tour.tour.service;

import com.shinho.tour.tour.domain.request.AreaCodeRequest;
import com.shinho.tour.tour.domain.response.AreaCode;
import com.shinho.tour.tour.domain.response.Root;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
class TourServiceImplTest {

    @Autowired
    TourServiceImpl tourService;

    @Test
    public void getAreaCodeTest() throws IOException {
        AreaCodeRequest param = new AreaCodeRequest();
        param.setAreaCode("1");

        Root<AreaCode> areaCode = tourService.getAreaCode(param);
        assertThat(areaCode.getResponse().getHeader().getResultCode()).isEqualTo("0000");
        assertThat(areaCode.getResponse().getBody().getItems().getItem().size()).isEqualTo(10);
    }

//    @Test
//    public void getAreaCodeTest() throws IOException {
//        AreaCodeRequest param = new AreaCodeRequest();
//        param.setMobileOS("ETC");
//        param.setMobileApp("AppTest");
//        //param.setServiceKey("lFVLzP9ISWyS58moYZ3pl9xPRb47EmwaVkDvgLlTtXi6UhpDpVaYPFE5U9dBLVw6gyM1gCgWDtDdZr3rkGDcGw%3D%3D");
//        Root<AreaCode> result = tourService.getAreaCode(param);
//
//        assertThat(result.getResponse().getHeader().getResultCode()).isEqualTo("0000");
//    }
//
//    @Test
//    public void getCategoryCodeTest() throws IOException {
//        CategoryCodeRequest param = new CategoryCodeRequest();
//        param.setMobileOS("ETC");
//        param.setMobileApp("AppTest");
//        //param.setServiceKey("lFVLzP9ISWyS58moYZ3pl9xPRb47EmwaVkDvgLlTtXi6UhpDpVaYPFE5U9dBLVw6gyM1gCgWDtDdZr3rkGDcGw%3D%3D");
//        Root result = tourService.getCategoryCode(param);
//
//        assertThat(result.getResponse().getBody().getItems().getItem().size()).isEqualTo(7);
//    }
//
//    @Test
//    public void getAreaBasedListTest() throws IOException {
//        AreaBasedListRequest param = new AreaBasedListRequest();
//        param.setMobileOS("ETC");
//        param.setMobileApp("AppTest");
//        //param.setServiceKey("lFVLzP9ISWyS58moYZ3pl9xPRb47EmwaVkDvgLlTtXi6UhpDpVaYPFE5U9dBLVw6gyM1gCgWDtDdZr3rkGDcGw%3D%3D");
//        Root result = tourService.getAreaBasedList(param);
//
//        assertThat(result).isNotNull();
//        assertThat(result.getResponse().getHeader().getResultCode()).isEqualTo("0000");
//    }



}