package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.Member;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.service.MemberService;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/lecture/*")
public class LectureCtrl {

    @Autowired
    HttpSession session;

    @Autowired
    private LectureService lectureService;

    @Autowired
    private MemberService memberService;

    //회원이 보는 강의 리스트
    @GetMapping("list.do")
    public String lectureList(HttpServletRequest request, Model model) throws Exception{
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
        model.addAttribute("lectureList", lectureList);

        return "/lecture/lectList";
    }

    //회원의 강의 상세보기
    @GetMapping("get.do")
    public String lectureget(HttpServletRequest request, Model model) throws Exception{
        int lno = Integer.parseInt(request.getParameter("lno"));

        Lecture lecture = lectureService.lectureGet(lno);
        Member teacher = memberService.memberGet(lecture.getTeacherId());

        model.addAttribute("teacher", teacher);
        model.addAttribute("lecture", lecture);
        model.addAttribute("lno", lno);

        return "/lecture/lectGet";

    }


    @GetMapping("/lectAdd.do")   
    public String lectureAdd(Model model) throws Exception {
        return "/lecture/lectAdd";
    }

    @PostMapping("lectAdd.do")  
    public String lectureInsertpro(HttpServletRequest request, Model model, MultipartFile thumbnail, MultipartFile lvideo, MultipartFile bthumbnail) throws Exception{
        String msg = "";

        ServletContext application = request.getSession().getServletContext();
        //String realPath = application.getRealPath("/resources/upload");       // 운영 서버
        String realPath = "D:\\kyo\\pro\\pro04\\src\\main\\webapp\\resources\\upload";	      // 개발 서버

        Lecture lecture = new Lecture();
        lecture.setTitle(request.getParameter("title"));
        lecture.setSubTitle(request.getParameter("subTitle"));
        lecture.setContent(request.getParameter("content"));
        lecture.setTeacherId(request.getParameter("teacherId"));
        lecture.setBookname(request.getParameter("bookname"));
        lecture.setBthumbnail(request.getParameter("bthumnail"));
        lecture.setLectureType(Integer.parseInt(request.getParameter("lectureType")));
        lecture.setStudentCnt(Integer.parseInt(request.getParameter("studentCnt")));
        lecture.setCost(Integer.parseInt(request.getParameter("cost")));
        lecture.setSno(Integer.parseInt(request.getParameter("sno")));

        if(thumbnail != null) {
            String originalThumbnailname = thumbnail.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String uploadThumbnailname = uuid.toString() + "_" + originalThumbnailname;
            thumbnail.transferTo(new File(realPath, uploadThumbnailname));     //파일 등록
            lecture.setThumbnail(uploadThumbnailname);
        }
        if(lvideo != null) {
            String originalFilename = lvideo.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String uploadFilename = uuid.toString() + "_" + originalFilename;
            lvideo.transferTo(new File(realPath, uploadFilename));     //파일 등록
            lecture.setLvideo(uploadFilename);
        }
        if(bthumbnail != null) {
            String originalFilename = bthumbnail.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String uploadFilename = uuid.toString() + "_" + originalFilename;
            bthumbnail.transferTo(new File(realPath, uploadFilename));     //파일 등록
            lecture.setBthumbnail(uploadFilename);
        }

        lectureService.lectureAdd(lecture);
        return "redirect:/lecture/list.do";
    }
    
    
    @GetMapping("lectUpdate.do")    
    public String lectureUpdate(HttpServletRequest request, Model model) throws Exception{
        int lno = Integer.parseInt(request.getParameter("lno"));
        Lecture lecture = lectureService.lectureGet(lno);
        model.addAttribute("lecture", lecture);
        return "/lecture/lectUpdate";
    }
    @PostMapping("lectUpdate.do")     
    public String lectureUpdatepro(HttpServletRequest request, Model model) throws Exception{

        int lno = Integer.parseInt(request.getParameter("lno"));
        ServletContext application = request.getSession().getServletContext();

        //String realPath = application.getRealPath("/resources/upload");                   //운영 서버
        String realPath = "D:\\kyo\\pro\\pro04\\src\\main\\webapp\\resources\\upload";	      // 개발 서버

        Lecture lecture = new Lecture();
        lecture.setLno(lno);
        lecture.setTitle(request.getParameter("title"));
        lecture.setSubTitle(request.getParameter("subTitle"));
        lecture.setContent(request.getParameter("content"));
        lecture.setTeacherId(request.getParameter("teacherId"));
        lecture.setLectureType(Integer.parseInt(request.getParameter("lectureType")));
        lecture.setStudentCnt(Integer.parseInt(request.getParameter("studentCnt")));
        lecture.setCost(Integer.parseInt(request.getParameter("cost")));
        lecture.setBookname(request.getParameter("bookname"));
        lecture.setBthumbnail(request.getParameter("bthumnail"));
        lecture.setSno(Integer.parseInt(request.getParameter("sno")));

        lectureService.lectureUpdate(lecture);
        return "redirect:/lecture/lectList.do";
    }

    @GetMapping("lectDelete.do")   
    public String lectureDelete(HttpServletRequest request, Model model) throws Exception{
        int lno = Integer.parseInt(request.getParameter("lno"));
        lectureService.lectureDelete(lno);
        return "redirect:/lecture/list.do";
    }


}
