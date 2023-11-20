package kr.ed.haebeop.service;


import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.persistence.NoticeMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService{

    @Autowired
    private NoticeMapper noticemapper;

    @Override
    public List<Notice> noticeList()  {
        return noticemapper.noticeList();
    }

    @Override
    public List<Notice> noticeListForMain()  {
        return noticemapper.noticeListForMain();
    }

    @Override
    public Notice noticeGet(int no)  {
        return noticemapper.noticeGet(no);
    }

    @Override
    public void insert(Notice notice)  {
        noticemapper.insert(notice);
    }

    @Override
    public void update(Notice notice)  {
        noticemapper.update(notice);
    }

    @Override
    public void delete(int no)  { noticemapper.delete(no); }

    @Override
    public List<Notice> noticeListPro(Page page)  {
        return noticemapper.noticeListPro(page);
    }

    @Override
    public int count(Page page)  {
        return noticemapper.count(page);
    }
}
