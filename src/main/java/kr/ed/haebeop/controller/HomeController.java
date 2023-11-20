package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Free;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.service.FreeService;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.service.NoticeService;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
public class HomeController {

    @Autowired
    private LectureService lectureService;

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private FreeService freeService;

    @GetMapping(value = "/")
    public String index(Model model, HttpServletRequest request) throws Exception{

            String type = request.getParameter("type");
            String keyword = request.getParameter("keyword");
            int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

            Page page = new Page();
            page.setSearchType(type);
            page.setSearchKeyword(keyword);
            int total = lectureService.lectureCount(page);

            page.makeBlock(curPage, total);
            page.makeLastPageNum(total);
            page.makePostStart(curPage, total);

            model.addAttribute("type", type);
            model.addAttribute("keyword", keyword);
            model.addAttribute("page", page);
            model.addAttribute("curPage", curPage);

            List<Lecture> lectureList = lectureService.lectureList(page);
            List<Notice> noticeList = noticeService.noticeListForMain();
            List<Free> freeList = freeService.freeListForMain();

            model.addAttribute("lectureList", lectureList);
            model.addAttribute("noticeList", noticeList);
            model.addAttribute("freeList", freeList);

        return "/index";
    }

    @GetMapping(value = "/main")
    public String main(Model model){
        return "/include/main";
    }

    @GetMapping(value = "/sam")
    public String sam(Model model){
        return "/include/sam";
    }

    @GetMapping(value = "/sam2")
    public String sam2(Model model){
        return "/include/sam2";
    }
    /*@RequestMapping(value = "/company02", method = RequestMethod.GET)
    public String company02(Model model){
        return "/company/company02";
    }

    @RequestMapping(value = "/company03", method = RequestMethod.GET)
    public String company03(Model model){
        return "/company/company03";
    }

    @RequestMapping(value = "/event1", method = RequestMethod.GET)
    public String event1(Model model){
        return "/company/event1";
    }

    @RequestMapping(value = "/event2", method = RequestMethod.GET)
    public String event2(Model model){
        return "/company/event2";
    }*/

}
