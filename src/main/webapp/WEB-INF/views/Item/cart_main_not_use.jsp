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
<%-- jsp 작성할 때만 브라우저 캐싱 금지 --%>
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('USERID')}" />
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}" />
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}" />
<html>
<html lang="ko">
<head>
    <title>도파민!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="<c:url value='/image/favicon.png'/>">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Noto+Sans+KR&family=Noto+Serif&display=swap">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/default.css'/>">

    <!--home.css 부분을 빼고 자기 페이지의 css를 넣으세요-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/home.css?20210502'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<div class="container">
    <!-- 헤더 컨테이너. 이 페이지는 로그아웃 상태의 페이지 -->
    <header
            class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start border-bottom">
        <a href="<c:url value='/'/>"
           class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none px-3">
            <object data="<c:url value='/image/main_logo.svg' />" width="150" height="96"></object>
        </a>
        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            <li><a href="/psvm/" class="nav-link px-2 link-secondary">홈</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">신규작</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">인기작</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">커뮤니티</a></li>
            <li><a href="<c:url value="/mypage"/>" class="nav-link px-2 link-dark">마이페이지</a></li>
            <li><a href="<c:url value="/item/"/>" class="nav-link px-2 link-dark">상점</a></li>
        </ul>
        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
            <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
        </form>

        <div class="text-end">
            <button type="button" class="btn btn-warning me-2">Login</button>
        </div>
    </header>
