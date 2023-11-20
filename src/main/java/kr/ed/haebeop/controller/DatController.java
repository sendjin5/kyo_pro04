package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Dat;
import kr.ed.haebeop.service.DatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/dat/*")
public class DatController {

    @Autowired
    private DatService datService;

    @Autowired
    HttpSession session;


    @PostMapping("insert")
    public String datInsert(HttpServletRequest request, Model model) throws Exception {
        Dat dat = new Dat();
        dat.setAuthor(request.getParameter("id"));
        dat.setContent(request.getParameter("content"));
        dat.setPar(Integer.parseInt(request.getParameter("par")));
        datService.insert(dat);
        return "redirect:/free/get?fno="+request.getParameter("par");
    }

    @GetMapping("delete")
    public ModelAndView datDelete(HttpServletRequest request, Model model) throws Exception {
        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";
        int dno = Integer.parseInt(request.getParameter("dno"));
        int fno = Integer.parseInt(request.getParameter("fno"));
        datService.delete(dno);
        model.addAttribute("fno", fno);

        ModelAndView mav = new ModelAndView();
        if(!sid.equals("admin")) {
            mav.setView(new RedirectView(request.getContextPath() + "/free/get"));
        } else {
            mav.setView(new RedirectView(request.getContextPath() + "/admin/freeGet"));
        }
        return mav;

    }

}
