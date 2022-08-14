<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="ko">

<head>
    <title>도파민!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="<c:url value='/image/favicon.png' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='css/common/default.css' />">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
          integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
      @import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR&family=Noto+Serif&display=swap');
    </style>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>

<body>

<div class="topnav">
    <div class="responsive">
        <div class="logo-wrapper">
            <img alt="" src="<c:url value='/image/logo_example.svg' />" width="50" height="30">
        </div>
        <a class="topnav-menu" href="/psvm/" onclick='alert("홈으로 페이지 전환")'>홈</a>
        <a class="topnav-menu" href="#" onclick='alert("신규작 페이지로 이동")'>신규작</a>
        <a class="topnav-menu" href="#" onclick='alert("인기작 페이지로 이동")'>인기작</a>
        <a class="topnav-menu" href="#" onclick='alert("커뮤니티에서 게시판봐요")'>커뮤니티</a>
        <a class="topnav-menu" href="#" onclick='alert("룰렛 한판 돌려요")'>이벤트</a>
        <form class="topnav-search" action="<c:url value="/contents/search/${sc.keyword}"/>" class="search-form" method="get">
            <input class="topnav-search" type="text" name="keyword" class="search-input" type="text" value="${sc.keyword}" placeholder="검색어를 입력해주세요">
            <input class="topnav-search" type="submit" class="search-button" value="검색">
        </form>
    </div>
</div>

<div class="content">
    <div class="responsive-content">
        <div class="content-movie">
            <h2>DOPAMIN</h2>
            <div class="content-preview" style="text-align:center">

                <!-- 검색어 업데이트중 -->
                <%-- <c:set var="search" value="${sc.keyword != null}"/>
                <c:set var="search" value="${sc.keyword}"/>
                <c:if test="${fn: contains(search, search)}">
                    <p><c:out value="${search}"/>검색 결과 입니다.</p>
                </c:if>
                --%>

                <c:forEach var="cnts" items="${cntsDtoList}">
                    <br>
                    <tr>
                        <div>
                            <td><a href='/psvm/contents/${cnts.cnts_id}'/>${cnts.cnts_postr_img}</td><br>
                            <td>${cnts.cnts_title}</td><br>
                            <td>${cnts.cnts_subttl}</td><br>
                            <td>${cnts.cnts_op_date}</td><br>
                            <td>${cnts.cnts_cnty}</td><br>
                        </div>
                    </tr>
                </c:forEach>
                <br>
            </div>
        </div>

    </div>
    <i class="fa-brands fa-instagram"></i>
    <i class="fa-brands fa-facebook"></i>
    <i class="fa-brands fa-youtube"></i>
    <div class="content-teenager-girl-movie"></div>
</div>


<div class="footer">
    <div>about</div>
    <div>2022 PSVM팀</div>
</div>

</body>

</html>