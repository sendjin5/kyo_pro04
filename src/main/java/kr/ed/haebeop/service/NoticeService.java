package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.util.Page;

import java.util.List;


public interface NoticeService {
    public List<Notice> noticeList() ;
    public List<Notice> noticeListForMain() ;
    public Notice noticeGet(int no) ;
    public void insert(Notice notice) ;
    public void update(Notice notice) ;
    public void delete(int no) ;
    public List<Notice> noticeListPro(Page page) ;
    public int count(Page page) ;
}
