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
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}" />
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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common/item.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/item/bootstrap.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/item/ui.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/item/responsive.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/item/all.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/item/cart_main.css?after'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/page/home.css?20210502'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer">
    </script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script>
        // let num=8;
        // let toHtml=function(comments){
        //     let tmp="";
        //     comments.forEach(function(comment){
        //         let i=0;
        //         tmp+='<div id="item_card" class="col-md-3" ><div id="item_img" class="card card-product-grid" style="height:24rem;">'
        //         tmp+='<a class="img-wrap" data-item_id='+comment.item_id+'>'
        //         tmp+='<img src="/css/image/items/1.jpg">'
        //         tmp+='<button class="insertCart">장바구니에 담기</button></a>'
        //         tmp+='<figcaption class="info-wrap">'
        //         tmp+='<input type="hidden" id="id'+i
        //         tmp+='value='+comment.item_id+'>'
        //         tmp+='<h5 class="title">'+comment.item_nm+'</h5>'
        //         tmp+='<h6>'+comment.item_dsc+'</h6>'
        //         tmp+='<div class="price mt-1">'+comment.item_price+' DP</div>'
        //         tmp+='</figcaption></div></div>'
        //         i=i+1;
        //     })
        // }
        // let showList=function(num){
        //     $.ajax({
        //         type:'GET',
        //         url:'/psvm/item/item?num='+num,
        //         success:function(result){
        //             $("#multi").html(toHtml(result));
        //         },
        //         error:function(){alert("error")}
        //     })
        // }
        $(document).ready(function(){
            // $('#next').click(function(){
            //     showList(num);//수정필요
            // });
            $('#multi').on("click",".insertCart",function(){
                let item_id=$(this).parent().attr("data-item_id");
                console.log(item_id);
                if(confirm("장바구니에 담으시겠습니까?")){
                    $.ajax({
                        type:'POSt',
                        url:'/psvm/item/addCart/'+item_id,
                        success:function(result){
                            alert("장바구니에 담겼습니다.");
                            location.reload();
                        },
                        error:function(){
                            alert("잠시후 다시 시도해주세요.");
                        }
                    })
                }
            });
        });
    </script>
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
            <li><a href="#" class="nav-link px-2 link-secondary">홈</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">신규작</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">인기작</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">커뮤니티</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">이벤트</a></li>
            <li><a href="/psvm/item/" class="nav-link px-2 link-dark">상점</a></li>
        </ul>
        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
            <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
        </form>
        <div class="text-end">
            <button type="button" class="btn btn-warning me-2">Login</button>
        </div>
    </header>
</div>
<section class="section-main bg padding-y">
    <div class="container">
        <div class="row">
            <aside class="col-md-3">
                <nav class="card">
                    <ul class="menu-category">
                        <li class="has-submenu"><a href="#">아이템 목록</a>
                            <ul class="submenu">
                                <li><a href="/psvm/item/list/스킨">프로필 스킨</a></li>
                                <li><a href="/psvm/item/list/꾸미기">프로필 꾸미기</a></li>
                                <li><a href="#">-----Getting ready-----</a></li>
                                <li><a href="#">-----Getting ready-----</a></li>
                            </ul>
                        </li>
                        <li><a href="/psvm/item/cart">장바구니</a></li>
                        <li><a href="#">보유 아이템 목록</a></li>
                        <li><a href="#">거래 내역</a></li>
                        <li><a href="#">포인트 사용 내역</a></li>
                        <li><a href="#">포인트 충전</a></li>
                    </ul>
                </nav>
            </aside> <!-- col.// -->
            <div class="col-md-9">
                <article class="banner-wrap">
                    <img src="assets/images/2.jpg" class="w-100 rounded">
                </article>
            </div> <!-- col.// -->
        </div> <!-- row.// -->
    </div> <!-- container //  -->
</section>
<section class="section-name padding-y-sm">
    <div id="multi1" class="container">
        <header class="section-heading">
            <a href="#" class="btn btn-outline-primary float-end">더보기</a>
            <h3 class="section-title">인기 상품</h3>
        </header><!-- sect-heading -->
        <button id="prev">이전</button>
        <button id="next">다음</button>
        <div id="multi" class="row">
            <c:forEach var="i" begin="0" end="7">
                <div id="${i}" class="col-md-3" >
                    <div id="item_img" class="card card-product-grid" style="height:24rem;">
                        <a class="img-wrap" data-item_id="${list[i].item_id}">
                            <img src="/css/image/items/1.jpg">
                            <button class="insertCart">장바구니에 담기</button>
                        </a>
                        <figcaption class="info-wrap">
                            <input type="hidden" id="id${i}" value="${list[i].item_id}">
                            <h5 class="title">${list[i].item_nm}</h5>
                            <h6>${list[i].item_dsc}</h6>
                            <div class="price mt-1">${list[i].item_price} DP</div>
                        </figcaption>
                    </div>
                </div> <!-- col.// -->
            </c:forEach>
        </div> <!-- row.// -->
    </div><!-- container // -->
</section>
<section class="section-name padding-y bg">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h3>Download app demo text</h3>
                <p>Get an amazing app to make Your life easy</p>
            </div>
            <div class="col-md-6 text-md-end">
                <a href="#"><img src="assets/images/misc/appstore.png" height="40"></a>
                <a href="#"><img src="assets/images/misc/appstore.png" height="40"></a>
            </div>
        </div> <!-- row.// -->
    </div><!-- container // -->
</section>

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

<!-- ========================= FOOTER END // ========================= -->
</body>

</html>


