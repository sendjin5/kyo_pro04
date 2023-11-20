<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="sid" value="${pageContext.session.getAttribute('sid') }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>해법수학::자료실</title>
<jsp:include page="../include/head.jsp" />
    <script type="text/javascript" src="${path }/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<jsp:include page="../include/header.jsp" />

<div class="content" id="contents">
    <section class="page-title bg-02">
        <div class="container">
            <div class="columns">
                <div class="column is-12">
                    <div class="block has-text-centered">
                        <h1 class="is-capitalize text-lg font-happy">자료실 등록하기</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section blog-wrap container">
        <form action="${path }/fileboard/insert" method="post" enctype="multipart/form-data">
            <input type="hidden" name="sid" id="sid" value="${sid}">
            <table class="table">
                <tbody>
                <tr>
                    <th class="has-text-centered has-text-white"><label for="title">제목</label></th>
                    <td><input type="text" class="input" name="title" id="title" placeholder="제목 입력"></td>
                </tr>
                <tr>
                    <th class="has-text-centered has-text-white"><label for="content">내용</label></th>
                    <td>
                        <textarea name="content" id="content" class="textarea" placeholder="내용 입력" maxlength="1500"></textarea>
                        <script>
                            CKEDITOR.replace('content', {filebrowserUploadUrl: '${path }/util/imageUpload'});
                        </script>
                    </td>
                </tr>
                <tr>
                    <th class="has-text-centered has-text-white"><label for="uploadFiles">파일 업로드(10MB 이하)</label></th>
                    <td>
                        <input class="input" type="file" name="uploadFiles" id="uploadFiles" multiple="true">
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="buttons is-centered">
                <input class="button is-mainColor" type="submit" value="작성하기">
                <a href="${path }/fileboard/list" class="button is-success">글 목록</a>
            </div>
        </form>

    </section>
</div>

</body>
</html>
