package kr.ed.haebeop.config;
//주입 설정 및 빈 등록 파일 : ApplicationConfig.java

import kr.ed.haebeop.service.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

//컨트롤러나 서비스, 맴퍼, 레포시토리에서 사용할 Bean을 등록
@Configuration
@ComponentScan(basePackages = "kr.ed.haebeop")
public class ApplicationConfig {
    @Bean
    public TestService testService(){ return new TestServiceImpl(); }
    @Bean
    public MemberService memberService(){ return new MemberServiceImpl(); }
    @Bean
    public FreeService freeService(){ return new FreeServiceImpl(); }
    @Bean
    public NoticeService noticeService(){ return new NoticeServiceImpl(); }
    @Bean
    public DatService datService(){ return new DatServiceImpl(); }
    @Bean
    public FileService fileService(){ return new FilesServiceImpl(); }
    @Bean
    public LectureService lectureService(){ return new LectureServiceImpl();}
}