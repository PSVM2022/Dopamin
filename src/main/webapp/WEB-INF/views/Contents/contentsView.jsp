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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/default.css'/>">
    <%--home.css 부분을 빼고 자기 페이지의 css를 넣으세요--%>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/contents/contentsview.css?after'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        function wishBtn(cnts_id) {
            //let revw_id = $(this).parent().attr("deleteBtn");
            console.log(cnts_id);

            console.log("click");
            //alert("여기까지")  //여기까지는 실행됨
            $.ajax({
                type: 'POST',       // 요청 메서드
                url: '/psvm/contents/' + cnts_id + '/wish',
                success: function () {
                    alert("컨텐츠 찜")
                    location.replace('/psvm/contents/' + cnts_id)
                },
                error: function () {// 에러가 발생했을 때, 호출될 함수
                    alert("컨텐츠 찜 취소")
                    location.replace('/psvm/contents/' + cnts_id)
                }
            }); // $.ajax()
        };
    </script>

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
            <li><a href="<c:url value="/mypage"/>" class="nav-link px-2 link-dark">마이페이지</a></li>
            <li><a href="<c:url value="/item/"/>" class="nav-link px-2 link-dark">상점</a></li>
        </ul>
        <form class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0"
              action="<c:url value="/contents/search/${sc.keyword}"/>" class="search-form" method="get">
            <select class="search-option" name="option">
                <option value="total" ${ph.sc.option=='total' || ph.sc.option=='' ? "selected" : ""}>통합</option>
                <option value="ttl" ${ph.sc.option=='ttl' ? "selected" : ""}>제목/부제목</option>
                <option value="cast" ${ph.sc.option=='cast' ? "selected" : ""}>감독/출연진</option>
                <option value="genre" ${ph.sc.option=='genre' ? "selected" : ""}>장르별</option>
            </select>
            <li><input type="text" class="form-control form-control-dark" name="keyword" class="search-input"
                       type="text" value="${sc.keyword}" placeholder="검색어를 입력해주세요." aria-label="Search"></li>
            <li>
                <button type="submit" class="btn btn-warning me-2">검색</button>
            </li>
        </form>

        <!--로그인/회원가입버튼-->
        <div class="text-end">
            <button type="button" class="btn btn-warning me-2" onclick="location.href='<c:url value="/login/login"/>';">
                Login
            </button>
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
    <section class="container">
        <!-- Carousel -->
        <div id="demo">
            <!-- 컨텐츠 포스터 들어갈 자리 -->
            <div class="col-12" style="display:flex;">
                <div class="contents-view">
                    <img class="img-fluid" src="${contentsDto.cnts_postr_img}"
                         alt="${contentsDto.cnts_title}"/>
                </div>
                <div class="contents-value">
                    <h4 class="title">${contentsDto.cnts_title}</h4>
                    <h6 class="subttle-text-muted">${contentsDto.cnts_subttl}</h6>
                    <hr>
                    <p class="text">${contentsDto.cnts_op_date}</p>
                    <p class="text">${contentsDto.cnts_cnty}</p>
                    <table>
                        <tr>
                            <td><p class="text">${contentsDto.cnts_genre1}&nbsp;&nbsp;</p></td>
                            <td><p class="text">${contentsDto.cnts_genre2}&nbsp;&nbsp;</p></td>
                            <td><p class="text">${contentsDto.cnts_genre3}&nbsp;&nbsp;</p></td>
                            <td><p class="text">${contentsDto.cnts_genre4}&nbsp;&nbsp;</p></td>
                            <td><p class="text">${contentsDto.cnts_genre5}</p></td>
                        </tr>
                    </table>
                    <p class="text">${contentsDto.cnts_rning_t}</p>
                    <p class="text">${contentsDto.cnts_g_rated}</p>
                    <p class="text">${contentsDto.cnts_director}</p>
                    <p class="text">${contentsDto.cnts_actor}</p>
                    <p class="text">${contentsDto.cnts_synop}</p>
                </div>
                <br>
            </div>
            <div>
                <div class="cnts-view-btn">
                    <input type="button" class="wishBtn" value="찜"
                           onclick="wishBtn(${contentsWishDto.cnts_id});"/>
                    <input type="button" class="like-btn" value="좋아요" onclick="alert('좋아요 평가 완료');"/>
                    <input type="button" class="dislike-btn" value="싫어요" onclick="alert('싫어요 평가 완료');"/>

                    <button class="show_cnts_rt" style="margin-left: 37rem; margin-top: 0.2rem; border-radius: 0.3rem;" type="button">
                        <a href="/psvm/contents/${contentsDto.cnts_id}/contentsReview/" class="nav-link px-2 link-dark">컨텐츠
                        한줄평 보러가기</a>
                    </button>

                </div>
                <br>

                <div class="ott">
                    <c:if test="${contentsDto.ott1_stat==1 || contentsDto.ott2_stat==1 || contentsDto.ott3_stat==1}">
                        <p class="text"> 감상 가능 OTT </p>
                        <c:if test="${contentsDto.ott1_stat==1}">
                            <div class="ott1ProImg" onclick="window.open('https://www.netflix.com/browse')"></div>
                        </c:if>
                        <c:if test="${contentsDto.ott2_stat==1}">
                            <div class="ott2ProImg" onclick="window.open('https://watcha.com/')"></div>
                        </c:if>
                        <c:if test="${contentsDto.ott3_stat==1}">
                            <div class="ott3ProImg" onclick="window.open('https://www.disneyplus.com/ko-kr')"></div>
                        </c:if>
                    </c:if>

                    <c:if test="${contentsDto.ott1_stat==0 && contentsDto.ott2_stat==0 && contentsDto.ott3_stat==0}">
                    <p class="text"> 컨텐츠를 시청할 수 있는 OTT 가 없습니다.</p>
                    </c:if>

                </div>

            </div>
        </div>
        </div>

    </section>

    <section class="container py-5"></section>

</main>

<footer class="footer mt-auto py-3 bg-light">
    <div class="container">
        <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
            <!-- Left -->
            <div class="me-5 d-none d-lg-block">
                <span>Get connected with us on social networks:</span>
            </div>
            <!-- Left -->

            <!-- Right -->
            <div>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-google"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-github"></i>
                </a>
            </div>
            <!-- Right -->
        </section>
        <!-- Section: Social media -->

        <!-- Section: Links  -->
        <section class="">
            <div class="container text-center text-md-start mt-5">
                <!-- Grid row -->
                <div class="row mt-3">
                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <!-- Content -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            <i class="fas fa-gem me-3"></i>Company name
                        </h6>
                        <p>
                            Here you can use rows and columns to organize your footer content. Lorem
                            ipsum
                            dolor sit amet, consectetur adipisicing elit.
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Products
                        </h6>
                        <p>
                            <a href="#!" class="text-reset">Angular</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">React</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Vue</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Laravel</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Useful links
                        </h6>
                        <p>
                            <a href="#!" class="text-reset">Pricing</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Settings</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Orders</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Help</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                        <p><i class="fas fa-home me-3"></i> New York, NY 10012, US</p>
                        <p>
                            <i class="fas fa-envelope me-3"></i>
                            info@example.com
                        </p>
                        <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
                        <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row -->
            </div>
        </section>
        <!-- Section: Links  -->

        <!-- Copyright -->
        <div class="text-center p-4 copyright">
            © 2021 Copyright:
            <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
        </div>
        <!-- Copyright -->
    </div>
</footer>

</body>

</html>