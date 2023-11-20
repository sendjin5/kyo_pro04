<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>자료실 수정하기</title>
    <jsp:include page="../include/head.jsp" />
    <script type="text/javascript" src="${path }/resources/ckeditor/ckeditor.js"></script>
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

        <form action="${path }/databoard/update" method="post" enctype="multipart/form-data">
            <input type="hidden" name="bno" id="bno" value="${databoard.bno}">
            <table class="table">
                <tbody>
                <tr>
                    <th class="has-text-centered has-text-white"><label for="title">제목</label></th>
                    <td><input type="text" class="input" name="title" id="title" value="${databoard.title}"></td>
                </tr>
                <tr>
                    <th class="has-text-centered has-text-white">업로드 파일</th>
                    <td colspan="2">
                        <c:if test="${!empty dataFiles}">
                            <c:forEach var="file" items="${dataFiles}">
                                <div class="dataBoardFile">
                                    <a href="${path}/resources/upload/${file.saveFolder}/${file.saveName}" download="${file.fileName}"><i class="icofont-ui-file mr-2"></i>${file.fileName}</a>
                                    <a href="${path}/dataFile/delete?fno=${file.fno}&bno=${databoard.bno}" onclick=" return deleteFile()"><i class="icofont-ui-delete"></i></a>
                                </div>
                            </c:forEach>
                        </c:if>
                        <input class="input" type="file" name="uploadFiles" id="uploadFiles" multiple="true">
                    </td>
                </tr>
                <tr>
                    <th class="has-text-centered has-text-white"><label for="content">내용</label></th>
                    <td>
                        <textarea name="content" id="content" class="textarea" maxlength="1500">${databoard.content}</textarea>
                        <script>
                            CKEDITOR.replace('content', {filebrowserUploadUrl: '${path }/util/imageUpload'});
                        </script>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="buttons is-centered">
                <input class="button is-mainColor" type="submit" value="수정 완료">
                <a href="${path }/databoard/list" class="button is-success">글 목록</a>
            </div>
        </form>

    </section>

    <script>
        function deleteFile(fno){
            let deleteTrue = confirm("파일을 삭제하시겠습니까?")
            if(deleteTrue){
                return true;
            } else{
                return false;
            }
        }
    </script>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>

