package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.FileBoard;
import kr.ed.haebeop.domain.FileDTO;
import kr.ed.haebeop.service.FileService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/fileboard/*")
public class FileController {

    private static final Logger log = LoggerFactory.getLogger(FileController.class);

    String uploadPath;

    @Autowired
    private FileService fileService;

    @GetMapping("insert")
    public String fileUploadForm(){
        return "/fileboard/fileboardInsert";
    }

    @PostMapping("insert")
    public String fileUpload1(FileBoard fileBoard, List<MultipartFile> uploadFiles, HttpServletRequest request, Model model, RedirectAttributes rttr) throws Exception {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        fileBoard.setTitle(title);
        fileBoard.setContent(content);

        fileService.fileboardInsert(fileBoard);
        model.addAttribute("fileBoard", fileBoard);

        if (uploadFiles != null) {
            ServletContext application = request.getSession().getServletContext();
//            String realPath = application.getRealPath("/resources/upload");                                        // 운영 서버
            String realPath = "D:\\kyo\\kyo_pro04\\src\\main\\webapp\\resources\\upload";	      // 개발 서버
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            Date date = new Date();
            String dateFolder = sdf.format(date);

            File uploadPath = new File(realPath, dateFolder);
            if (!uploadPath.exists()) {
                uploadPath.mkdirs();
            }

            for (MultipartFile multipartFile : uploadFiles) {
                if (multipartFile.isEmpty()) {
                    continue;
                }

                String originalFilename = multipartFile.getOriginalFilename();
                UUID uuid = UUID.randomUUID();
                String uploadFilename = uuid.toString() + "_" + originalFilename;

                FileDTO fileDTO = new FileDTO();
                fileDTO.setPar(title);
                fileDTO.setSaveFolder(dateFolder);

                String fileType = multipartFile.getContentType();
                String[] fileTypeArr = fileType.split("/");
                fileDTO.setFileType(fileTypeArr[0]);

                fileDTO.setOriginNm(originalFilename);
                fileDTO.setSaveNm(uploadFilename);

                multipartFile.transferTo(new File(uploadPath, uploadFilename));     // 서버에 파일 업로드 수행
                fileService.filesInsert(fileDTO);                                  // DB 등록
            }

        }
        return "redirect:/fileboard/list";
    }

    @GetMapping("list")
    public String getFileList(Model model) throws Exception {
        List<FileBoard> fileboardList = fileService.fileboardList();
        model.addAttribute("fileboardList", fileboardList);
        return "/fileboard/fileboardList";
    }

    @GetMapping("get")
    public String getFileboard(int bno, Model model) throws Exception {
        FileBoard fileboard = fileService.fileboardGet(bno);
        String par = fileboard.getTitle();
        FileDTO file = fileService.fileListByPar(par);
        model.addAttribute("fileboard", fileboard);
        model.addAttribute("file", file);
        return "/fileboard/fileboardGet";
    }

    @GetMapping("delete")
    public String removeFileboard(int bno, HttpServletRequest req) throws Exception {
        FileBoard fileBoard = fileService.fileboardGet(bno);
        String path = req.getRealPath("/resources/upload");
        FileDTO files = fileService.fileListByPar(fileBoard.getTitle());
            File file = new File(path + "/" + files.getSaveFolder() + "/" + files.getSaveNm());
            if (file.exists()) { // 해당 파일이 존재하면
                file.delete(); // 파일 삭제
            }

        fileService.filesDeleteAll(fileBoard.getTitle());
        fileService.fileboardDel(bno);

        return "redirect:/fileboard/list";
    }
//
//    @GetMapping("update")
//    public String modifyFileboard(@RequestParam int postNo, Model model) throws Exception {
//        FileVO fileboard = fileService.getFilebord(postNo);
//        model.addAttribute("fileboard", fileboard);
//        return "/fileboard/fileboardUpdate";
//    }

}
