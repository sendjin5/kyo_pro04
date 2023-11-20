<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Haebeop</title>
    <link rel="stylesheet" href="${path }/resources/css/main.css">

    <jsp:include page="/WEB-INF/views/include/head.jsp" />

</head>


<body id="page-top">
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<!-- Masthead-->
<header class="masthead">
    <div class="container">
        <div class="masthead-subheading">메인페이지</div>
        <div class="masthead-heading text-uppercase">해법학원</div>
        <a class="btn btn-primary btn-xl text-uppercase" href="#columns">Board More</a>
    </div>
</header>

<div class="container-fluid mb-5">
    <div class="container">
        <div class="text-center pb-2">
            <p class="section-title px-5"><span class="px-2">여러분을 위한 강의</span></p>
            <h1 class="mb-4">마지막 기회를 놓치지 마세요.</h1>
        </div>
        <div class="row">
            <c:forEach var="lec" items="${lectureList}">
                <div class="col-lg-4">
                    <div class="card border-0 bg-light shadow-sm pb-2">
                        <c:choose>
                            <c:when test="${!empty thumbnail}">
                                <img class="card-img-top mb-2" src="${path }/resources/upload/${lecture.thumbnail }" alt="강의썸네일" />
                            </c:when>
                            <c:otherwise>
                                <img class="card-img-top mb-2" src="${path }/resources/image/lecture/dummy.png" alt="샘플썸네일"/>
                            </c:otherwise>
                        </c:choose>
                        <div class="card-body text-center">
                            <h4 class="card-title">${lec.lect_tit}</h4>
                            <p class="card-text">
                                    ${lec.subTitle}<br/>
                            </p>
                        </div>
                        <div class="card-footer bg-transparent py-4 px-5">
                            <div class="row border-bottom">
                                <div class="col-6 py-1 text-right border-right">
                                    <strong>교육 과목</strong>
                                </div>
                                <div class="col-6 py-1">${lec.sub_tit}</div>
                            </div>
                            <div class="row border-bottom">
                                <div class="col-6 py-1 text-right border-right">
                                    <strong>교육 강사</strong>
                                </div>
                                <div class="col-6 py-1">${lec.teacherNm}</div>
                            </div>
                            <div class="row">
                                <div class="col-6 py-1 text-right border-right">
                                    <strong>교육 가격</strong>
                                </div>
                                <div class="col-6 py-1">${lec.cost}</div>
                            </div>
                        </div>
                        <a href="${path}/lecture/get.do?lno=${lec.lno}" class="btn btn-primary px-4 mx-auto mb-4">신청하기</a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <c:if test="${empty lectureList}">
            <div class="row">
                <div class="col-lg-4">
                    <div class="card border-0 bg-light shadow-sm pb-2">
                        <img class="card-img-top mb-2" src="${path }/resources/image/lecture/dummy.png" alt="샘플썸네일"/>
                        <div class="card-body text-center">
                            <h4 class="card-title">강의 추가필요</h4>
                            <p class="card-text">
                                미정
                            </p>
                        </div>
                        <div class="card-footer bg-transparent py-4 px-5">
                            <div class="row border-bottom">
                                <div class="col-6 py-1 text-right border-right">
                                    <strong>교육 과목</strong>
                                </div>
                                <div class="col-6 py-1">미정</div>
                            </div>
                            <div class="row border-bottom">
                                <div class="col-6 py-1 text-right border-right">
                                    <strong>교육 강사</strong>
                                </div>
                                <div class="col-6 py-1">미정</div>
                            </div>
                            <div class="row">
                                <div class="col-6 py-1 text-right border-right">
                                    <strong>교육 가격</strong>
                                </div>
                                <div class="col-6 py-1">미정</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>

<!-- Services-->
<div class="container is-fullhd">
    <section class="section pb-0 my-5 notice_area">
        <div class="columns" id="columns">
            <div class="column is-half" style="margin-bottom: 3%">
                <h2 class="subtitle noticeTitle">공지사항<a href="${path }/notice/list" class="delete is-large"></a></h2>
                <ul class="board_con mx-0" style="list-style-type: none">
                    <c:forEach var="notice" items="${noticeList}">
                        <fmt:parseDate value="${notice.regdate }" var="noticeRegdate" pattern="yyyy-MM-dd HH:mm:ss" />
                        <li><a href="${path }/notice/get?no=${notice.no}">${notice.title}<span class="date"><fmt:formatDate value="${noticeRegdate }" pattern="yyyy-MM-dd" /></span></a></li>
                    </c:forEach>
                    <c:if test="${empty noticeList}">
                        <li class="no_date">
                            등록된 강의가 없습니다.
                        </li>
                    </c:if>
                </ul>
            </div>
            <div class="column is-half " style="margin-bottom: 3%">
                <h2 class="subtitle noticeTitle">자유게시판<a href="${path }/free/list" class="delete is-large"></a></h2>
                <ul class="board_con mx-0" style="list-style-type: none">
                    <c:forEach var="free" items="${freeList }">
                        <fmt:parseDate value="${free.regdate }" var="freeRegdate" pattern="yyyy-MM-dd HH:mm:ss" />
                        <li><a href="${path }/free/get?fno=${free.fno}">${free.title}<span class="date"><fmt:formatDate value="${freeRegdate }" pattern="yyyy-MM-dd" /></span></a></li>
                    </c:forEach>
                    <c:if test="${empty freeList }">
                        <li class="no_date">
                            등록된 게시글이 없습니다.
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </section>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
