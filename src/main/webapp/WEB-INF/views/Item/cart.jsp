<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page session="false" %>
<%-- getsession(false)==null 기존에 세션이 없음을 의미.즉,로그인되어있지 않음. --%>
<% response.setHeader("Cache-Control", "no-cache" ); response.setHeader("Pragma", "no-cache" );
    response.setDateHeader("Expires", 0); %>
<%-- jsp 작성할 때만 브라우저 캐싱 금지 --%>
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('USERID')}" />
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
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" type="text/css"
          href="<c:url value='/css/common/normalize.css'/>">
    <link rel="stylesheet" type="text/css"
          href="<c:url value='/css/common/default.css'/>">
    <%--home.css 부분을 빼고 자기 페이지의 css를 넣으세요--%>
    <link rel="stylesheet" type="text/css"
          href="<c:url value='/css/page/cart.css?after'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer">
    </script>
    <script>
        $(document).ready(function() {
            let point=Number($('#amount_price').text().split(" ",1));
            //let total_point=Number($('#total_point').text().split(" ",1));
            if(point<0){
                $("#amount_price").css("color", "#f00");
            }//$("test2 li").css("color", "#f00");
            $('#buy_item').click(function(){
                console.log("click");
                if(point<0){
                    if(confirm("포인트가 부족합니다. 포인트 충전하러 갈까요?")){
                        //충전페이지로 이동.
                    }
                }
                else{
                    if(confirm("구매하시겠습니까?")){
                        let count=$('#list_size').val();
                        let dto_array=new Array();
                        for(let i=0;i<count;i++){
                            let dto={"item_id":$('#id'+i).val(),"item_nm":$('#nm'+i).val(),"item_price":$('#price'+i).val()}
                            dto_array.push(dto);
                        }
                        $.ajax({
                            url:'/psvm/item/buyCart',
                            type:'POST',
                            headers : { "content-type": "application/json"},
                            data:JSON.stringify(dto_array),
                            success:function(data){
                                alert("구매가 확정되었습니다.");
                                location.reload();
                            },
                            error:function(request,status,error){
                                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                            }
                        })
                    }
                }
            });
            $('#multi1').on("click",".btn-close",function(){
                let item_id=$(this).parent().attr("data-item_id");
                $.ajax({
                    type:'DELETE',
                    url:'/psvm/item/deleteCart/'+item_id,
                    success:function(result){
                        alert(result);
                        location.reload();
                    },
                    error:function(){
                        alert("삭제에 실패했습니다. 잠시후 다시 시도해주세요,");
                    }
                })
            });
        })
    </script>

<body>
<div class="container">
    <!-- 헤더 컨테이너. 이 페이지는 로그아웃 상태의 페이지 -->
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start border-bottom">
        <a href="<c:url value='/'/>"
           class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none px-3">
            <object data="<c:url value='/image/main_logo.svg' />" width="150" height="96"></object>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            <li><a class="nav-link px-2 link-secondary" href="#">홈</a></li>
            <li><a class="nav-link px-2 link-dark" href="#">신규작</a></li>
            <li><a class="nav-link px-2 link-dark" href="#">인기작</a></li>
            <li><a class="nav-link px-2 link-dark" href="#">커뮤니티</a></li>
            <li><a class="nav-link px-2 link-dark" href="#">이벤트</a></li>
            <li><a class="nav-link px-2 link-dark" href="/psvm/item/">상점</a></li>
        </ul>
        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
            <input aria-label="Search" class="form-control form-control-dark" placeholder="Search..." type="search">
        </form>
        <div class="text-end">
            <button class="btn btn-warning me-2" type="button">Login</button>
        </div>
    </header>
