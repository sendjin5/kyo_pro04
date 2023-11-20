package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Dat;
import kr.ed.haebeop.persistence.DatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DatServiceImpl implements DatService{

    @Autowired
    private DatMapper datmapper;

    @Override
    public List<Dat> datList() {
        return datmapper.datList();
    }

    @Override
    public void insert(Dat dat) {
        datmapper.insert(dat);
    }

    @Override
    public void update(Dat dat) {
        datmapper.update(dat);
    }

    @Override
    public void delete(int dno) { datmapper.delete(dno); }
}
