<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>HEABEOP::강의</title>
    <jsp:include page="../include/head.jsp" />

    <link rel="stylesheet" href="${path }/resources/css/sub.css">
    <link rel="stylesheet" href="${path }/resources/css/lecture.css">
</head>
<body>
<jsp:include page="../include/header.jsp" />

<section class="page-title bg-02">
    <div class="container">
        <div class="columns">
            <div class="column is-12">
                <div class="block has-text-centered">
                    <h1 class="is-capitalize text-lg font-happy">강의리스트</h1>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 상단 강의 소개-->
<div class="bg-dark py-5">
    <div class="container px-5">
        <div class="row gx-5 justify-content-center">
            <div class="col-lg-6">
                <img src="${path}/resources/image/lecture/lect05.png">
            </div>
            <div class="col-lg-6" style="text-align: left;">
                <p>과목 : ${subject.title } </p>
                <h1 class="display-5 fw-bolder text-black mb-2">${lecture.title }</h1>
                <h3 class="lead text-black-50 mb-4">${lecture.subTitle }</h3>
                <h3 class="lead text-black-50 mb-4">${teacher.nm }</h3>
                <a class="btn btn-primary btn-lg px-4 me-sm-3" id="vvv" href="${path }/resources/image/lecture/lectvideo01.mp4" target="_blank" >강의 맛보기</a>
            </div>
        </div>
    </div>
</div>

<!-- Page content-->
<div class="container mt-5">
    <div class="row">
        <div class="col-lg-8">
            <!-- 내부탭 -->
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <button class="nav-link active" id="tab-content" data-bs-toggle="tab" data-bs-target="#tab-content" type="button" role="tab" aria-selected="true">강의내용</button>
                    <button class="nav-link" id="tab-curri" data-bs-toggle="tab" data-bs-target="#tab-curri" type="button" role="tab" aria-selected="false">커리큘럼</button>
                </div>
            </nav>
            <!-- 강의 내용 -->
            <article id="lect_con">
                <header class="mb-4">
                    <h1 class="fw-bolder mb-1">${lecture.title }</h1>
                    <div class="text-muted fst-italic mb-2">${lecture.subTitle }</div>
                </header>
                <section class="mb-5">
                    ${lecture.content }

                        <!-- 교재 추가 경로 변경 해야함 //비 -->
                        <div>강의 교재 </div>
                        <div><img src="${path}/resources/image/lecture/booksample.jpg"></div>
                </section>
            </article>

            <c:if test="${sid eq 'admin'}">
                <a href="${path}/lecture/lectDelete.do?lno=${lecture.lno}" class="btn btn-primary" id="button-search2" >삭제하기</a>
            </c:if>

        </div>
        <!-- 우측 탭-->
        <div class="col-lg-4" id="lect_tab">
            <div class="card mb-4">
                <div class="card-header">
                    <h2>${lecture.cost }원</h2>
                    <a href="${path}/payment/payinsert.do?lno=${lecture.lno }" class="btn btn-primary" id="button-search" >바로 수강신청 하기</a>
                </div>
                <div class="card-body">
                    <div class="input-group">
                        <ul>
                            <li><span>지식 공유자 :</span> 000</li>
                            <li>난이도 : 입문</li>
                            <li>1개의 코딩 연습</li>
                            <li>수강기한 : 무제한</li>
                            <li>수료증 : 발급</li>
                        </ul>
                        <div>지식공유자 답변이 제공되는 강의입니다</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<jsp:include page="../include/footer.jsp" />


<!-- 우측탭 스크롤에 맞게 이동-->
<script>
    window.addEventListener("scroll", function() {
        const scrollingDiv = document.querySelector(".col-lg-4");
        const scrollY = window.scrollY;
        if (scrollY >= 500) {
            // 스크롤 위치가 500px 이상이면 div를 상단에 고정
            scrollingDiv.style.top = 100 + scrollY + "px";
        } else {
            // 스크롤 위치가 500px 미만이면 초기 위치로 이동
            scrollingDiv.style.top = "500px";
        }
    });
</script>
<script>
    // tab click 하면 지정 구역으로 이동
    document.addEventListener('DOMContentLoaded', function() {
        const lectureTab = document.getElementById('tab-content');
        const lectureContent = document.getElementById('lect_con');
        lectureTab.addEventListener('click', function() {
            const scrollPosition = lectureContent.offsetTop - 100;
            window.scrollTo({ top: scrollPosition, behavior: 'smooth' });
        });
    });
    document.addEventListener('DOMContentLoaded', function() {
        const lectureTab = document.getElementById('tab-curri');
        const lectureContent = document.getElementById('lect_list');
        lectureTab.addEventListener('click', function() {
            const scrollPosition = lectureContent.offsetTop - 100;
            window.scrollTo({ top: scrollPosition, behavior: 'smooth' });
        });
    });
    document.addEventListener('DOMContentLoaded', function() {
        const lectureTab = document.getElementById('tab-review');
        const lectureContent = document.getElementById('lect_review');
        lectureTab.addEventListener('click', function() {
            const scrollPosition = lectureContent.offsetTop - 100;
            window.scrollTo({ top: scrollPosition, behavior: 'smooth' });
        });
    });
</script>
<!-- 동영상 열 때 크기 지정 -->
<%-- 동영상 경로는 임시로 해놓은거라 최종 때 수정해야함 //비--%>
<%-- <script>
    document.getElementById('vvv').addEventListener('click', function() {
        window.open('${path }/resources/image/common/videosample.mp4', 'Video Window', 'width=720, height=540');
    });
</script>--%>
</body>
</html>