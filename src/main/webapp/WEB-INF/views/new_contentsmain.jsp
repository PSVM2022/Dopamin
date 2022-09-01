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
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('USERID')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<html>
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
    <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/default.css'/>">
    <%--home.css 부분을 빼고 자기 페이지의 css를 넣으세요--%>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/contents/psvm.css'/>">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer">
    </script>
    <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
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
            <input type="search" class="form-control form-control-dark" placeholder="Search..."
                   aria-label="Search">
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
<script>
    <%--let surveyMsg = "${SUR_SUCCESS}"--%>
    if ("${SUR_SUCCESS}" != "") alert("${SUR_SUCCESS}")
    if ("${SUR_ERR}" != "") alert("${SUR_ERR}")

    <%--js스와이프--%>
    $(function() {
        new Swiper('.contents .swiper-container', {
            slidesPerView: 1, //한번에 보여줄 개수
            autoplay: true, // 자동 재생 여부
            loop: true, // 반복 재생 여부
            navigation: {
                prevEl: '.contents .swiper-prev',   //이전 슬라이드를 볼 수 있음
                nextEl: '.contents .swiper-next'    //이후 슬라이드를 볼 수 있음
            }
        });
    })
</script>

<main>

    <div class="bg-image"
         style="background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJmR8LF39ptV7-8XwO-3fw1VV0iU0cXa46-A&usqp=CAU'); height: 28rem;">
        <section class="container">
            <h1 class="search-top-text">DOPAMIN</h1>
            <section class="container py-2">
                <div class="col">
                    <p class="text-center text-white">Search Contents!</p>
                    <div class="col-10-auto">
                        <div class="input-group">
                            <!--검색창 가운데정렬(col-lg-auto me-lg-auto 이거 빼주면 됨) : option 손봐야함-->
                            <form class="nav col-12 justify-content-center"
                                  action="<c:url value="/contents/search/${sc.keyword}"/>" class="search-form"
                                  method="get">
                                <select class="search-option" name="option">
                                    <option value="ttl" ${ph.sc.option=='ttl' || ph.sc.option=='' ? "selected" : ""}>
                                        제목/부제목
                                    </option>
                                    <option value="cast" ${ph.sc.option=='cast' ? "selected" : ""}>감독/출연진</option>
                                    <option value="genre" ${ph.sc.option=='genre' ? "selected" : ""}>장르별</option>
                                </select>
                                <li><input type="text" class="form-search-control"
                                           placeholder="도파민 컨텐츠 검색창" aria-label="Type Keywords"
                                           aria-describedby="basic-addon2" name="keyword" class="search-input"
                                           value="${sc.keyword}"/>
                                </li>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </section>
    </div>

    <!--컨텐츠 슬라이드-->
    <section class="contents">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="contents_container">
                        <c:forEach var="i" end="4" items="${cntsDtoList}"> <!--페이징 x 일단 다뿌리기-->
                            <div class="detail-container" onclick="location.href='/psvm/contents/${i.cnts_id}'">
                                <div id="poster-img" style="margin-bottom: 0.1rem">
                                    <img id="poster-image" src="${i.cnts_postr_img}" alt="${i.cnts_title}"/>
                                </div>
                                <div>
                                    <span class="contents_title">${i.cnts_title}</span><br>
                                    <span class="item_nm">${i.cnts_subttl}</span>
                                    <span class="item_grd">${i.cnts_op_date} : ${i.cnts_cnty}</span><br>
                                </div>
                            </div>
                            <br>
                        </c:forEach>
                    </div>
                </div>

                <div class="swiper-slide">
                    <div class="contents_container">
                        <c:forEach var="i" begin="5" end="9" items="${cntsDtoList}"> <!--페이징 x 일단 다뿌리기-->
                            <div class="detail-container" onclick="location.href='/psvm/contents/${i.cnts_id}'">
                                <div id="poster-img" style="margin-bottom: 0.1rem">
                                    <img id="poster-image" src="${i.cnts_postr_img}" alt="${i.cnts_title}"/>
                                </div>
                                <div>
                                    <span class="contents_title">${i.cnts_title}</span><br>
                                    <span class="item_nm">${i.cnts_subttl}</span>
                                    <span class="item_grd">${i.cnts_op_date} : ${i.cnts_cnty}</span><br>
                                </div>
                            </div>
                            <br>
                        </c:forEach>
                    </div>
                </div>

                <div class="swiper-slide">
                    <div class="contents_container">
                        <c:forEach var="i" begin="10" end="14" items="${cntsDtoList}"> <!--페이징 x 일단 다뿌리기-->
                            <div class="detail-container" onclick="location.href='/psvm/contents/${i.cnts_id}'">
                                <div id="poster-img" style="margin-bottom: 0.1rem">
                                    <img id="poster-image" src="${i.cnts_postr_img}" alt="${i.cnts_title}"/>
                                </div>
                                <div>
                                    <span class="contents_title">${i.cnts_title}</span><br>
                                    <span class="item_nm">${i.cnts_subttl}</span>
                                    <span class="item_grd">${i.cnts_op_date} : ${i.cnts_cnty}</span><br>
                                </div>
                            </div>
                            <br>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="swiper-prev">
            <div class="material-icons">chevron_left</div>
        </div>
        <div class="swiper-next">
            <div class="material-icons">chevron_right</div>
        </div>
    </section>


</main>

</body>

</html>