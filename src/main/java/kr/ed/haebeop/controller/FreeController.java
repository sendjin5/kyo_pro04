package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Dat;
import kr.ed.haebeop.domain.Free;
import kr.ed.haebeop.service.DatService;
import kr.ed.haebeop.service.FreeService;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;
import java.util.UUID;


@Controller
@RequestMapping("/free/*")
public class FreeController {

    @Autowired
    private FreeService freeService;

    @Autowired
    private DatService datService;

    @Autowired
    HttpSession session;


    @GetMapping("list")		//free/list
    public String freeList(HttpServletRequest request, Model model) throws Exception{

        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = freeService.count(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Free> freeList = freeService.freeList(page);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);
        model.addAttribute("freeList", freeList);
        return "/free/freeList";
    }

    @GetMapping("get")	//free/get?fno=1
    public String FreeGet(HttpServletRequest request, Model model) {
        int fno = Integer.parseInt(request.getParameter("fno"));
        Free dto = freeService.freeGet(fno);
//        List<Dat> datList = datService.datList(fno);
//        model.addAttribute("datList", datList);
        model.addAttribute("dto", dto);
        model.addAttribute("fno", fno);
        System.out.println("dto : " + dto);
//        System.out.println("datList : " + datList);
        System.out.println("fno : " + fno);
        return "/free/freeGet";
    }

    @GetMapping("insert")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/free/freeInsert";
    }

    @PostMapping("insert")
    public String freeInsert(HttpServletRequest request, Model model) throws Exception {
        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";
        Free dto = new Free();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dto.setAuthor(sid);
        freeService.insert(dto);
        return "redirect:/free/list";
    }

    @GetMapping("delete")
    public String freeDelete(HttpServletRequest request, Model model) throws Exception {
        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";
        int fno = Integer.parseInt(request.getParameter("fno"));
        freeService.delete(fno);
        if(!sid.equals("admin")) {
            return "redirect:/free/list";
        } else {
            return "redirect:/admin/FreeListAdmin";
        }
    }

    @GetMapping("update")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int fno = Integer.parseInt(request.getParameter("fno"));
        Free dto = freeService.freeGet(fno);
        model.addAttribute("dto", dto);
        return "/free/freeUpdate";
    }


    @PostMapping("update")
    public String freeupdate(HttpServletRequest request, Model model) {
        int fno = Integer.parseInt(request.getParameter("fno"));
        Free dto = new Free();
        dto.setFno(fno);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
//        freeService.freeGet(dto);
        return "redirect:/free/list";
    }


    //ckeditor를 이용한 이미지 업로드
    @PostMapping(value="imageUpload")
    public void imageUpload(HttpServletRequest request, HttpServletResponse response,
                            MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception{
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        OutputStream out = null;
        PrintWriter printWriter = null;

        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        try{
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();

            //이미지 경로 생성
            String path = request.getRealPath("/resource/uploadCkImage/");
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            System.out.println("path:"+path);	// 이미지 저장경로 console에 확인
            //해당 디렉토리 확인
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/pro04_war/free/ckImgSubmit?uid=" + uid + "&fileName=" + fileName; // 작성화면

            // 업로드시 메시지 출력
            printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
            printWriter.flush();

        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if(out != null) { out.close(); }
                if(printWriter != null) { printWriter.close(); }
            } catch(IOException e) { e.printStackTrace(); }
        }
        return;
    }

    //ckeditor를 이용한 서버에 전송된 이미지 뿌려주기
    @RequestMapping(value="ckImgSubmit")
    public void ckSubmit(@RequestParam(value="uid") String uid
            , @RequestParam(value="fileName") String fileName
            , HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        //서버에 저장된 이미지 경로
        String path = request.getRealPath("/resource/uploadCkImage/");
        System.out.println("path:"+path);
        String sDirPath = path + uid + "_" + fileName;

        File imgFile = new File(sDirPath);

        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if(imgFile.isFile()){
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;

            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;

            try{
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();

                while((readByte = fileInputStream.read(buf)) != -1){
                    outputStream.write(buf, 0, readByte);
                }

                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();

            }catch(IOException e){
                e.printStackTrace();
            }finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }
}
