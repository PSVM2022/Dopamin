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
    <title>포스트제목 - 도파민</title>
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
          href="<c:url value='/css/page/community/communityPost.css'/>">
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
    <section name="post-main" class="container py-4">
        <div class="bbs-title">
            <h3><a href="/">데일리 베스트 판</a></h3>
        </div>

        <div class="post-target-title">새로운 아침이 밝았습니다. 시민들은 눈을뜨고</div>
        <div class="post-info">
            <span class="writer-id">
                <i class="fa-solid fa-award"></i>
                도파맨
            </span>
            <span class="post-time">
                <i class="fa-solid fa-clock"></i>
                2시간 전
            </span>
            <span class="post-views">
                <i class="fa-solid fa-eye"></i>
                1234
            </span>
        </div>
        <div class="post-link">
            <i class="fa-solid fa-link"></i>
            http://localhost:8080/psvm/post/100
        </div>

        <div class="post-content">
            대통령으로 선거될 수 있는 자는 국회의원의 피선거권이 있고 선거일 현재 40세에 달하여야 한다. 체포·구속·압수 또는 수색을 할 때에는 적법한 절차에 따라
            검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다. 다만, 현행범인인 경우와 장기 3년 이상의 형에 해당하는 죄를 범하고 도피 또는 증거인멸의 염려가
            있을 때에는 사후에 영장을 청구할 수 있다.

            이 헌법시행 당시의 법령과 조약은 이 헌법에 위배되지 아니하는 한 그 효력을 지속한다. 대법관은 대법원장의 제청으로 국회의 동의를 얻어 대통령이 임명한다.
        </div>

        <div class="post-reaction">
            <button>
                <i class="fa-regular fa-thumbs-up"></i>
                좋아요
                <span>12</span>
            </button>
            <button>
                <i class="fa-regular fa-thumbs-up"></i>
                싫어요
            </button>
            <button>
                <i class="fa-solid fa-share-nodes"></i>
                공유
            </button>
        </div>

        <div class="comments-box">
            <div class="comment-cnt">
                <i class="fa-solid fa-comments"></i>
                <span>14</span>
                개의 댓글
            </div>

            <div class="comment">
                <div class="comment-user-info">
                    <span class="writer-id">
                        <i class="fa-solid fa-award"></i>
                        도파맨
                    </span>
                    <span>22/08/27</span>
                </div>

                <div class="comment-content">
                    국회나 그 위원회의 요구가 있을 때에는 국무총리·국무위원 또는 정부위원은 출석·답변하여야 하며, 국무총리 또는 국무위원이 출석요구를 받은 때에는
                    국무위원 또는 정부위원으로 하여금 출석·답변하게 할 수 있다.

                    여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의
                    형의 선고에 의하지 아니하고는 파면되지 아니한다.
                </div>

                <div class="comment-reaction">
                    <button>좋아요 <span>14</span></button>
                    <button>싫어요</button>
                    <button>댓글</button>
                    <button><i class="fa-solid fa-flag"></i>신고</button>
                </div>
            </div>

            <div class="comment re-comment">
                <div class="comment-user-info">
                    <span class="writer-id">
                        <i class="fa-solid fa-award"></i>
                        도파맨
                    </span>
                    <span>22/08/27</span>
                </div>

                <div class="comment-content">
                    국회나 그 위원회의 요구가 있을 때에는 국무총리·국무위원 또는 정부위원은 출석·답변하여야 하며, 국무총리 또는 국무위원이 출석요구를 받은 때에는
                    국무위원 또는 정부위원으로 하여금 출석·답변하게 할 수 있다.

                    여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 헌법재판소 재판관은 탄핵 또는 금고 이상의
                    형의 선고에 의하지 아니하고는 파면되지 아니한다.
                </div>

                <div class="comment-reaction">
                    <button>좋아요 <span>14</span></button>
                    <button>싫어요</button>
                    <button>댓글</button>
                    <button><i class="fa-solid fa-flag"></i>신고</button>
                </div>
            </div>
        </div>

    </section>

    <section name="pagination" class="container py-2 mb-4">
        <div class="pagination">
            <a href="#" class="active">1</a>
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
            <tr class="bbs-post">
                <td>100</td>
                <td class="bbs-post-title">
                    <span>제목 25자 미넘으면 elf다?</span>
                    <span class="post-comment-cnt">24</span>
                </td>
                <td>테슬라맨</td>
                <td>144</td>
                <td>22/08/25</td>
                <td>12451</td>
            </tr>
            </tbody>
        </table>

        <div class="button-wrapper">
            <button class="write-button">
                <i class="fa-solid fa-pencil"></i> 글쓰기
            </button>
        </div>

        <div class="pagination">
            <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a href="#" class="active">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">6</a>
            <a href="#">&raquo;</a>
        </div>

        <div class="search-container">
            <form action="/" class="search-form" method="get">
                <select class="search-option" name="option">
                    <option value="all">제목+내용</option>
                    <option value="subject">제목</option>
                    <option value="content">내용</option>
                    <option value="comment">댓글</option>
                    <option value="writer">닉네임</option>
                    s
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