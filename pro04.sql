USE haebeop;
CREATE DATABASE haebeop
DROP DATABASE haebeop

-- member
CREATE TABLE member(
                       mno INT AUTO_INCREMENT PRIMARY KEY,					-- 회원 번호 : 자동 발생
                       id VARCHAR(20) UNIQUE KEY,								-- 회원 아이디
                       pw VARCHAR(500) NOT NULL,								-- 회원 비밀번호
                       nm VARCHAR(50) NOT NULL,								-- 회원 이름
                       email VARCHAR(50) NOT NULL,							-- 회원 이메일
                       tel VARCHAR(20) NOT NULL,								-- 회원 전화번호
                       addr1 VARCHAR(200),										-- 회원 주소
                       addr2 VARCHAR(100),										-- 회원 상세 주소
                       postcode VARCHAR(10),									-- 회원 우편 번호
                       regDate DATETIME DEFAULT CURRENT_TIMESTAMP(),	-- 회원 등록일
                       birth DATE,													-- 회원 생일
                       pt INT DEFAULT 0,											-- 회원 포인트
                       visited INT DEFAULT 0,									-- 회원 방문수
                       useYn BOOLEAN DEFAULT TRUE,							-- 회원 사용 여부
                       grade INT DEFAULT 2										-- 회원 등급 [ 0 : 관리자, 1 : 선생님, 2 : 일반사용자]
);


-- board
CREATE TABLE board(
      bno INT PRIMARY KEY AUTO_INCREMENT,   -- (게시글 번호) 자동 발생
      boardType varchar(15) NOT NULL,   -- 게시글 타입: notice, faq, forum, fileboard
      title VARCHAR(200) NOT NULL,   -- (게시글 제목)
      content VARCHAR(1000),   -- (게시글 내용)
      author VARCHAR(16) NOT NULL,   -- (작성자)
      relations VARCHAR(20) DEFAULT 'no', -- 관련 테이블. forum - dat 테이블, fileboard - file 테이블
      regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (등록일)
      visited INT DEFAULT 0   -- (조회수)
);

-- notice
CREATE TABLE notice(
       no INT PRIMARY KEY AUTO_INCREMENT,   -- (게시글 번호) 자동 발생
       title VARCHAR(200) NOT NULL,   -- (게시글 제목)
       content VARCHAR(1000),   -- (게시글 내용)
       regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (등록일)
       visited INT DEFAULT 0   -- (조회수)
);

INSERT INTO notice VALUES(DEFAULT, '제목1', '내용1', DEFAULT, DEFAULT);
commit

-- datgeul
CREATE TABLE dat(
        dno INT PRIMARY KEY AUTO_INCREMENT,   -- (댓글번호) 자동발생
        author VARCHAR(16) NOT NULL,   -- (댓글 작성자)
        content VARCHAR(1000) NOT NULL,   -- (댓글 내용)
        regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (댓글 등록일)
        par INT(11) NOT NULL   -- (해당 게시글 번호)
);

-- qna
CREATE TABLE qna(
        qno INT PRIMARY KEY AUTO_INCREMENT,   -- (문의번호) 자동발생
        title VARCHAR(100) NOT NULL,   -- (문의 제목)
        content VARCHAR(1000) NOT NULL,   -- (문의 내용)
        author VARCHAR(16),   -- (문의 작성자)
        regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),   -- (문의 등록)
        cnt INT DEFAULT 0,   -- (조회수)
        lev INT DEFAULT 0, -- 질문(0), 답변(1)
        par INT DEFAULT 0	-- 부모 글번호 -> 질문(자신 레코드의 qno), 답변(질문의 글번호)
);



-- 강의시스템 (온&오프라인)
CREATE TABLE lecture(
            lno INT AUTO_INCREMENT PRIMARY KEY,			-- 강의 번호 : 자동증가
            title VARCHAR(150) NOT NULL,					-- 강의 제목
            subTitle VARCHAR(500) NOT NULL,				-- 강의 소제목
            content VARCHAR(2000) NOT NULL,				-- 강의 내용
            lectureType INT NOT NULL,						-- 강의 타입 [ 온라인 : 0, 오프라인 : 1 ]
            studentCnt INT NOT NULL, 						-- 강의 수강 인원
            startDate TIMESTAMP,								-- 강의 시작 기간 - 오프라인 사용
            endDate TIMESTAMP,								-- 강의 종료 기간 - 오프라인 사용
            daily VARCHAR(200),								-- 강의 하루 일정 - 오프라인 사용
            teacherId VARCHAR(20),				-- 강의 담당 선생 아이디
            teacherNm VARCHAR(20) NOT NULL,
            thumbnail VARCHAR(100),                	-- 강의 썸네일
            lvideo VARCHAR(100)  ,    						-- 샘플영상
            sno INT NOT NULL, 								-- 과목
            cost INT NOT NULL, 								-- 강의가격
            bookname VARCHAR(150),							-- 교재명
            bthumbnail VARCHAR(100)    					-- 교재 썸네일
);



CREATE TABLE files(
          fno INT PRIMARY KEY AUTO_INCREMENT,   							-- 파일번호: 자동발생
          par VARCHAR(1000) NOT NULL,   													-- 해당 게시글 번호
          saveFolder VARCHAR(1000) NOT NULL,								-- 파일 저장 폴더
          originNm VARCHAR(500) NOT NULL,									-- 파일 원래 이름
          saveNm VARCHAR(500) NOT NULL,										-- 파일 저장 이름
          fileType VARCHAR(100) NOT NULL,									-- 파일 확장자
          uploadDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP	-- 파일 업로드 일자
);

CREATE TABLE fileboard(
          bno INT PRIMARY KEY AUTO_INCREMENT,   							-- 게시글 번호 : 자동 발생
          title VARCHAR(200) NOT NULL,   									-- 게시글 제목
          content VARCHAR(1000),   											-- 게시글 내용
          regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   	-- 등록일
          visited INT DEFAULT 0   											-- 조회수
);


INSERT INTO MEMBER VALUES(DEFAULT, 'admin', '$2a$10$oS1.3wpbnpIanIW4RoXxSOea/vGIijBMpLUBxZqurQqNjjMiJHgGa', 'admin', 'admin@haebeop.ed.kr', '010-2121-2121', '1', '1', '1', DEFAULT, null, 100000, DEFAULT, DEFAULT, 0);
SELECT * FROM files
DROP TABLE files
DROP TABLE fileboard
SELECT * FROM fileboard


CREATE TABLE payment(
        payno INT AUTO_INCREMENT PRIMARY KEY,		    -- 결제 번호 : 자동증가
        id VARCHAR(20) NOT NULL,                        -- 회원 아이디
        pno int default 0,                              -- 강의 공유번호
        plec VARCHAR(100) NOT NULL,                     -- 강의 이름
        tecid VARCHAR(100) ,                    -- 선생님 아이디
        tecnm VARCHAR(100) NOT NULL,                    -- 선생님 이름
        booknm VARCHAR(100),                            -- 책 교재명
        pmethod VARCHAR(10),                            -- 결제 방법 - [1:신용카드 | 2:체크카드 | 3:계좌이체]
        pcom VARCHAR(100),                              -- 결제 대행사
        pnum VARCHAR(100),                              -- 결제카드(계좌)번호
        price INT DEFAULT 1000,                         -- 결제 금액
        amount INT DEFAULT 1,                           -- 결제 수량
        status INT DEFAULT 0,                           -- 배송상태 - [0:결제완료 | 1:결제완료 | 2:결제취소]
        resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP()   -- 결제 등록일
);