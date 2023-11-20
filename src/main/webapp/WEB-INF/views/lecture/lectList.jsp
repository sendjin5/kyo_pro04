<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="sid" value="${pageContext.session.getAttribute('sid') }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>HEABEOP::</title>
    <jsp:include page="../include/head.jsp" />

    <link rel="stylesheet" href="${path }/resources/css/sub.css">
    <link rel="stylesheet" href="${path }/resources/css/lecture.css">
</head>
<body>

<jsp:include page="../include/header.jsp" />
<div class="content">
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

<section class="latest-podcast-section section-padding pb-0" id="section_2">

    <div class="container" style="margin-bottom: 5%">
        <div class="row justify-content-center">

            <div class="col-lg-10 col-12">
                <div class="section-title-wrap mb-5">
                    <h3 class="section-title">강의목록</h3>
                </div>
                <c:forEach items="${lectureList }" var="lecture" varStatus="status">
                <div class="lect-frame">
                    <div class="border-00">
                    <div class="d-inline-block img-box-wrap">
                        <div class="img-box">
                            <!-- 썸네일 - 누르면 상세페이지 이동 -->
                            <a href="${path }/lecture/get.do?lno=${lecture.lno }">
                                <img src=${path}/resources/image/lecture/thumnail(6).png">
                            </a>
                        </div>
                    </div>
                    <div class="d-inline-block lect_info">
                        <div class="custom-block-info">

                            <h2 class="mb-2">
                                <a href="${path }/lecture/get.do?lno=${lecture.lno }">${lecture.title }</a>
                            </h2>

                            <h3>${lecture.subTitle }</h3>
                            <p>과목 : ${lecture.sno } </p>
                            <p>강사 : ${lecture.teacherNm } 선생님</p>
                            <p>수강인원 : ${lecture.studentCnt }명</p>
                            <p>${lecture.cost }원</p>

                        </div>
                    </div>
                    </div>
                    </div>
                <c:if test="${sid eq 'admin'}">
                    <a href="${path}/lecture/lectAdd.do" class="btn btn-primary" id="button-search" style="margin-top: 5%; float: right; margin-right: 10%;" >강의 등록하기</a>
                </c:if>
                </div>
                </c:forEach>
                <c:if test="${empty lectureList }">
                    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height:20vh;">
                        <h5 class="font-weight-bold">새로운 강의를 기대해주세요!</h5>
                    </div>

                </c:if>
            </div>

        </div>




</section>

</div>

<jsp:include page="../include/footer.jsp" />

</body>
</html>
