<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false" %>
<%--  getsession(false)==null  기존에 세션이 없음을 의미.즉,로그인되어있지 않음. --%>
<c:set var="USERID"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('USERID')}"/>
<c:set var="loginOutLink" value="${USERID=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${USERID=='' ? '로그인' : USERID}"/>
<c:set var="SURVEY" value="${pageContext.request.getSession(false).getAttribute('SURVEY')}"/>

<html lang="ko">

<head>
    <title>도파민!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="<c:url value='/image/favicon.png'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/default.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
          integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
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
        <a class="topnav-menu" href="/psvm/item/" onclick='alert("충동 구매는 당신의 지갑을 얇게 만들수 있습니다.")'>상점</a>
        <form class="topnav-search" action="<c:url value="/contents/search/${sc.keyword}"/>" class="search-form"
              method="get">
            <input class="topnav-search" type="text" name="keyword" class="search-input" type="text"
                   value="${sc.keyword}" placeholder="검색어를 입력해주세요">
            <input class="topnav-search" type="submit" class="search-button" value="검색">
        </form>
        <a class="topnav-menu" href="<c:url value='${loginOutLink}'/>" onclick='alert("${loginOut}")'>${loginOut}</a>
    </div>
</div>
<div class="content">
    <div class="responsive-content">
        <h2>DOPAMIN</h2>
        <form action="<c:url value="/join/survey"/>" method="post">
            <div class="content-preview" style="text-align:center">
                <h4>설문조사</h4>
                <p>본 설문조사는 마이페이지와 영화 추천 기능에 필요한 기능입니다.</p>
                <input type="hidden" name="user_id" value="${USERID}"/>
                <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="fav_genre1">
                    <option selected>--선택--</option>
                    <option value="1">액션</option>
                    <option value="2">애니메이션</option>
                    <option value="3">범죄</option>
                    <option value="4">드라마</option>
                    <option value="5">코미디</option>
                    <option value="6">로맨스</option>
                    <option value="7">스릴러</option>
                    <option value="8">호러</option>
                    <option value="9">SF</option>
                    <option value="10">성인</option>
                    <option value="11">판타지</option>
                    <option value="12">어드벤쳐</option>
                    <option value="13">미스터리</option>
                    <option value="14">가족</option>
                    <option value="15">전쟁</option>
                    <option value="16">사극</option>
                    <option value="17">다큐멘터리</option>
                    <option value="18">뮤지컬</option>
                    <option value="19">서부극</option>
                    <option value="20">공연</option>
                    <option value="21">게임</option>
                    <option value="22">리얼리티</option>
                    <option value="23">토크쇼</option>
                    <option value="24">스포츠</option>
                    <option value="25">유러피안</option>
                </select>
                <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="fav_genre2">
                    <option selected>--선택--</option>
                    <option value="1">액션</option>
                    <option value="2">애니메이션</option>
                    <option value="3">범죄</option>
                    <option value="4">드라마</option>
                    <option value="5">코미디</option>
                    <option value="6">로맨스</option>
                    <option value="7">스릴러</option>
                    <option value="8">호러</option>
                    <option value="9">SF</option>
                    <option value="10">성인</option>
                    <option value="11">판타지</option>
                    <option value="12">어드벤쳐</option>
                    <option value="13">미스터리</option>
                    <option value="14">가족</option>
                    <option value="15">전쟁</option>
                    <option value="16">사극</option>
                    <option value="17">다큐멘터리</option>
                    <option value="18">뮤지컬</option>
                    <option value="19">서부극</option>
                    <option value="20">공연</option>
                    <option value="21">게임</option>
                    <option value="22">리얼리티</option>
                    <option value="23">토크쇼</option>
                    <option value="24">스포츠</option>
                    <option value="25">유러피안</option>
                </select>
                <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="fav_genre3">
                    <option selected>--선택--</option>
                    <option value="1">액션</option>
                    <option value="2">애니메이션</option>
                    <option value="3">범죄</option>
                    <option value="4">드라마</option>
                    <option value="5">코미디</option>
                    <option value="6">로맨스</option>
                    <option value="7">스릴러</option>
                    <option value="8">호러</option>
                    <option value="9">SF</option>
                    <option value="10">성인</option>
                    <option value="11">판타지</option>
                    <option value="12">어드벤쳐</option>
                    <option value="13">미스터리</option>
                    <option value="14">가족</option>
                    <option value="15">전쟁</option>
                    <option value="16">사극</option>
                    <option value="17">다큐멘터리</option>
                    <option value="18">뮤지컬</option>
                    <option value="19">서부극</option>
                    <option value="20">공연</option>
                    <option value="21">게임</option>
                    <option value="22">리얼리티</option>
                    <option value="23">토크쇼</option>
                    <option value="24">스포츠</option>
                    <option value="25">유러피안</option>
                </select>
                <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="fav_genre4">
                    <option selected>--선택--</option>
                    <option value="1">액션</option>
                    <option value="2">애니메이션</option>
                    <option value="3">범죄</option>
                    <option value="4">드라마</option>
                    <option value="5">코미디</option>
                    <option value="6">로맨스</option>
                    <option value="7">스릴러</option>
                    <option value="8">호러</option>
                    <option value="9">SF</option>
                    <option value="10">성인</option>
                    <option value="11">판타지</option>
                    <option value="12">어드벤쳐</option>
                    <option value="13">미스터리</option>
                    <option value="14">가족</option>
                    <option value="15">전쟁</option>
                    <option value="16">사극</option>
                    <option value="17">다큐멘터리</option>
                    <option value="18">뮤지컬</option>
                    <option value="19">서부극</option>
                    <option value="20">공연</option>
                    <option value="21">게임</option>
                    <option value="22">리얼리티</option>
                    <option value="23">토크쇼</option>
                    <option value="24">스포츠</option>
                    <option value="25">유러피안</option>
                </select>
                <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="fav_genre5">
                    <option selected>--선택--</option>
                    <option value="1">액션</option>
                    <option value="2">애니메이션</option>
                    <option value="3">범죄</option>
                    <option value="4">드라마</option>
                    <option value="5">코미디</option>
                    <option value="6">로맨스</option>
                    <option value="7">스릴러</option>
                    <option value="8">호러</option>
                    <option value="9">SF</option>
                    <option value="10">성인</option>
                    <option value="11">판타지</option>
                    <option value="12">어드벤쳐</option>
                    <option value="13">미스터리</option>
                    <option value="14">가족</option>
                    <option value="15">전쟁</option>
                    <option value="16">사극</option>
                    <option value="17">다큐멘터리</option>
                    <option value="18">뮤지컬</option>
                    <option value="19">서부극</option>
                    <option value="20">공연</option>
                    <option value="21">게임</option>
                    <option value="22">리얼리티</option>
                    <option value="23">토크쇼</option>
                    <option value="24">스포츠</option>
                    <option value="25">유러피안</option>
                </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" id="">Save changes</button>
            </div>
        </form>
    </div>
    <br>
</div>
<i class="fa-brands fa-instagram"></i>
<i class="fa-brands fa-facebook"></i>
<i class="fa-brands fa-youtube"></i>
<div class="content-preview"></div>
<div class="content-teenager-girl-movie"></div>
</div>
<div class="footer">
    <div>about</div>
    <div>2022 PSVM팀</div>
</div>
<script>

</script>
</body>
</html>