package kr.co.mytour.tour.domain.request;

import kr.co.mytour.tour.domain.request.RequestParam;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AreaCodeRequest extends RequestParam {
    private String areaCode;
}
