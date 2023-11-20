package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.FileBoard;
import kr.ed.haebeop.domain.FileDTO;
import kr.ed.haebeop.persistence.FilesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FilesServiceImpl implements FileService{

    @Autowired
    private FilesMapper filesMapper;

    @Override
    public FileDTO fileListByPar(String par) throws Exception {
        return filesMapper.fileListByPar(par);
    }

    @Override
    public void filesInsert(FileDTO fileDTO) throws Exception {
        filesMapper.filesInsert(fileDTO);
    }

    @Override
    public void filesDeleteAll(String par) throws Exception {
        filesMapper.filesDeleteAll(par);
    }

    @Override
    public List<FileBoard> fileboardList() throws Exception {
        return filesMapper.fileboardList();
    }

    @Override
    public FileBoard fileboardGet(int bno) throws Exception {
        return filesMapper.fileboardGet(bno);
    }

    @Override
    public void fileboardInsert(FileBoard fileBoard) throws Exception {
        filesMapper.fileboardInsert(fileBoard);
    }

    @Override
    public void fileboardDel(int bno) throws Exception {
        filesMapper.fileboardDel(bno);
    }
}