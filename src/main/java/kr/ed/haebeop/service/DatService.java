package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Dat;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface DatService {
    public List<Dat> datList();
    public void insert(Dat dat);
    public void update(Dat dat);
    public void delete(int dno);
}
