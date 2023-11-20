package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.FileBoard;
import kr.ed.haebeop.domain.FileDTO;

import java.util.List;

public interface FileService {
    //fileDTO
    public FileDTO fileListByPar(String par) throws Exception;
    public void filesInsert(FileDTO fileDTO) throws Exception;
    public void filesDeleteAll(String par) throws Exception;

    //fileboard
    public List<FileBoard> fileboardList() throws Exception;
    public FileBoard fileboardGet(int bno) throws Exception;
    public void fileboardInsert(FileBoard fileBoard) throws Exception;
    public void fileboardDel(int bno) throws Exception;

}
