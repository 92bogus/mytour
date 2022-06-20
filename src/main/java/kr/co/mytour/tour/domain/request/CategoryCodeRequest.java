package kr.co.mytour.tour.domain.request;

import kr.co.mytour.tour.domain.request.RequestParam;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
public class CategoryCodeRequest extends RequestParam {
    private String contentTypeId;
    private String cat1;
    private String cat2;
    private String cat3;
}
