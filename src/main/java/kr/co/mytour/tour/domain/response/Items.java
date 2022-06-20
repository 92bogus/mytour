package kr.co.mytour.tour.domain.response;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class Items {
    private List<Object> item;
}
