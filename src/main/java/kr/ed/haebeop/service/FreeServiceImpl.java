package kr.ed.haebeop.service;


import kr.ed.haebeop.domain.Free;
import kr.ed.haebeop.persistence.FreeMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FreeServiceImpl implements FreeService {

    @Autowired
    private FreeMapper freemapper;

    @Override
    public List<Free> freeList(Page page)  { return freemapper.freeList(page); }

    @Override
    public List<Free> freeListForMain()  { return freemapper.freeListForMain(); }

    @Override
    public int count(Page page)  {
        return freemapper.count(page);
    }

    @Override
    public Free freeGet(int fno)  {
        return freemapper.freeGet(fno);
    }

    @Override
    public void insert(Free free)  {
        freemapper.insert(free);
    }

    @Override
    public void delete(int fno)  {
        freemapper.delete(fno);
    }

    @Override
    public void update(Free free)  {
        freemapper.update(free);
    }
}