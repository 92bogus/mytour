package kr.co.mytour.tour.domain.response;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
public class Header {
    private String responseTime;
    private String resultCode;
    private String resultMsg;
}
