package com.shinho.tour.tour.domain.response;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Root<T> {
    Response<T> response;
}
