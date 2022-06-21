package com.shinho.tour.tour.domain.response;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class Items<T> {
    private List<T> item;
}
