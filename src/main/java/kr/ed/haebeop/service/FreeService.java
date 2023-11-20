package kr.ed.haebeop.service;


import kr.ed.haebeop.domain.Free;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface FreeService {
    public List<Free> freeList(Page page) ;
    public List<Free> freeListForMain() ;
    public int count(Page page) ;
    public Free freeGet(int fno) ;
    public void insert(Free free) ;
    public void update(Free free) ;
    public void delete(int fno) ;
}
