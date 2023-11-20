<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="sid" value="${pageContext.session.getAttribute('sid') }"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>파일 자료 목록</title>

	<jsp:include page="../include/head.jsp"/>
</head>
<body>
<jsp:include page="../include/header.jsp" />

	<div class="content">
		<section class="page-title bg-02">
			<div class="container">
				<div class="columns">
					<div class="column is-12">
						<div class="block has-text-centered">
							<h1 class="is-capitalize text-lg font-happy">자료실</h1>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="section blog-wrap container">

			<table class="table">
				<thead>
				<tr>
					<th class="has-text-white has-text-centered">글번호</th>
					<th class="has-text-white has-text-centered">제목</th>
					<th class="has-text-white has-text-centered">작성일</th>
					<th class="has-text-white has-text-centered">조회수</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${fileboardList }" var="data" varStatus="status">
					<tr>
						<td class="has-text-centered">${status.count }</td>
						<td class="has-text-centered"><a href="${path }/fileboard/get?bno=${data.bno }">${data.title }</a></td>
						<td class="has-text-centered">
							<fmt:parseDate value="${data.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
						</td>
						<td class="has-text-centered">${data.visited }</td>
					</tr>
				</c:forEach>
				<c:if test="${empty fileboardList}">
					<tr>
						<td class="has-text-centered" colspan="4">해당 목록이 존재하지 않습니다.</td>
					</tr>
				</c:if>
				</tbody>
			</table>

			<c:if test='${sid eq "admin"}'>
				<div class="buttons is-centered" style="float: right" >
					<a href="${path }/fileboard/insert" class="button is-mainColor">파일 등록</a>
				</div>
			</c:if>
	</div>

<jsp:include page="../include/footer.jsp" />
</body>
</html>