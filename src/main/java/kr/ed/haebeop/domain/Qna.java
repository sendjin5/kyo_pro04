package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Qna {
    private int qno;
    private String title;
    private String content;
    private String author;
    private String regdate;
    private int visited = 0;
    private int lev = 0;
    private int par = 0;
}
