<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%@ page session="false" %>

<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('USERID')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="SURVEY" value="${pageContext.request.getSession(false).getAttribute('SURVEY')}"/>

<html lang="ko">

<head>
    <title>도파민!</title>
    <c:import url="/WEB-INF/views/common/default.jsp"/>
    <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/contents/contentsmain.css'/>">
    <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
</head>

<body>
<main>
    <c:import url="/WEB-INF/views/common/header.jsp"/>

    <div class="search-bg-image">
        <section class="container">
            <h1 class="search-main-text">지루할 땐 <b>DOPAMIN!</b></h1>
            <section class="container">
                <p class="search-sc-text">20여개의 OTT 서비스의 컨텐츠를 한번에 검색해보세요!</p>
                <div>
                    <form class="search-container"
                          action="<c:url value="/contents/search/${sc.keyword}"/>" method="get">
                        <select class="search-option" name="option">
                            <option value="total" ${ph.sc.option=='total' || ph.sc.option=='' ? "selected" : ""}>
                                통합검색
                            </option>
                            <option value="ttl" ${ph.sc.option=='ttl' ? "selected" : ""}>
                                제목/부제목
                            </option>
                            <option value="cast" ${ph.sc.option=='cast' ? "selected" : ""}>
                                감독/출연진
                            </option>
                            <option value="genre" ${ph.sc.option=='genre' ? "selected" : ""}>
                                장르별
                            </option>
                        </select>
                        <label class="search-input-wrapper">
                            <input type="text" class="main-search-input"
                                   placeholder="영화나 드라마 컨텐츠를 검색해보세요" aria-label="Type Keywords"
                                   name="keyword"
                                   value="${sc.keyword}"/>
                        </label>
                    </form>
                </div>
            </section>
        </section>
    </div>

    <div class="container">
        <c:if test="${pageContext.request.getSession(false)!=null}">
            <div class="recommend-content">
                <div class="recommend-mention"><b>${contentsUserDto.nic}</b> 님을 위한 추천 컨텐츠</div>
                <section class="contents">
                    <div class="swiper-container">
                        <div class="swiper-wrapper" style="height: 30rem;">
                            <div class="swiper-slide">
                                <div class="contents_container">
                                    <c:forEach var="i" end="4"
                                               items="${userContentsDtoList}"> <!--페이징 x 일단 다뿌리기-->
                                        <div class="detail-container"
                                             onclick="location.href='/psvm/contents/${i.cnts_id}'">
                                            <div id="poster-img"
                                                 style="margin-bottom: 0.1rem; border-radius: 0.3rem;">
                                                <img id="poster-image"
                                                     style="border-radius: 0.3rem;"
                                                     src="${i.cnts_postr_img}"
                                                     alt="${i.cnts_title}"/>
                                            </div>
                                            <div>
                                                <span class="contents_title"><b>${i.cnts_title}</b></span><br>
                                                <span class="item_nm">${i.cnts_subttl}</span>
                                                <span class="item_grd">${i.cnts_op_date} | ${i.cnts_cnty}</span><br>
                                            </div>
                                        </div>
                                        <br>
                                    </c:forEach>
                                </div>
                            </div>

                            <div class="swiper-slide">
                                <div class="contents_container">
                                    <c:forEach var="i" begin="5" end="9"
                                               items="${userContentsDtoList}"> <!--페이징 x 일단 다뿌리기-->
                                        <div class="detail-container"
                                             onclick="location.href='/psvm/contents/${i.cnts_id}'">
                                            <div id="poster-img"
                                                 style="margin-bottom: 0.1rem; border-radius: 0.3rem;">
                                                <img id="poster-image"
                                                     style="border-radius: 0.3rem;"
                                                     src="${i.cnts_postr_img}"
                                                     alt="${i.cnts_title}"/>
                                            </div>
                                            <div>
                                                <span class="contents_title"><b>${i.cnts_title}</b></span><br>
                                                <span class="item_nm">${i.cnts_subttl}</span>
                                                <span class="item_grd">${i.cnts_op_date} | ${i.cnts_cnty}</span><br>
                                            </div>
                                        </div>
                                        <br>
                                    </c:forEach>
                                </div>
                            </div>

                            <div class="swiper-slide">
                                <div class="contents_container">
                                    <c:forEach var="i" begin="10" end="14"
                                               items="${userContentsDtoList}"> <!--페이징 x 일단 다뿌리기-->
                                        <div class="detail-container"
                                             onclick="location.href='/psvm/contents/${i.cnts_id}'">
                                            <div id="poster-img"
                                                 style="margin-bottom: 0.1rem; border-radius: 0.3rem;">
                                                <img id="poster-image"
                                                     style="border-radius: 0.3rem;"
                                                     src="${i.cnts_postr_img}"
                                                     alt="${i.cnts_title}"/>
                                            </div>
                                            <div>
                                                <span class="contents_title"><b>${i.cnts_title}</b></span><br>
                                                <span class="item_nm">${i.cnts_subttl}</span>
                                                <span class="item_grd">${i.cnts_op_date} | ${i.cnts_cnty}</span><br>
                                            </div>
                                        </div>
                                        <br>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </c:if>


        <!--비로그인-->
        <c:if test="${pageContext.request.getSession(false)==null}">
            <div class="recommend-content">
                <div class="recommend-mention"><b>최근 인기작들을 확인해보세요!</b></div>
                <!--컨텐츠 슬라이드-->
                <section class="contents">
                    <div class="swiper-container">
                        <div class="swiper-wrapper" style="height: 30rem;">
                            <div class="swiper-slide">
                                <div class="contents_container">
                                    <c:forEach var="i" end="4"
                                               items="${cntsDtoList}"> <!--페이징 x 일단 다뿌리기-->
                                        <div class="detail-container"
                                             onclick="location.href='/psvm/contents/${i.cnts_id}'">
                                            <div id="poster-img"
                                                 style="margin-bottom: 0.1rem; border-radius: 0.3rem;">
                                                <img id="poster-image"
                                                     style="border-radius: 0.3rem;"
                                                     src="${i.cnts_postr_img}"
                                                     alt="${i.cnts_title}"/>
                                            </div>
                                            <div>
                                                <span class="contents_title"><b>${i.cnts_title}</b></span><br>
                                                <span class="item_nm">${i.cnts_subttl}</span>
                                                <span class="item_grd">${i.cnts_op_date} | ${i.cnts_cnty}</span><br>
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
                                            <div id="poster-img"
                                                 style="margin-bottom: 0.1rem; border-radius: 0.3rem;">
                                                <img id="poster-image"
                                                     style="border-radius: 0.3rem;"
                                                     src="${i.cnts_postr_img}"
                                                     alt="${i.cnts_title}"/>
                                            </div>
                                            <div>
                                                <span class="contents_title"><b>${i.cnts_title}</b></span><br>
                                                <span class="item_nm">${i.cnts_subttl}</span>
                                                <span class="item_grd">${i.cnts_op_date} | ${i.cnts_cnty}</span><br>
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
                                            <div id="poster-img"
                                                 style="margin-bottom: 0.1rem; border-radius: 0.3rem;">
                                                <img id="poster-image"
                                                     style="border-radius: 0.3rem;"
                                                     src="${i.cnts_postr_img}"
                                                     alt="${i.cnts_title}"/>
                                            </div>
                                            <div>
                                                <span class="contents_title"><b>${i.cnts_title}</b></span><br>
                                                <span class="item_nm">${i.cnts_subttl}</span>
                                                <span class="item_grd">${i.cnts_op_date} | ${i.cnts_cnty}</span><br>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
              </section>
            </div>
        </c:if>
    </div>
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
      speed: 2000,
    });
  })
</script>
</html>