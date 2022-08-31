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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/home.css?20210502'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        //등록 버튼 클릭시 한줄평 작성-> 등록
        function insertBtn(cnts_id) {
            // $("#insertBtn").click(function(){
            //console.log("click");
            //console.log(cnts_id);

            let review = $("input[name=review]").val();
            //console.log(review);

            if(review==[] || review.trim().length==0) {     //공백 문자열만 들어올 시 처리
                alert("내용을 입력해주세요!")
                return false
            }
            $.ajax({
                type: 'POST',   // 요청 메서드
                url: '/psvm/contents/' + cnts_id + '/writeReview',
                // data: JSON.stringify({cnts_id: cnts_id, revw_body: review}),
                data: {
                    "review": review
                },
                // headers: {"content-type": "application/json"}, // 요청 헤더
                success: function () {
                    alert("한줄평 등록이 완료되었습니다.")
                    location.replace('/psvm/contents/' + cnts_id + '/contentsReview')
                },
                error: function () {// 에러가 발생했을 때, 호출될 함수
                    alert("로그인 후 이용 가능합니다.")    //에러를 처리해야하는데 로그인 안한걸 에러로 처리하면 안될듯 수정사항.
                }
            }); // $.ajax()

        };

        //한줄평 수정 -> 유저 본인이 작성한 한줄평인지 alert 띄워줘야함
        function updateBtn(cnts_id, revw_id) {
            // $("#insertBtn").click(function(){
            console.log("click");
            console.log(cnts_id);
            console.log(revw_id);   //여기까지 찍힘

            let revw = $('div.revw', $(this).parent()).text()
            console.log(revw);

            $("input[name=revw]").val(revw);
            $("#updateBtn").attr("revw_id", revw_id);
            console.log(revw);


            if(revw==[] || revw.trim().length==0) {     //공백 문자열만 들어올 시 처리
                alert("수정할 내용을 입력해주세요!")
                return false
            }

            $.ajax({
                type: 'POST',       // 요청 메서드
                url: '/psvm/contents/' + cnts_id + '/modifyReview',
                data: {
                    data: {
                        "revw_id": revw_id,
                        "review": review
                    }
                },
                // headers: {"content-type": "application/json"}, // 요청 헤더
                success: function () {
                    alert("한줄평 수정이 완료되었습니다.")
                    location.replace('/psvm/contents/' + cnts_id + '/contentsReview')
                },
                error: function () {// 에러가 발생했을 때, 호출될 함수
                    alert("잠시 후 다시 시도해주세요.")
                }
            }); // $.ajax()
        };

        //한줄평 삭제 -> 유저 본인이 작성한 한줄평인지 alert 띄워줘야함
        function deleteBtn(cnts_id, revw_id) {
            //let revw_id = $(this).parent().attr("deleteBtn");
            //console.log(revw_id);
            //console.log(cnts_id);
            //console.log("click");
            //alert("여기까지")  //여기까지는 실행됨
            $.ajax({
                type: 'POST',       // 요청 메서드
                url: '/psvm/contents/' + cnts_id + '/deleteReview',
                data: {
                    "revw_id": revw_id
                },
                success: function () {
                    alert("한줄평이 삭제되었습니다.")
                    location.replace('/psvm/contents/' + cnts_id + '/contentsReview')
                },
                error: function () {// 에러가 발생했을 때, 호출될 함수
                    alert("삭제 권한이 없습니다.")
                    //location.replace('/psvm/contents/' + cnts_id + '/testReviewView')
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
                <option value="total" ${ph.sc.option=='total' || ph.sc.option=='' ? "selected" : ""}>통합검색</option>
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

<main>
    <section class="container">
        <h4 style="margin-top: 2rem; margin-left: 1rem; margin-bottom: 2rem;">한줄평 모아보기</h4>
        <div class="revw" style="justify-content: center; margin-bottom: 2rem;">
            <c:if test="${reviewDtoList==[]}">
                <br>
                <div>아직 작성된 한줄평이 없습니다. 첫 번째 한줄평을 작성해보세요!</div>     <!--페이지 고정 사이즈 줄것-->
                <br>
            </c:if>
            <table class="table">
                <thead>
                <tr>
                    <th style="width: 8rem;">작성자</th>
                    <th>한줄평</th>
                    <th>작성일</th>
                </tr>
                </thead>
                <div>
                    <c:forEach var="i" items="${reviewDtoList}">
                        <tr>
                            <td>${i.user_id}</td>
                            <td>${i.revw_body}</td>
                            <td><fmt:formatDate value="${i.in_date}" pattern="yyyy-MM-dd hh:mm:ss"/>
                                <div style="display: flex; width: 11rem;">
                                <button>좋아요 </button>
                                <button>싫어요</button>
                                <button>신고</button>
                                </div>
                            </td>
                            <td>
                                <div style="display: flex;">
                                <input type="button" value="수정" class="updateBtn"
                                       onclick="updateBtn(${i.cnts_id}, ${i.revw_id})">
                                <input type="button" value="삭제" class="deleteBtn"
                                       onclick="deleteBtn(${i.cnts_id}, ${i.revw_id})">
                                </div>
                            </td>

                        </tr>
                    </c:forEach>
                </div>

            </table>
            <!--한줄평 작성-->
            <hr>
            <div style="display: flex; justify-content: center; margin-top: 2rem; margin-bottom: 2rem;">
                <div><input type="text" name="review" style=" width: 30rem; height: 3rem;"></div>
                <div>
                    <input type="button" value="등록" class="insertBtn" style="width: 6rem; height: 3rem;"
                           onclick="insertBtn(${cnts_id})">
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
            <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
        </div>
        <!-- Copyright -->
    </div>
</footer>

</body>

</html>