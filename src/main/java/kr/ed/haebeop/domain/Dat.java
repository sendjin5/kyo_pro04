package kr.ed.haebeop.domain;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Dat {
    private int dno;
    private String author;
    private String content;
    private String regdate;
    private int par;
}
