<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>자유게시판 글 보기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp" />
	<link rel="stylesheet" href="${path}/resources/cssget.css">
</head>

<body>
<header class="hd" id="hd">
	<jsp:include page="../include/header.jsp" />
</header>
<div class="content">

	<section class="page-title bg-02">
		<div class="container">
			<div class="columns">
				<div class="column is-12">
					<div class="block has-text-centered">
						<h1 class="is-capitalize text-lg font-happy">자유게시판</h1>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="section blog-wrap container">
		<div class="detail">
			<div class="conwrap">
				<div class="h3group">
					<div class="location">
						<span class="depth">홈</span>
						<span class="depth">/ 커뮤니티</span><strong class="this">/ 자유게시판</strong>
					</div>
				</div>
				<div class="viewbody">
					<div class="hgroup">
						<c:if test="${ sid eq 'admin'}">
						<div class="no">NO ${dto.fno }</div>
						</c:if>
						<div class="tit">${dto.title }</div>
						<div class="util">
							<div class="name">${dto.author }</div>
							<div class="date">작성일
								<fmt:parseDate value="${dat.regdate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
								<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" /></div>
							<div class="hit">조회수 ${dto.visited }</div></div>
						</div>
					<div class="content">
							${dto.content }
					</div>
					<div class="buttons is-centered">
						<a class="button is-mainColor" href="${path }/free/list">목록</a>
						<c:if test="${not empty sid && (dto.author eq sid)}">
							<a class="button is-success" href="${path }/free/update?fno=${dto.fno}&author=${dto.author}">수정</a>
						</c:if>
						<c:if test="${not empty sid && (sid eq 'admin' || dto.author eq sid)}">
							<a class="button is-mainColor" href="${path }/free/delete?fno=${dto.fno}&author=${dto.author}">삭제</a>
						</c:if>
					</div>
				</div>

			</div>
		</div>
	</section>
	</div>
	<!-- 푸터 부분 인클루드 -->
	<jsp:include page="../include/footer.jsp" />
</div>
</body>
</html>