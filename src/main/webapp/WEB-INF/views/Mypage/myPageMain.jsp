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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/myPage.css?20210502'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/user/myPage2.css?after'/>">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer">
    </script>

</head>

<body>
<script>
    let msg = "${msg}";
    if (msg != "") alert(msg);
</script>
<div class="container py-5">
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
<main>
    <section class="container py-5">

        <header class="py-5 bg-image-full"
                style="background-image: url('${empty myPageDto.item_img ? 'https://dummyimage.com/600x400/ff7800/ffffff&text=DOPAMIN' : myPageDto.item_img}')">
            <div class="text-center my-5">
                <img class="img-fluid rounded-circle mb-4" src="${myPageDto.prf_img}" alt="..."/>
                <h1 class="text-black fs-3 fw-bolder">${myPageDto.nic}님</h1>
                <p class="text-black mb-0">
                    <c:choose>
                        <c:when test="${empty myPageDto.fav_genre1}">
                            ${myPageDto.nic}님 설문 조사를 참여해주세요! 설문 링크 첨부
                        </c:when>
                        <c:otherwise>
                            ${myPageDto.nic}님은 ${myPageDto.genre_nm} 장르를
                            좋아하는 ${myPageDto.age}대 ${myPageDto.sex == 0 ? '여성' : '남성'}입니다.
                        </c:otherwise>
                    </c:choose>
                </p>
                <p class="text-black mb-0">dopa_point = ${myPageDto.dopa_point}</p>
            </div>
        </header>
    </section>
    <section class="container py-5">
        <div><h2>활동 기록</h2><br></div>
        <div class="row gx-lg-5">
            <div class="col-lg-6 col-xxl-4 mb-5">
                <div class="card bg-light border-0 h-100">
                    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0"
                         onclick="location.href='/psvm/mypage/revw'">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i
                                class="fa-solid fa-comment"></i></div>
                        <h2 class="fs-4 fw-bold">Contents Review</h2>
                        <p class="mb-0">작성한 컨텐츠 한줄평을 확인하세요!</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-xxl-4 mb-5">
                <div class="card bg-light border-0 h-100">
                    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0"
                         onclick="location.href='/psvm/mypage/revwrt'">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i
                                class="fa-solid fa-thumbs-up"></i></div>
                        <h2 class="fs-4 fw-bold">Contents Good Review</h2>
                        <p class="mb-0">좋아요 누른 컨텐츠 한줄평을 확인하세요!</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-xxl-4 mb-5">
                <div class="card bg-light border-0 h-100">
                    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0"
                         onclick="location.href='/psvm/mypage/cntswish'">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i
                                class="fa-solid fa-heart"></i></div>
                        <h2 class="fs-4 fw-bold">Contents Wish</h2>
                        <p class="mb-0">찜한 컨텐츠를 확인하세요!</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-xxl-4 mb-5">
                <div class="card bg-light border-0 h-100">
                    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0"
                         onclick="location.href='/psvm/mypage/cntsview'">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i
                                class="fa-solid fa-heart"></i></div>
                        <h2 class="fs-4 fw-bold">Contents View</h2>
                        <p class="mb-0">조회한 컨텐츠를 확인하세요!</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-xxl-4 mb-5">
                <div class="card bg-light border-0 h-100">
                    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0"
                         onclick="location.href='/psvm/mypage/post'">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i
                                class="fa-solid fa-comment-smile"></i></div>
                        <h2 class="fs-4 fw-bold">Community Post</h2>
                        <p class="mb-0">작성한 게시물를 확인하세요!!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="container py-5">

        <div><h2>회원 정보</h2><br></div>

        <div class="row gx-lg-5">
            <div class="col-lg-6 col-xxl-4 mb-5">
                <div class="card bg-light border-0 h-100">
                    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0" id="userInfo">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i
                                class="fa-solid fa-user"></i></div>
                        <h2 class="fs-4 fw-bold">Edit User Info</h2>
                        <p class="mb-0">회원정보를 수정하세요!</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-xxl-4 mb-5">
                <div class="card bg-light border-0 h-100">
                    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0"
                         onclick="location.href='/psvm/mypage/point'">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i
                                class="fa-solid fa-coins"></i></div>
                        <h2 class="fs-4 fw-bold">Points</h2>
                        <p class="mb-0">포인트 사용 내역을 확인하세요!</p>
                    </div>
                </div>
            </div>


            <div class="col-lg-6 col-xxl-4 mb-5">
                <div class="card bg-light border-0 h-100">
                    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0"
                         onclick="location.href='/psvm/mypage/myItem'">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i
                                class="fa-solid fa-gift"></i></div>
                        <h2 class="fs-4 fw-bold">My Items</h2>
                        <p class="mb-0">보유 아이템 목록을 확인하세요!</p>
                    </div>
                </div>
            </div>


        </div>

    </section>

    <div class="modal hidden">
        <div class="bg"></div>
        <div class="modal-box">
            <h5>비밀번호 확인</h5>
            <form action="<c:url value="/mypage/userInfo"/>" method="post" onsubmit="pwdCheck();">
                <input type="password" name="pwd" id="pwd" placeholder="비밀번호 입력">
                <div class="modal-btns">
                    <button type="button" class="closeBtn">닫기</button>
                    <button type="submit">확인</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function pwdCheck() {
            console.log("pwd=", $("#pwd").val())
            if ($("#pwd").val() == "") {
                alert("비밀번호를 입력해주세요!")
                event.preventDefault();
            }
        }

        const open = () => {
            console.log("모달창열기")
            document.querySelector(".modal").classList.remove("hidden");
        }
        const close = () => {
            console.log("닫기")
            document.querySelector(".modal").classList.add("hidden");
        }
        document.querySelector("#userInfo").addEventListener("click", open);
        document.querySelector(".closeBtn").addEventListener("click", close);
        document.querySelector(".bg").addEventListener("click", close);

    </script>

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
