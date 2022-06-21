package com.shinho.tour.tour.domain.response;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Header {
    private String responseTime;
    private String resultCode;
    private String resultMsg;
}
