package com.shinho.tour.tour.domain.response;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Response<T> {
    private Header header;
    private Body<T> body;
}
