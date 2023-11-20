<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>HEABEOP::마이페이지</title>
    <jsp:include page="../include/head.jsp" />

    <link rel="stylesheet" href="${path }/resources/css/sub.css">
</head>
<body>
<div class="myPage">
<div class="container-fluid">
    <div class="row justify-content-md-center my-5">
        <div class="col-8">
            <div class="row">
                <div class="col-2 p-2">
                    <div class="d-flex flex-column align-items-center justify-content-center border left_side">
                        <div class="left_top">
                            <p>마이페이지</p>
                        </div>
                        <ul class="my-2" style="width:100%;">
                            <li><a href="${path }/" class="active px-4 py-2">메인으로</a></li>
                            <li><a href="${path }/member/paylistMem.do" class="active px-4 py-2">결제정보</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-10 p-2">
                    <div class="d-flex flex-column align-items-center justify-content-center right_side">
                        <h5 class="my-4" style="font-size:2.5em;font-weight:600;">마이페이지</h5>
                        <div class="table_form_wrap">
                            <table class="table_form">
                                <tbody>
                                <tr>
                                    <th>회원유형</th>
                                    <c:choose>
                                        <c:when test="${member.grade eq 1}">
                                            <td><strong>학부모</strong></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td><strong>학생</strong></td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                                <tr>
                                    <th>아이디</th>
                                    <td>${member.id }</td>
                                </tr>
                                <tr>
                                    <th>이름</th>
                                    <td>${member.nm }</td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>${member.email }</td>
                                </tr>
                                <tr>
                                    <th>전화번호</th>
                                    <td>${member.tel }</td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td>${member.addr1 } ${member.addr2} (${member.postcode })</td>
                                </tr>
                                <tr>
                                    <th>생년월일</th>
                                    <td>${member.birth }</td>
                                </tr>
                                <tr>
                                    <th>포인트</th>
                                    <td>${member.pt }</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <a href="${path }/member/update?id=${sid }" class="button is-primary">회원 정보수정</a>
                                        <button type="button" onclick="remove()" class="button is-primary" >회원 탈퇴</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>
</div>
<jsp:include page="../include/footer.jsp" />
<script>
    function remove() {
        if(window.confirm("회원 탈퇴하겠습니까?")){
            location.href = "${path}/member/delete?id=${sid }"
        }
    }
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>