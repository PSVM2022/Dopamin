<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page session="false"%>

<html>
<html lang="ko">

<head>
    <title>도파민!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="<c:url value='/image/favicon.png' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/default.css' />">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
          integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR&family=Noto+Serif&display=swap');
    </style>
</head>

<body>

<div class="topnav">
    <div class="responsive">
        <div class="logo-wrapper">
            <img src="image/logo_example.svg" width="50" height="30">
        </div>
        <a class="topnav-menu" href="#" onclick='alert("홈으로 페이지 전환")'>홈</a>
        <a class="topnav-menu" href="#" onclick='alert("신규작 페이지로 이동")'>신규작</a>
        <a class="topnav-menu" href="#" onclick='alert("인기작 페이지로 이동")'>인기작</a>
        <a class="topnav-menu" href="#" onclick='alert("커뮤니티에서 게시판봐요")'>커뮤니티</a>
        <a class="topnav-menu" href="#" onclick='alert("룰렛 한판 돌려요")'>이벤트</a>
        <a class="topnav-menu" href="<c:url value="/login/login"/>">로그인</a>
    </div>
</div>

<div class="content">
    <div class="responsive-content">
        <form action="<c:url value='/login/login'/>" method="post" onsubmit="return formCheck(this);">

            <h3 id="title">Login</h3>

            <c:if test="${not empty param.id}">
                <input type="text" name="id" placeholder="아이디 입력" value="${param.id}" autofocus>
            </c:if>
            <c:if test="${empty param.id}">
                <input type="text" name="id" placeholder="아이디 입력" autofocus>
            </c:if>
            <input type="password" name="pwd" placeholder="비밀번호">
            <input name="toURL" value="${param.toURL}" placeholder="그전 url정보 담기">
            <div id="msg">
                <c:if test="${not empty param.msg}">
                    <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg,"utf-8")}</i>
                </c:if>
            </div>
            <button>로그인</button>
            <div>
                <label><input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value ? "":"checked"}> 아이디 기억</label> |
                <label><input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value ? "":"checked"}> 로그인 상태 유지</label> |

                <br>
                <a href="/">비밀번호 찾기</a> |
                <a href="/">아이디 찾기</a> |
                <a href="<c:url value="/join/join"/>">회원가입</a>
            </div>
            <script>
                function formCheck(frm) {
                    let msg ='';
                    if(frm.id.value.length==0) {
                        setMessage('<i class="fa fa-exclamation-circle"> id를 입력해주세요.', frm.id);
                        return false;
                    }
                    if(frm.pwd.value.length==0) {
                        setMessage('<i class="fa fa-exclamation-circle"> password를 입력해주세요.', frm.pwd);
                        return false;
                    }
                    return true;
                }
                function setMessage(msg, element){
                    document.getElementById("msg").innerHTML = ` ${'${msg}'}`;
                    if(element) {
                        element.select();
                    }
                }
            </script>
        </form>
    </div>
</div>


<div class="footer">
    <div>about</div>
    <div>2022 PSVM팀</div>
</div>

</body>

</html>