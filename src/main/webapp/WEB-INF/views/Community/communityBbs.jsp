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
<html>
<html lang="ko">

<head>
    <title>도파민 커뮤니티</title>
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
    <section name="post-embeded-cnts-rank" class="container py-4">
        <div class="p-3 mb-2 rounded-3">
            <div class="container-fluid py-2">
                <div class="row justify-content-center">
                    <div class="rank-title">
                        <h3 class="display-10">실시간 커뮤니티 언급 컨텐츠 순위</h3>
                        <h6>(1시간 주기 - 최종 업데이트 14:00)</h6>
                    </div>
                    <div class="col-3">
                        <div id="carousel" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <a class="carousel-item active" data-bs-interval="5000" href="/">
                                    <img src=" https://an2-img.amz.wtchn.net/image/v2/LNt7XYXK72NUSKdPjXvl7A.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKdmNIUnpJanBiSW1SZk5Ea3dlRGN3TUhFNE1DSmRMQ0p3SWpvaUwzWXlMM04wYjNKbEwybHRZV2RsTHpFMk5Ua3pNVFUwTnpZNE1qWXpOVGd5T0RRaWZRLjVHMF9ES051bVp1R3YxQlRPeFM1OUxMTmxYdDJ6MEl1Mkd6eW1iWDNpRWM"
                                         name="poster1" alt="1st">
                                </a>
                                <a class="carousel-item" href="/">
                                    <img src="https://an2-img.amz.wtchn.net/image/v2/VIhs-V0Y2xudhRxr68wwiw.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKdmNIUnpJanBiSW1SZk5Ea3dlRGN3TUhFNE1DSmRMQ0p3SWpvaUwzWXlMM04wYjNKbEwybHRZV2RsTHpFMk5UazNOemd3TkRRME1EWXlPVGM1T1RnaWZRLlpzQ1AxQy1JZE91blNZTUh6M1JtdXNGa1RrcnJlc2cwN2VkWVAxOG1HdXM"
                                         alt="2nd">
                                </a>
                                <a class="carousel-item" href="/">
                                    <img src="https://an2-img.amz.wtchn.net/image/v2/e8k_5QLsioExL7jY1NRzpQ.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKdmNIUnpJanBiSW1SZk5Ea3dlRGN3TUhFNE1DSmRMQ0p3SWpvaUwzWXlMM04wYjNKbEwybHRZV2RsTHpFMk5qQTROekV3TnpNM01qYzRNRFEyT1RnaWZRLl9oZjB0LXFJUlFaS0JjSlBjODBfRlV2bzVDVjRlOV9HblZ1Z2E0b01fTmM"
                                         alt="3rd">
                                </a>
                                <a class="carousel-item" href="/">
                                    <img src="https://an2-img.amz.wtchn.net/image/v2/YUwgLWf5GjrzQYMDL6wfug.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKdmNIUnpJanBiSW1SZk5Ea3dlRGN3TUhFNE1DSmRMQ0p3SWpvaUwzWXlMM04wYjNKbEwybHRZV2RsTHpFMk5USTJPREUzTXpNeE56SXlNVEE1TmpjaWZRLi1YMnQ4bmxvaTI3U0RDMXZBaVJqSEdXWTFsdEREZjVIbTg1NWhYVHh5M1U"
                                         alt="4th">
                                </a>
                                <a class="carousel-item" href="/">
                                    <img src="https://an2-img.amz.wtchn.net/image/v2/joCUocgvsrbotaKpHVJM1g.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKdmNIUnpJanBiSW1SZk5Ea3dlRGN3TUhFNE1DSmRMQ0p3SWpvaUwzWXlMM04wYjNKbEwybHRZV2RsTHpFMk5UZ3lNREF6TWpFd01ETTFNVEE1TURNaWZRLkIxZ0djdU5MOEJNOVNsUUNaOExJNDhDd1M1QmxWTi0wS25paV9fRG9tWDA"
                                         alt="5th">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col d-flex align-items-center flex-wrap">
                        <ol class="list-group" start=0>
                            <a class="list-group-item my-2" aria-current="true" href="/">
									<span>
										<i class="fa-solid fa-arrow-up"></i>
										<span>1위</span>
										<span>헌트</span>
									</span>
                                <span>넷플릭스 디즈니 왓차</span>
                            </a>
                            <a class="list-group-item my-2" href="/">
									<span>
										<i class="fa-solid fa-minus"></i>
										<span>2위</span>
										<span>육사오(6/45)</span>
									</span>
                                <span>넷플릭스 왓차</span>
                            </a>
                            <a class="list-group-item my-2" href="/">
									<span>
										<i class="fa-solid fa-arrow-up"></i>
										<span>3위</span>
										<span>불릿 트레인</span>
									</span>
                            </a>
                            <a class="list-group-item my-2" href="/">
									<span>
										<i class="fa-solid fa-arrow-down"></i>
										<span>4위</span>
										<span>이상한 변호사 우영우</span>
									</span>
                            </a>
                            <a class="list-group-item my-2" href="/">
									<span>
										<i class="fa-solid fa-arrow-down"></i>
										<span>5위</span>
										<span>탑건: 매버릭</span>
									</span>
                            </a>
                        </ol>
                        <ol class="list-group" start=0>
                            <a class="list-group-item my-2" aria-current="true" href="/">
									<span>
										<i class="fa-solid fa-arrow-up"></i>
										<span>6위</span>
										<span>헌트</span>
									</span>
                                <span>넷플릭스 디즈니 왓차</span>
                            </a>
                            <a class="list-group-item my-2" href="/">
									<span>
										<i class="fa-solid fa-arrow-up"></i>
										<span>7위</span>
										<span>육사오(6/45)</span>
									</span>
                                <span>넷플릭스 왓차</span>
                            </a>
                            <a class="list-group-item my-2" href="/">
									<span>
										<i class="fa-solid fa-arrow-up"></i>
										<span>8위</span>
										<span>불릿 트레인</span>
									</span>
                            </a>
                            <a class="list-group-item my-2" href="/">
									<span>
										<i class="fa-solid fa-arrow-down"></i>
										<span>9위</span>
										<span>이상한 변호사 우영우</span>
									</span>
                            </a>
                            <a class="list-group-item my-2" href="/">
									<span>
										<i class="fa-solid fa-arrow-down"></i>
										<span>10위</span>
										<span>탑건: 매버릭</span>
									</span>
                            </a>
                        </ol>
                    </div>

                </div>
            </div>
        </div>
    </section>

    <section name="bbs" class="container py-2 mb-4">
        <div class="row align-items-stretch">
            <div class="col-6 mb-4 p-4">
                <div class="h-100 p-3">
                    <div class="bbs-title-wrapper">
                        <a href="/">
                            <h4 class="bbs-title">데일리 베스트</h4>
                        </a>
                    </div>
                    <div class="bbs-post-list">
                        <div id="1" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="2" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="3" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="4" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="5" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="6" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="7" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="8" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자is합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-6 mb-4 p-4 p-4">
                <div class="h-100 p-3">
                    <div class="bbs-title-wrapper">
                        <a href="/">
                            <h4 class="bbs-title">위클리 베스트</h4>
                        </a>
                    </div>
                    <div class="bbs-post-list">
                        <div id="1" class="post">
                            <a href="/">
									<span class="post-title">
										제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?
									</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="2" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="3" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="4" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="5" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="6" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="7" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="8" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-6 mb-4 p-4">
                <div class="h-100 p-3">
                    <div class="bbs-title-wrapper">
                        <a href="/">
                            <h4 class="bbs-title">영화 판</h4>
                        </a>
                    </div>
                    <div class="bbs-post-list">
                        <div id="1" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="2" class="post">
                            <a href="/">
                                <span class="post-title">제목 25이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="3" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="4" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="5" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="6" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="7" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="8" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-6 mb-4 p-4">
                <div class="h-100 p-3">
                    <div class="bbs-title-wrapper">
                        <a href="/">
                            <h4 class="bbs-title">드라마 판</h4>
                        </a>
                    </div>
                    <div class="bbs-post-list">
                        <div id="1" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="2" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="3" class="post">
                            <a href="/">
                                <span class="post-title">제넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="4" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="5" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="6" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="7" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="8" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-6 mb-4 p-4">
                <div class="h-100 p-3">
                    <div class="bbs-title-wrapper">
                        <a href="/">
                            <h4 class="bbs-title">일일 생성판#1</h4>
                        </a>
                    </div>
                    <div class="bbs-post-list">
                        <div id="1" class="post">
                            <a href="/">
                                <span class="post-title">제목 25넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="2" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="3" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="4" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자llipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="5" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="6" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="7" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미sis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="8" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-6 mb-4 p-4">
                <div class="h-100 p-3">
                    <div class="bbs-title-wrapper">
                        <a href="/">
                            <h4 class="bbs-title">일일 생성판#2</h4>
                        </a>
                    </div>
                    <div class="bbs-post-list">
                        <div id="1" class="post">
                            <a href="/">, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="2" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="3" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="4" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="5" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="6" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="7" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 미만, 25자 이상 넘으면 ellipsis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                        <div id="8" class="post">
                            <a href="/">
                                <span class="post-title">제목 25자 psis합니다?</span>
                                <span class="post-comment-cnt">24</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

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