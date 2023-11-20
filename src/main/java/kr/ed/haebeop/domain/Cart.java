package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private int cno;        //기본키
    private int lsno;       //lesson과 연동
    private String memid;
    private String title;
    private String teacher;
    private String img;
    private int price;
    private String regdate;
}
