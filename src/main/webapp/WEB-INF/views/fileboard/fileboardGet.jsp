<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="sid" value="${pageContext.session.getAttribute('sid') }"/>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>자료실 상세보기</title>
    <jsp:include page="../include/head.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/boardget.css">
</head>

<body>
<jsp:include page="../include/header.jsp" />
<div class="content">

    <section class="page-title bg-02">
        <div class="container">
            <div class="columns">
                <div class="column is-12">
                    <div class="block has-text-centered">
                        <h1 class="is-capitalize text-lg font-happy">자료실 상세보기</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section blog-wrap container">
        <table class="table">
            <thead>
            <tr>
                <th class="item1 has-text-white has-text-centered">제목</th>
                <th class="item3 has-text-white has-text-centered">작성일</th>
                <th class="item4 has-text-white has-text-centered">조회수</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="item1 has-text-centered">${fileboard.title}</td>
                <td class="item3 has-text-centered">
                    <fmt:parseDate value="${fileboard.regdate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
                    <fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
                </td>
                <td class="item4 has-text-centered">${fileboard.visited}</td>
            </tr>
<%--            <c:if test="${!empty dataFiles}">--%>
<%--                <tr>--%>
<%--                    <td colspan="3">--%>
<%--                        <c:forEach var="file" items="${dataFiles}">--%>
<%--                            <div class="fileboardFile">--%>
<%--                                <a href="${path }/resources/upload/${file.saveFolder}/${file.saveName}" download="${file.fileName}"><i class="icofont-ui-file mr-2"></i>${file.fileName}</a>--%>
<%--                            </div>--%>
<%--                        </c:forEach>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--            </c:if>--%>
            <tr>
                <td colspan="3" id="content">
                    ${fileboard.content}
                </td>
            </tr>
                    <div class="dataBoardFile">
            <img src="${path }/resources/upload/${file.saveFolder }/${file.saveNm }" width="400" height="225"><br>
            <a href="${path }/resources/upload/${file.saveFolder }/${file.saveNm }" download="${file.saveNm }"><i class="icofont-ui-file mr-2"></i>${file.originNm }</a>
                    </div>


            </tbody>
        </table>
        <div class="buttons is-centered">
            <a href="${path }/fileboard/list" class="button is-mainColor">글 목록</a>
            <c:if test="${not empty sid && (sid eq 'admin')}">
                <a href="${path }/fileboard/update?bno=${fileboard.bno}" class="button is-success">글 수정</a>
                <a href="${path }/fileboard/delete?bno=${fileboard.bno}" class="button is-mainColor">글 삭제</a>
            </c:if>
        </div>
    </section>

</div>
        <jsp:include page="../include/footer.jsp" />
</body>

</html>
