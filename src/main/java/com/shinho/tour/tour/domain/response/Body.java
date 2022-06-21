package com.shinho.tour.tour.domain.response;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Body<T> {
    private Items<T> items;
    private int numOfRows;
    private int pageNo;
    private int totalCount;
}
