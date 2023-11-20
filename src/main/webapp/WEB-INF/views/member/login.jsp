<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>로그인</title>
    <jsp:include page="../include/head.jsp" />
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            background: url(${path}/resources/image/loginback.jpg) no-repeat;
            background-size: cover;
            color: #fff;
            font-family: 'Muli', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            overflow: hidden;
            margin: 0;
            width: 100vw;
        }

        .container-login {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px 40px;
            border-radius: 5px;
            width: 500px;
        }

        .container-login h1 {
            text-align: center;
            margin-bottom: 40px;
            margin-top: 30px;
        }

        .container-login a {
            text-decoration: none;
            color: #ffc800;
        }

        .login-btn {
            cursor: pointer;
            display: inline-block;
            width: 100%;
            background: #ffc800;
            padding: 15px;
            font-family: inherit;
            font-size: 16px;
            border: 0;
            border-radius: 5px;
        }

        .login-btn:focus {
            outline: 0;
        }

        .login-btn:active {
            transform: scale(0.98);
        }

        .text {
            margin-top: 30px;
        }

        .form-controller {
            position: relative;
            margin: 20px 0 40px;
            width: 100%;
        }

        .form-controller input {
            border: none;
            border-bottom: 2px #fff solid;
            width: 100%;
            padding: 10px 0;
            font-size: 18px;
            color: black;
            display: block;
            visibility: hidden;
        }

        .form-controller input:focus,
        .form-controller input:valid {
            outline: 0;
            border-bottom-color: #ffc800;
        }

        .form-controller label {
            position: absolute;
            top: 19px;
            left: 8px;
            pointer-events: none;
            color: #ffc800;
        }

        form p {
            letter-spacing: 0.3rem;
            display: flex;
            justify-content: space-between;
        }

        .form-controller label span {
            display: inline-block;
            font-size: 18px;
            min-width: 5px;
            transition: 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
        }

    </style>
</head>

<body>
    <jsp:include page="../include/header.jsp" />

    <div class="container-login">
        <h1>로그인</h1>
        <form action="${path }/member/login" id="login_frm" class="frm" method="post">
        <div class="form-controller">
                <input type="text" class="input" name="id" id="id" required />
                <label><span>아이디</span></label>
            </div>

            <div class="form-controller">
                <input type="password" class="input" name="pw" id="pw" required />
                <label><span>비밀번호</span></label>
            </div>

            <button type="submit" class="login-btn">로그인</button>

            <p class="text">회원이 아니신가요? <a href="${path }/member/term">회원가입</a></p>
        </form>
    </div>

    <script>
        $(document).ready(function(){
            $(".container-login").click(function(){
                $(".form-controller label span").css("transform", "translateY(-50px)");
                $(".form-controller input").css({"visibility": "visible", "transition-delay": "0.3s", "transition-duration": "1s"});
            })

        })
    </script>

</body>
</html>