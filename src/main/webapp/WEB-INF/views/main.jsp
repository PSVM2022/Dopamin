<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page session="false" %>
<%--  getsession(false)==null  기존에 세션이 없음을 의미.즉,로그인되어있지 않음. --%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('USERID')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="SURVEY" value="${pageContext.request.getSession(false).getAttribute('SURVEY')}"/>

<html lang="ko">

<head>
    <title>도파민!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="<c:url value='/image/favicon.png'/>">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR&family=Noto+Serif&display=swap">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/default.css'/>">
    <%--home.css 부분을 빼고 자기 페이지의 css를 넣으세요--%>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/contentsmain.css'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>
<div class="container">
    <!-- 헤더 컨테이너. 이 페이지는 로그아웃 상태의 페이지 -->
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start border-bottom">
        <a href="<c:url value='/'/>"
           class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none px-3">
            <object data="<c:url value='/image/main_logo.svg' />" width="150" height="96"></object>
        </a>
        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            <li><a href="/psvm/" class="nav-link px-2 link-secondary">홈</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">신규작</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">인기작</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">커뮤니티</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">이벤트</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">상점</a></li>
        </ul>
        <div class="text-end">
            <button type="button" class="btn btn-warning me-2">Login</button>
        </div>
    </header>
</div>
<!--
  내용 컨테이너. 여러개의 Row를 만들 때 section 태그로 나눕니다.
  container - 컨텐츠를 포함하고 채우고 정렬하는 부트스트랩 기본구성요소
  py-5 - padding y축방향(위아래)로 5 단위만큼 부여 https://getbootstrap.kr/docs/5.0/utilities/spacing/ 참고
  // 컨텐츠를 넣는 태그 만들 때 무조건 section 태그에 container py-5 주고 시작합니다(위 아래 컨텐츠간 여백)
  bg-light - 약간의 음영을 주는 속성. 짝수 section 마다 주면 좋을거 같아요 컨텐츠 구별용(흰색-음영회색-흰색)
-->
<main>
    <div class="container">
        <section>
            <!-- Carousel wrapper -->
        </section>

        <div class="bg-image d-flex justify-content-center align-items-center"
             style="background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJmR8LF39ptV7-8XwO-3fw1VV0iU0cXa46-A&usqp=CAU');
                 height: 28rem;">
            <section class="container">
                <h1 class="fw-bold text-white text-center">DOPAMIN</h1>
                <section class="container py-2">
                    <div class="col-lg- mx-auto">
                        <p class="lead mb-4 text-center text-white">Search Contents!</p>
                        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
                            <div class="input-group input-group-lg">
                                <!--검색창 가운데정렬(col-lg-auto me-lg-auto 이거 빼주면 됨) : option 손봐야함-->
                                <form class="nav col-12 mb-2 justify-content-center mb-md-0"
                                      action="<c:url value="/contents/search/${sc.keyword}"/>" class="search-form"
                                      method="get">
                                    <select class="search-option" name="option">
                                        <option value="ttl" ${ph.sc.option=='ttl' || ph.sc.option=='' ? "selected" : ""}>
                                            제목/부제목
                                        </option>
                                        <option value="cast" ${ph.sc.option=='cast' ? "selected" : ""}>감독/출연진</option>
                                        <option value="genre" ${ph.sc.option=='genre' ? "selected" : ""}>장르별</option>
                                    </select>
                                    <li><input type="text" class="form-control form-control-lg rounded"
                                               placeholder="search your contents" aria-label="Type Keywords"
                                               aria-describedby="basic-addon2" name="keyword" class="search-input"
                                               type="text" value="${sc.keyword}"/></li>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
        </div>

        <!--section을 py-5로 주고하는게 여기도 해당되나?-->
        <!--1-->
        <section class="container py-5">
            <div class="row">
                <div class="col-6">
                    <h3 class="mb-3">인기 컨텐츠</h3>
                </div>
                <div class="col-6 text-right">  <!--(<,>)버튼-->
                    <a class="btn btn-primary mb-3 mr-1" href="#carouselExampleIndicators3" role="button"
                       data-slide="prev">
                        <i class="fa fa-arrow-left"></i>
                    </a>
                    <a class="btn btn-primary mb-3 mr-1" href="#carouselExampleIndicators3" role="button"
                       data-slide="next">
                        <i class="fa fa-arrow-right"></i>
                    </a>
                </div>

                <!--여기부터 반복-->
                <div class="col-12">
                    <div id="carouselExampleIndicators3" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="row">

                                    <section class="container py-5">
                                        <div class="container">
                                            <div class="row">
                                                <c:forEach var="i" begin="0" end="2" items="${cntsDtoList}">
                                                    <div class="col-4">
                                                        <div class="card m-2"
                                                             onclick="location.href='/psvm/contents/${i.cnts_id}'">
                                                            <img class="img-fluid" src=${i.cnts_postr_img}/>
                                                            <div class="card-body">
                                                                <h4 class="card-title">${i.cnts_title}</h4>
                                                                <h6 class="text-muted">${i.cnts_subttl}</h6>
                                                                <p class="card-text">${i.cnts_op_date}</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </section>

                                </div>
                            </div>    <!--한 번에 보여지는 카드 수-->

                            <div class="carousel-item">
                                <div class="row">

                                    <section class="container py-5">
                                        <div class="container">
                                            <div class="row">
                                                <c:forEach var="i" begin="3" end="5" items="${cntsDtoList}">
                                                    <div class="col-4">
                                                        <div class="card m-2"
                                                             onclick="location.href='/psvm/contents/${i.cnts_id}'">
                                                            <img class="img-fluid" src=${i.cnts_postr_img}/>
                                                            <div class="card-body">
                                                                <h4 class="card-title">${i.cnts_title}</h4>
                                                                <h6 class="text-muted">${i.cnts_subttl}</h6>
                                                                <p class="card-text">${i.cnts_op_date}</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <script>
                                            <%--let surveyMsg = "${SUR_SUCCESS}"--%>
                                            if ("${SUR_SUCCESS}" != "") alert("${SUR_SUCCESS}")
                                            if ("${SUR_ERR}" != "") alert("${SUR_ERR}")

                                        </script>
                                    </section>

                                    <div class="content">
                                        <div class="responsive-content">
                                            <h2>DOPAMIN</h2>
                                            <div class="content-preview" style="text-align:center">


                                                <c:forEach var="cnts" items="${cntsDtoList}">
                                                    <br>
                                                    <tr>
                                                        <div>
                                                            <td>
                                                                <a href='/psvm/contents/${cnts.cnts_id}'/>${cnts.cnts_postr_img}
                                                            </td>
                                                            <br>
                                                            <td>${cnts.cnts_title}</td>
                                                            <br>
                                                            <td>${cnts.cnts_subttl}</td>
                                                            <br>
                                                            <td>${cnts.cnts_op_date}</td>
                                                            <br>
                                                            <!-- <td>${cnts.cnts_cnty}</td><br>-->
                                                        </div>
                                                    </tr>
                                                </c:forEach>
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
</body>
</html>