</div>
<!--
내용 컨테이너. 여러개의 Row를 만들 때 secion 태그로 나눕니다.
container - 컨텐츠를 포함하고 채우고 정렬하는 부트스트랩 기본구성요소
py-5 - padding y축방향(위아래)로 5 단위만큼 부여 https://getbootstrap.kr/docs/5.0/utilities/spacing/ 참고
// 컨텐츠를 넣는 태그 만들 때 무조건 section 태그에 container py-5 주고 시작합니다(위 아래 컨텐츠간 여백)
bg-light - 약간의 음영을 주는 속성. 짝수 section 마다 주면 좋을거 같아요 컨텐츠 구별용(흰색-음영회색-흰색)
-->
<main>
    <div class="container">
        <section class="container py-2">
            <h1 class="display-5 fw-bold text-center">DOPAMARKET</h1>
        </section>
        <section class="container py-2">
            <div class="col-lg- mx-auto">
                <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
                    <div class="input-group input-group-lg">
                        <input type="text" class="form-control form-control-lg rounded"
                               placeholder="SEARCH WHAT U WANT!!" aria-label="Type Keywords"
                               aria-describedby="basic-addon2" />
                        <span class="input-group-text border-0" id="basic-addon2"><i
                                class="fas fa-search"></i></span>
                    </div>
                </div>
            </div>
        </section>
        <section class="pt-3 pb-3">
            <div class="container">
                <div class="row">
                    <div class="col-6">
                        <a href="#" class="mb-3" style="font-size: 2rem; color: #ff9e07eb;font-weight: 500;">MAKE MYPAGE MORE ENERGETIC!</a>
                    </div>
                    <div class="col-6 text-right">
                        <a class="btn btn-primary mb-3 mr-1" href="#carouselExampleIndicators2" role="button"
                           data-slide="prev">
                            <i class="fa fa-arrow-left"></i>
                        </a>
                        <a class="btn btn-primary mb-3 " href="#carouselExampleIndicators2" role="button"
                           data-slide="next">
                            <i class="fa fa-arrow-right"></i>
                        </a>
                    </div>
                    <div class="col-12">
                        <div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <div class="row">
                                        <!--반복-->
                                        <c:forEach var="i" begin="0" end="3">
                                            <div class="col-md-3 mb-3">
                                                <div class="card">
                                                    <img class="img-fluid" alt="100%x280"
                                                         src="https://images.unsplash.com/photo-1517760444937-f6397edcbbcd?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=42b2d9ae6feb9c4ff98b9133addfb698">
                                                    <div class="card-body">
                                                        <h4 class="card-title">${list1[i].item_nm}</h4>
                                                        <h6 class="text-muted">${list1[i].grd_nm}</h6>
                                                        <p class="card-text">${list1[i].item_dsc}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <!--반복-->
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="row">
                                        <!--반복-->
                                        <c:forEach var="i" begin="3" end="6">
                                            <div class="col-md-3 mb-3">
                                                <div class="card">
                                                    <img class="img-fluid" alt="100%x280"
                                                         src="https://images.unsplash.com/photo-1517760444937-f6397edcbbcd?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=42b2d9ae6feb9c4ff98b9133addfb698">
                                                    <div class="card-body">
                                                        <h4 class="card-title">${list1[i].item_nm}</h4>
                                                        <h6 class="text-muted">${list1[i].grd_nm}</h6>
                                                        <p class="card-text">${list1[i].item_dsc}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <!--반복-->
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="row">
                                        <!--반복-->
                                        <c:forEach var="i" begin="6" end="9">
                                            <div class="col-md-3 mb-3">
                                                <div class="card">
                                                    <img class="img-fluid" alt="100%x280"
                                                         src="https://images.unsplash.com/photo-1517760444937-f6397edcbbcd?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=42b2d9ae6feb9c4ff98b9133addfb698">
                                                    <div class="card-body">
                                                        <h4 class="card-title">${list1[i].item_nm}</h4>
                                                        <h6 class="text-muted">${list1[i].grd_nm}</h6>
                                                        <p class="card-text">${list1[i].item_dsc}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <!--반복-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="container">
            <div class="row">
                <div class="col-8">
                    <a href="#" class="mb-3" style="font-size: 2rem; color: #ff9e07eb;font-weight: 500;">MAKE YOUR PROFILE MORE DRAMATIC!</a>
                </div>
                <div class="col-4 text-right">
                    <a class="btn btn-primary mb-3 mr-1" href="#carouselExampleIndicators3" role="button"
                       data-slide="prev">
                        <i class="fa fa-arrow-left"></i>
                    </a>
                    <a class="btn btn-primary mb-3 " href="#carouselExampleIndicators3" role="button"
                       data-slide="next">
                        <i class="fa fa-arrow-right"></i>
                    </a>
                </div>
                <div class="col-12">
                    <div id="carouselExampleIndicators3" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="row"><c:forEach var="i" begin="0" end="3">
                                        <div class="col-md-3 mb-3">
                                            <div class="card">
                                                <img class="img-fluid" alt="100%x280"
                                                     src="https://images.unsplash.com/photo-1532781914607-2031eca2f00d?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=7c625ea379640da3ef2e24f20df7ce8d">
                                                <div class="card-body">
                                                    <h4 class="card-title">${list2[i].item_nm}</h4>
                                                    <h6 class="text-muted">${list2[i].grd_nm}</h6>
                                                    <p class="card-text">${list2[i].item_dsc}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="row">
                                    <c:forEach var="i" begin="3" end="6">
                                        <div class="col-md-3 mb-3">
                                            <div class="card">
                                                <img class="img-fluid" alt="100%x280"
                                                     src="https://images.unsplash.com/photo-1532781914607-2031eca2f00d?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=7c625ea379640da3ef2e24f20df7ce8d">
                                                <div class="card-body">
                                                    <h4 class="card-title">${list2[i].item_nm}</h4>
                                                    <h6 class="text-muted">${list2[i].grd_nm}</h6>
                                                    <p class="card-text">${list2[i].item_dsc}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="row">
                                    <c:forEach var="i" begin="6" end="9">
                                        <div class="col-md-3 mb-3">
                                            <div class="card">
                                                <img class="img-fluid" alt="100%x280"
                                                     src="https://images.unsplash.com/photo-1532781914607-2031eca2f00d?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=7c625ea379640da3ef2e24f20df7ce8d">
                                                <div class="card-body">
                                                    <h4 class="card-title">${list2[i].item_nm}</h4>
                                                    <h6 class="text-muted">${list2[i].grd_nm}</h6>
                                                    <p class="card-text">${list2[i].item_dsc}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </section>
        <link rel="stylesheet" type="text/css"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css"
              href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script type="text/javascript"
                src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script type="text/javascript"
                src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    </div>
    <!-- Carousel wrapper -->
</main>
</body>
</html>