<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page session="false" %>
<%--  getsession(false)==null  기존에 세션이 없음을 의미.즉,로그인되어있지 않음. --%>
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<html lang="ko">

<head>
    <title>${bbsNm} 판 - 도파민</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="<c:url value='/image/favicon.png'/>">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Serif&display=swap"
          rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
          integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/normalize.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/default.css'/>">
    <link rel="stylesheet" type="text/css"
          href="<c:url value='/css/page/community/communityBbs.css'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type='text/javascript' src="<c:url value='/js/parseTime.js'/>"></script>
</head>

<body class="bg-light">
<div class="container">
    <!-- 헤더 컨테이너. 이 페이지는 로그아웃 상태의 페이지 -->
    <header
            class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start border-bottom">
        <a href="/"
           class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none px-3">
            <object data="<c:url value='/image/main_logo.svg' />" width="150" height="96"></object>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            <li><a href="#" class="nav-link px-2 link-secondary">홈</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">신규작</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">인기작</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">커뮤니티</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">이벤트</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">상점</a></li>
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

<main>
    <section name="bbs-rank" class="container py-3">
        <div class="bbs-title">
            <h3><a href="/">${bbsNm} 판</a></h3>
        </div>
        <div class="row recommand-post-wrapper">
            <div class="col-6">
                <ul>
                    <li id="1">
                        <a href="/" class="recommand-post">
                            <span class="post-title">가나다라마바사아차자파타</span>
                            <span class="user-name">nickname</span>
                        </a>
                    </li>
                    <li id="2">
                        <a href="/" class="recommand-post">
                            <span class="post-title">가나다라마바사아차바사아차자파타자파타</span>
                            <span class="user-name">nickname</span>
                        </a>
                    </li>
                    <li id="3">
                        <a href="/" class="recommand-post">
                            <span class="post-title">가나다라마바사아차자파타바사아차자파타</span>
                            <span class="user-name">nickname</span>
                        </a>
                    </li>
                    <li id="4">
                        <a href="/" class="recommand-post">
								<span
                                        class="post-title">가나다라마바사아차자파asdfdsafdsafasdfasdfdsafdsafsdafsdafas타바사아차자파타</span>
                            <span class="user-name-">nickname</span>
                        </a>
                    </li>
                    <li id="5">
                        <a href="/" class="recommand-post">
                            <span class="post-title">가나다라마바사아차자파타</span>
                            <span class="user-name">nickname</span>
                        </a>
                </ul>
            </div>
            <div class="col-6 row">
                <div class="col-4 img-wrapper">
                    <img src=" https://an2-img.amz.wtchn.net/image/v2/LNt7XYXK72NUSKdPjXvl7A.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKdmNIUnpJanBiSW1SZk5Ea3dlRGN3TUhFNE1DSmRMQ0p3SWpvaUwzWXlMM04wYjNKbEwybHRZV2RsTHpFMk5Ua3pNVFUwTnpZNE1qWXpOVGd5T0RRaWZRLjVHMF9ES051bVp1R3YxQlRPeFM1OUxMTmxYdDJ6MEl1Mkd6eW1iWDNpRWM"
                         alt="post1">
                </div>
                <div class="col">
                    <div class="recommanded-content-embed-post">
                        <b>
                            <h5>판 언급 횟수 1위 컨텐츠</h5>
                        </b>
                        <h6 class="post-content-name">육사오</h6>
                        <div class="post-content-synopsis">
                            제임스 카메론 감독의
                            비교불가한 연출력과 압도적인 영상미로
                            3D 장르의 신세계를 개척한 &lt;AVATAR&gt; 💙
                            오는 9월, 돌비 비전과 돌비 애트모스로
                            리마스터링 된 &lt;AVATAR&gt;가
                            돌비 시네마로 우리 곁을 다시 찾아옵니다
                            돌비 시네마로 우리 곁을 다시 찾아옵니다
                            돌비 시네마로 우리 곁을 다시 찾아옵니다
                            돌비 시네마로 우리 곁을 다시 찾아옵니다
                            돌비 시네마로 우리 곁을 다시 찾아옵니다
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section name="bbs" class="container py-3">
        <table class="bbs-page">
            <colgroup class="bbs-define-col">
                <col>
                <col>
                <col>
                <col>
                <col>
                <col>
            </colgroup>
            <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">글쓴이</th>
                <th scope="col">좋아요</th>
                <th scope="col">날짜</th>
                <th scope="col">조회수</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="post" items="${postList}">
                <tr class="bbs-post">
                    <td>
                        <c:choose>
                            <c:when test="${post.post_prior ne 1}"><b>공지</b></c:when>
                            <c:otherwise>${post.post_id}</c:otherwise>
                        </c:choose>
                    </td>
                    <td class="bbs-post-title">
                        <span>${post.post_title}</span>
                        <span class="post-comment-cnt">${post.post_reply_cnt}</span>
                    </td>
                    <td>${post.user_id}</td>
                    <td>0</td>
                    <td id='postTime_<c:out value="${post.post_id}"/>'></td>
                    <td>${post.post_view_cnt}</td>
                </tr>
                <script>$('#postTime_<c:out value="${post.post_id}"/>').text(
                    parseTime('<c:out value="${post.in_date}"/>'))</script>
            </c:forEach>
            </tbody>
        </table>
        <div class="button-wrapper">
            <button class="write-button">
                <i class="fa-solid fa-pencil"></i> 글쓰기
            </button>
        </div>
        <div class="pagination">
            <c:if test="${ph.showPrev}">
                <a href="<c:url value="/community/${bbsId}?page=${ph.beginPage - 1}"/>">
                    <i class="fa-solid fa-caret-left"></i>
                </a>
            </c:if>
            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                <a
                        <c:if test="${i eq ph.sc.page}">class="active"</c:if>
                        href="<c:url value="/community/${bbsId}?page=${i}"/>">${i}</a>
            </c:forEach>
            <c:if test="${ph.showNext}">
                <a href="<c:url value="/community/${bbsId}?page=${ph.endPage + 1}"/>">
                    <i class="fa-solid fa-caret-right"></i>
                </a>
            </c:if>
        </div>

        <div class="search-container">
            <form action="/" class="search-form" method="get">
                <select class="search-option" name="option">
                    <option value="all">제목+내용</option>
                    <option value="subject">제목</option>
                    <option value="content">내용</option>
                    <option value="comment">댓글</option>
                    <option value="writer">닉네임</option>
                </select>

                <input type="text" name="keyword" class="search-input" type="text" value=""
                       placeholder="검색">
                <input type="submit" class="search-button" value="검색">
            </form>

        </div>
    </section>
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
            <a class="text-reset fw-bold" href="https://dopamin.com/">dopamin.com</a>
        </div>
        <!-- Copyright -->
    </div>
</footer>
</body>
</html>