</div>
<main>
    <div class="container" style="margin-bottom: 2rem; margin-top: 2rem;">
        <div class="col-12">
            <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                <div class="card-body p-0">
                    <div class="row g-0">
                        <div class="col-lg-8">
                            <div id="multi1" class="p-5">
                                <div id="count_list" class="d-flex justify-content-between align-items-center mb-5">
                                    <h1 class="fw-bold mb-0 text-black">장바구니</h1>
                                    <h6 class="mb-0 text-muted">${list.size()} items</h6>
                                </div>
                                <hr class="my-4">
                                <c:forEach var="i" begin="1" end="${list.size()}">
                                    <div class="row mb-4 d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img5.webp"
                                                 class="img-fluid rounded-3" alt="Cotton T-shirt">
                                        </div>
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <h6 class="text-muted">${list[i-1].list_nm}</h6>
                                            <h6 class="text-muted">${list[i-1].grd_nm}</h6>
                                            <input type="hidden" id="nm${i-1}" value="${list[i-1].item_nm}">
                                            <h6 class="text-black mb-0">${list[i-1].item_nm}</h6>
                                        </div>
                                        <div class="col-md-4 col-lg-4 col-xl-4">
                                            <h6 class="text-black mb-0">${list[i-1].item_dsc}</h6>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <input type="hidden" id="price${i-1}" value="${list[i-1].item_price}">
                                            <h6 id="item_price" class="mb-0">${list[i-1].item_price} DP</h6>
                                        </div>
                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end" data-item_id="${list[i-1].item_id}">
                                            <input type="hidden" id="id${i-1}" value="${list[i-1].item_id}">
                                            <button type="button" class="btn-close" aria-label="Close"></button>
                                        </div>
                                    </div>
                                    <hr class="my-4">
                                </c:forEach>
                                <div class="pt-5">
                                    <h6 class="mb-0">
                                        <a href="#!" class="text-body">
                                        <i class="fas fa-long-arrow-alt-left me-2">
                                        </i>상점으로 돌아가기
                                        </a>
                                    </h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 bg-grey">
                            <div class="p-5" style="background-color: #eae8e8;">
                                <h3 class="fw-bold mb-5 mt-2 pt-1">결제정보</h3>
                                <hr class="my-4">

                                <div class="d-flex justify-content-between mb-4">
                                    <h5 class="text-uppercase">보유 포인트</h5>
                                    <h5 id="my_point" val="${my_point}">${my_point} DP</h5>
                                </div>

                                <div class="d-flex justify-content-between mb-4">
                                    <h5 class="text-uppercase">상품 금액</h5>
                                    <h5 id="total_point" val="${total_point}">${total_point} DP</h5>
                                </div>
                                <div class="d-flex justify-content-between mb-4">
                                    <h5 class="text-uppercase">할인 금액</h5>
                                    <h5>0 DP</h5>
                                </div>
                                <hr class="my-4">
                                <div id="amount" class="d-flex justify-content-between mb-5">
                                    <h5 class="text-uppercase">결제 예정 포인트</h5>
                                    <h5 id="amount_price">${after_point} DP</h5>
                                </div>
                                <div class="item_id"><input type="hidden" id="list_size" value="${list.size()}"></div>
                                <button type="button" id="buy_item" class="btn btn-dark btn-block btn-lg" data-mdb-ripple-color="yellow" style="margin-left: 7rem;">구매하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
                <a class="me-4 text-reset" href="">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a class="me-4 text-reset" href="">
                    <i class="fab fa-twitter"></i>
                </a>
                <a class="me-4 text-reset" href="">
                    <i class="fab fa-google"></i>
                </a>
                <a class="me-4 text-reset" href="">
                    <i class="fab fa-instagram"></i>
                </a>
                <a class="me-4 text-reset" href="">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a class="me-4 text-reset" href="">
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
                            Here you can use rows and columns to organize your footer content. Lorem ipsum
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
                            <a class="text-reset" href="#!">Angular</a>
                        </p>
                        <p>
                            <a class="text-reset" href="#!">React</a>
                        </p>
                        <p>
                            <a class="text-reset" href="#!">Vue</a>
                        </p>
                        <p>
                            <a class="text-reset" href="#!">Laravel</a>
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
                            <a class="text-reset" href="#!">Pricing</a>
                        </p>
                        <p>
                            <a class="text-reset" href="#!">Settings</a>
                        </p>
                        <p>
                            <a class="text-reset" href="#!">Orders</a>
                        </p>
                        <p>
                            <a class="text-reset" href="#!">Help</a>
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
            <!-- Section: Links  -->

            <!-- Copyright -->
            <div class="text-center p-4 copyright">
                © 2021 Copyright:
                <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
            </div>
            <!-- Copyright -->
        </section>
    </div>
</footer>
</body>
</html>

<%--<script>--%>
<%--    let cart_list=function(){--%>
<%--        $.ajax({--%>
<%--            type:'GET',--%>
<%--            url:'/psvm/item/cart/list',--%>
<%--            data:'JSON',--%>
<%--            success: function(result){--%>
<%--                alert(result.length);//갯수출력--%>
<%--                $.each(result,function(index,item){--%>
<%--                    $("#item_nm").append('<h6 class="text-muted">Shirt</h6>');--%>
<%--                });--%>
<%--                // $("#cart_list").html(toHtml(result));--%>
<%--                // let str=JSON.stringify(result);--%>
<%--                //--%>
<%--                // console.log(result);--%>
<%--            },--%>
<%--            error: function(){--%>
<%--                alert("error");--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>
<%--    $(document).ready(function(){--%>
<%--        cart_list();--%>
<%--    });--%>
<%--</script>--%>
