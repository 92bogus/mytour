package com.shinho.tour.tour.domain.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CategoryCodeRequest extends RequestParam {
    private String contentTypeId;
    private String cat1;
    private String cat2;
    private String cat3;
}
