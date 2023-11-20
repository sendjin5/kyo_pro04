package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileDTO {
    private int fno;
    private String par;
    private String saveFolder;
    private String originNm;
    private String saveNm;
    private String fileType;
    private String uploadDate;
}
