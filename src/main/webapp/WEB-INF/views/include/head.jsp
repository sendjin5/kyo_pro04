<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=dege"> <!-- 인터넷익스프로러로 접근시 엣지로 연결되게 함 -->
<meta http-equiv="Author" content="해법수학 콘텐츠 제작팀">
<meta http-equiv="Publisher" content="해법수학 콘텐츠 제작팀">
<meta http-equiv="Copyright" content="Copyright@grownjoy.co.kr">

<!-- 검색엔진 최적화(SEO) -->
<meta name="Subject" content="해법수학, 해법수학IT">
<meta name="Keyword" content="해법수학, 해법수학 IT, 교재, 이벤트">
<meta name="Description" content="해법수학는 교육 교재 정보, 커뮤니티, 게시판">
<meta name="Robots" content="index, follow">

<!-- 오픈 그래프(Open graph)-->
<meta property="og:type" content="website">
<meta property="og:title" content="해법수학">
<meta property="og:description" content="모두와 함께하며 소통으로 함께하는 기업">
<meta property="og:image" content="https://github.com/chunjae-luigi/project1/image/logo.png">
<meta property="og:url" content="https://github.com/chunjae-luigi/project1">

<!-- 트위터 -->
<meta name="twitter:card" content="picture">
<meta name="twitter:title" content="해법수학">
<meta name="twitter:description" content="앞선 생각으로 더 큰 미래의 교육을 준비하는 기업">
<meta name="twitter:image" content="https://github.com/chunjae-luigi/project1/image/logo.png">

<!-- 파비콘 설정 -->
<!-- 16x16, 24x24, 32x32, 48x48, 64x64, 96x96, 114x114, 128x128, 256x256 등을 활용-->
<!-- 표준 파비콘 -->
<link rel="shortcut icon" href="${path }/resources/image/common/logo_32.ico">
<!-- 애플 계열 모바일 -->
<link rel="apple-touch-icon-precomposed" href="${path }/resources/image/common/logo_64.png">
<!-- IE 계열 브라우저 -->
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="${path }/resources/image/common/logo_48.png">
<!-- 파이어폭스, 오페라, 또는 구형 크롬/사파리 -->
<link rel="icon" href="${path }/resources/image/common/logo_16.png" sizes="16x16">
<link rel="icon" href="${path }/resources/image/common/logo_32.png" sizes="32x32">
<link rel="icon" href="${path }/resources/image/common/logo_48.png" sizes="48x48">
<link rel="icon" href="${path }/resources/image/common/logo_64.png" sizes="64x64">

<!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>

    <script src="${path }/resources/js/jquery.dataTables.js"></script>
    <link rel="stylesheet" href="${path }/resources/css/jquery.dataTables.css">

    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="${path }/resources/image/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${path}/resources/css/styles.css" rel="stylesheet" />

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="${path}/resources/js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

    <link rel="stylesheet" href="${path }/resources/css/boardget.css">


<!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
<link rel="stylesheet" href="${path }/resources/css/google.css">
<link rel="stylesheet" href="${path }/resources/css/fonts.css">
<link rel="stylesheet" href="${path }/resources/css/ft.css">
<link rel="stylesheet" href="${path }/resources/css/common.css">



<!-- 불펌 방지 -->
<script>
    document.oncontextmenu = function() { return false; }
    document.ondragstart = function() { return false; }
    document.onselectstart = function() { return false; }
</script>