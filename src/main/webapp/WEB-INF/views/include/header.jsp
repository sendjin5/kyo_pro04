<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="sid" value="${pageContext.session.getAttribute('sid') }"/>

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="${path}/"><img src="${path}/resources/image/logo.png" alt="logo" /></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars ms-1"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                <li class="nav-item"><a class="nav-link" href="${path }/fileboard/list">자료실</a></li>
                <li class="nav-item"><a class="nav-link" href="${path }/notice/list">공지사항</a></li>
                <li class="nav-item"><a class="nav-link" href="${path }/free/list">자유게시판</a></li>
                <li class="nav-item"><a class="nav-link" href="${path }/lecture/list.do">강의</a></li>
                <c:if test="${sid == null}">
                <li class="nav-item"><a class="nav-link" href="${path }/member/login">로그인</a></li>
                </c:if>
                <c:if test="${sid != null}">
                    <li class="nav-item"><a class="nav-link" href="${path }/member/logout">로그아웃</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<%--<header class="navigation">--%>
<%--    <div class="header-top ">--%>
<%--        <div class="container py-2">--%>
<%--            <div class="columns is-gapless is-justify-content-space-between is-align-items-center">--%>
<%--                <div class="column is-12-desktop is-8-tablet">--%>
<%--                    <div class="header-top-right has-text-right-tablet has-text-centered-mobile">--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${sid=='admin'}">--%>
<%--                                <a href="${path }/member/logout?sid=${sid}" class="is-size-6 has-text-weight-semibold">로그아웃</a>--%>
<%--                                <a href="${path }/member/get" class="is-size-6 has-text-weight-semibold">마이페이지</a>--%>
<%--                                <a href="${path }/admin/MemberListAdmin" class="is-size-6 has-text-weight-semibold">관리자페이지</a>--%>
<%--                            </c:when>--%>
<%--                            <c:when test="${!empty sid}">--%>
<%--                                <a href="${path }/member/logout" class="is-size-6 has-text-weight-semibold">로그아웃</a>--%>
<%--                                <a href="${path }/member/get?sid=${sid}" class="is-size-6 has-text-weight-semibold">마이페이지</a>--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise>--%>
<%--                                <a href="${path }/member/login" class="is-size-6 has-text-weight-semibold">로그인</a>--%>
<%--                                <a href="${path }/member/term" class="is-size-6 has-text-weight-semibold">회원가입</a>--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <nav id="navbar" class="navbar main-nav">--%>
<%--        <div class="container">--%>
<%--            <div class="navbar-brand">--%>
<%--                <a class="navbar-item" href="${path }/">--%>
<%--                    <img src="${path }/resources/image/common/logo.png" alt="해법수학 로고타입" style="max-width: 200px;">--%>
<%--                </a>--%>
<%--                <button role="button" class="navbar-burger burger" data-hidden="true" data-target="navigation">--%>
<%--                    <span aria-hidden="true"></span>--%>
<%--                    <span aria-hidden="true"></span>--%>
<%--                    <span aria-hidden="true"></span>--%>
<%--                </button>--%>
<%--            </div>--%>

<%--            <div class="navbar-menu mr-0" id="navigation">--%>
<%--                <ul class="navbar-end">--%>
<%--                    <li class="navbar-item has-dropdown is-hoverable">--%>
<%--                        <a class="navbar-link is-size-5">회사소개</a>--%>
<%--                        <div class="navbar-dropdown">--%>
<%--                            <a class="navbar-item is-size-6" href="${path }/company01">인사말</a>--%>
<%--                            <a class="navbar-item is-size-6" href="${path }/company02">연혁</a>--%>
<%--                            <a class="navbar-item is-size-6" href="${path }/company03">오시는 길</a>--%>
<%--                        </div>--%>
<%--                    </li>--%>

<%--                    <li class="navbar-item has-dropdown is-hoverable">--%>
<%--                        <a class="navbar-link is-size-5">커뮤니티</a>--%>
<%--                        <div class="navbar-dropdown">--%>
<%--                            <a class="navbar-item is-size-6" href="${path }/notice/List">공지사항</a>--%>
<%--                            <a class="navbar-item is-size-6" href="${path }/board/free/list">자유게시판</a>--%>
<%--                            <a class="navbar-item is-size-6" href="${path }/template">언론보도</a>--%>
<%--                            <a class="navbar-item is-size-6" href="${path }/board/qnaList">QnA</a>--%>
<%--                        </div>--%>
<%--                    </li>--%>

<%--                    <li class="navbar-item has-dropdown is-hoverable">--%>
<%--                        <a class="navbar-link is-size-5">이벤트</a>--%>
<%--                        <div class="navbar-dropdown">--%>
<%--                            <a class="navbar-item is-size-6" href="${path }/vote/list">투표</a>--%>
<%--                            <a class="navbar-item is-size-6" href="${path}/attend/getMyAttend">출석</a>--%>
<%--                        </div>--%>
<%--                    </li>--%>

<%--                    <li class="navbar-item">--%>
<%--                        <a class="navbar-link is-size-5" href="${path }/board/dataBoardList">자료실</a>--%>
<%--                    </li>--%>

<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </nav>--%>
<%--</header>--%>
<!--
<script>
    var gnb = document.getElementById("hdGnb");
    var hdWrap = document.getElementById("hdWrap");
    gnb.addEventListener("mouseover", function() {
        hdWrap.classList.add("hoverMenu");
    });

    gnb.addEventListener("mouseleave", function () {
        hdWrap.classList.remove("hoverMenu");
    });
</script>
-->