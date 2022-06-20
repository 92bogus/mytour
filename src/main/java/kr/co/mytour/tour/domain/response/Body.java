package kr.co.mytour.tour.domain.response;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class Body {
    private Items items;
    private int numOfRows;
    private int pageNo;
    private int totalCount;
}
