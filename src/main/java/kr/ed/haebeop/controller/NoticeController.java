package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.service.NoticeService;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @GetMapping(value = "list")
    public String noticeList(HttpServletRequest request, Model model) throws Exception{
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = noticeService.count(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Notice> noticeList = noticeService.noticeListPro(page);
        System.out.println("카운터 : " + noticeService.count(page));

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);
        model.addAttribute("noticeList", noticeList);
        return "/notice/noticeList";
    }

    @GetMapping("get")
    public String noticeGet(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        Notice notice = noticeService.noticeGet(no);
        model.addAttribute("notice", notice);
       return "/notice/noticeGet";

    }
    @GetMapping("insert")
    public String noticeInsert(HttpServletRequest request, Model model) throws Exception{
        return "/notice/noticeInsert";
    }
    @PostMapping("insert")
    public String noticeInsertpro(HttpServletRequest request, Model model) throws Exception{
        Notice notice = new Notice();
        notice.setTitle(request.getParameter("title"));
        notice.setContent(request.getParameter("content"));
        noticeService.insert(notice);
        return "redirect: list";
    }

    @GetMapping("update")
    public String noticeUpdate(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        Notice notice = noticeService.noticeGet(no);
        model.addAttribute("notice", notice);
        return "/notice/noticeUpdate";
    }

    @PostMapping("update")
    public String noticeUpdatepro(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        Notice notice = new Notice();
        notice.setNo(no);
        notice.setTitle(request.getParameter("title"));
        notice.setContent(request.getParameter("content"));
        noticeService.update(notice);
        return "redirect: list";
    }

    @GetMapping("delete")
    public String noticeDelete(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        noticeService.delete(no);
        return "redirect: list";
    }

}
