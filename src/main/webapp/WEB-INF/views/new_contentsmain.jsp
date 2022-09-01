<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page session="false" %>

<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('USERID')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>

<html lang="ko">
<head>
    <title>도파민!</title>
    <c:import url="/WEB-INF/views/common/default.jsp"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/contents/psvm.css'/>">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
</head>
<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>
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
                                  action="<c:url value="/contents/search/${sc.keyword}"/>"
                                  class="search-form"
                                  method="get">
                                <select class="search-option" name="option">
                                    <option value="ttl" ${ph.sc.option=='ttl' || ph.sc.option=='' ? "selected" : ""}>
                                        제목/부제목
                                    </option>
                                    <option value="cast" ${ph.sc.option=='cast' ? "selected" : ""}>
                                        감독/출연진
                                    </option>
                                    <option value="genre" ${ph.sc.option=='genre' ? "selected" : ""}>
                                        장르별
                                    </option>
                                </select>
                                <li><input type="text" class="form-search-control"
                                           placeholder="도파민 컨텐츠 검색창" aria-label="Type Keywords"
                                           aria-describedby="basic-addon2" name="keyword"
                                           class="search-input"
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
                            <div class="detail-container"
                                 onclick="location.href='/psvm/contents/${i.cnts_id}'">
                                <div id="poster-img" style="margin-bottom: 0.1rem">
                                    <img id="poster-image" src="${i.cnts_postr_img}"
                                         alt="${i.cnts_title}"/>
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
                        <c:forEach var="i" begin="5" end="9"
                                   items="${cntsDtoList}"> <!--페이징 x 일단 다뿌리기-->
                            <div class="detail-container"
                                 onclick="location.href='/psvm/contents/${i.cnts_id}'">
                                <div id="poster-img" style="margin-bottom: 0.1rem">
                                    <img id="poster-image" src="${i.cnts_postr_img}"
                                         alt="${i.cnts_title}"/>
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
                        <c:forEach var="i" begin="10" end="14"
                                   items="${cntsDtoList}"> <!--페이징 x 일단 다뿌리기-->
                            <div class="detail-container"
                                 onclick="location.href='/psvm/contents/${i.cnts_id}'">
                                <div id="poster-img" style="margin-bottom: 0.1rem">
                                    <img id="poster-image" src="${i.cnts_postr_img}"
                                         alt="${i.cnts_title}"/>
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
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
  <%--let surveyMsg = "${SUR_SUCCESS}"--%>
  if ("${SUR_SUCCESS}" != "") alert("${SUR_SUCCESS}")
  if ("${SUR_ERR}" != "") alert("${SUR_ERR}")

  <%--js스와이프--%>
  $(function () {
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
</html>