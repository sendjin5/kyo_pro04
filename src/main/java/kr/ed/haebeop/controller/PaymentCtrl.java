package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.Member;
import kr.ed.haebeop.domain.Payment;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.service.MemberService;
import kr.ed.haebeop.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/payment")
public class PaymentCtrl {

    @Autowired
    HttpSession session;

    @Autowired
    private MemberService memberService;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private LectureService lectureService;



    @GetMapping("payinsert.do")
    public String insertpay(@RequestParam int lno, HttpServletRequest req, Model model )throws Exception{
        String id = (String) session.getAttribute("sid");
        Member mem = memberService.memberGet(id);
        Lecture lecture = lectureService.lectureGet(lno);
        model.addAttribute("mem", mem);
        model.addAttribute("lecture", lecture);
        return "/payment/paymentInsert";
}


    @PostMapping("payinsert.do")
    public String insertpaypro(@ModelAttribute Payment payment, @ModelAttribute Member member, Model model )throws Exception{
        paymentService.insertpayment(payment);
        memberService.firepoint(member);
        return "redirect:/payment/paylistMem.do";
    }


    @GetMapping("paydelete.do")   
    public String payDelete(HttpServletRequest request, @RequestParam int payno, Model model) throws Exception{
        paymentService.deletepayment(payno);
        return "redirect:/lecture/list.do";
    }


}