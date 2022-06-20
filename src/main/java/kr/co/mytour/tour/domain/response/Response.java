package kr.co.mytour.tour.domain.response;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Response {
    private Header header;
    private Body body;
}
