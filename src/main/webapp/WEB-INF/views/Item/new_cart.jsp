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
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>

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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/item/psvm.css?after'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer">
    </script>
    <script>
        let toHtml1=function(items){
            let tmp1='<div class="delete_select_entire"> 전체 선택 | 선택 삭제 </div>';
                items.list.forEach(function(item){
                    tmp1+='<div class="item-num" data-item_id='+item.item_id+'>';
                    tmp1+='<div class="image-wrap_cart">';
                    tmp1+='<img class="cart-image" src='+item.item_img+'>';
                    tmp1+='</div>';
                    tmp1+='<div class="cart_item_info">';
                    tmp1+='<div class="cart_item_detail" style="font-size: 1.1rem; font-weight: 500;">'+item.item_nm+'</div>';
                    tmp1+='<div style="display:flex; font-size: 0.8rem;">'
                    tmp1+='<div class="cart_item_detail" style="width: 3rem;">'+item.grd_nm+'</div>';
                    tmp1+='<div class="cart_item_detail">'+item.list_nm+'</div>';
                    tmp1+='</div>'
                    tmp1+='<div class="cart_item_dsc">'+item.item_dsc+'</div>';
                    tmp1+='</div>';
                    tmp1+='<div class="cart_item_price">'+item.item_price+' DP</div>';
                    tmp1+='<buuton class="closed">x</buuton>';
                    tmp1+='</div>';
                })
            return tmp1
        }
        let toHtml2=function(items){
            let tmp2='';
            tmp2+='<div class="cart_point">';
            tmp2+='<div class="pay_info"> 결제 예정금액 </div>';
            tmp2+='<div class="cart_item_pay_info">';
            tmp2+='<div class="more_info"><span class="item_info">상품수</span><span class="numberofitem">'+items.list.length+' 개</span></div>';
            tmp2+='<div class="more_info"><span class="item_info">보유 금액</span><span class="numberofitem">'+items.my_point+' DP</span></div>';
            tmp2+='<div class="more_info"><span class="item_info">상품금액</span><span class="numberofitem"  style="color:red;">'+items.total_point+' DP</span></div>';
            tmp2+='<div class="more_info"><span class="item_info">할인금액</span><span class="numberofitem">0개</span></div>';
            tmp2+='</div>';
            tmp2+='<div class="total_info"><span class="total_amount">총 결제금액</span><span class="total_money">'+items.after_point+' DP</span></div>';
            tmp2+='<button class="buy_button">구매하기</button>';
            return tmp2+"</div>"
        }
        $(document).ready(function(){
            const price = document.getElementsByClassName("numberofitem");
            const _value = parseInt(price.innerHTML);
            const priceChange = _value ? parseInt(_value).toLocaleString("ko-KR") : 0
            price.innerHTML = priceChange;

            $('.cart_item').on("click",".closed",function(){
                let item_id=$(this).parent().attr("data-item_id");
                console.log(item_id);
                $.ajax({
                    type:'DELETE',
                    url:'/psvm/item/deleteCart/'+item_id,
                    success:function(result){
                        alert(result);
                        location.reload();
                    },
                    error:function(){
                        alert("삭제에 실패했습니다. 잠시후 다시 시도해주세요.");
                    }
                })
            })
            $.ajax({
                type:'GET',
                url:'/psvm/item/cart_main',
                success:function(result){
                    console.log(result)
                    $('.cart_item').html(toHtml1(result));
                    $('#cart_detail_price').html(toHtml2(result));
                    let point=Number($('.total_money').text().split(' ',1)[0]);
                    console.log("총결제금액="+point);
                    if(point<0){
                        $(".total_money").css("color", "#f00");
                    }//$("test2 li").css("color", "#f00");
                    $('.buy_button').click(function(){
                        console.log("click");
                        if(point<0){
                            if(confirm("포인트가 부족합니다. 포인트 충전하러 갈까요?")){
                                //충전페이지로 이동.
                            }
                        }
                        else{
                            if(confirm("구매하시겠습니까?")){
                                let count=result.list.length;
                                let dto_array=new Array();
                                for(let i=0;i<count;i++){
                                    let dto={"item_id":result.list[i].item_id,"item_nm":result.list[i].item_nm,"item_price":result.list[i].item_price}
                                    dto_array.push(dto);
                                }
                                console.log(dto_array);
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
                },
                error:function(){
                    alert("장바구니가 비어있습니다. 구매하실 물건을 선택해 주세요.");
                    location.href="/psvm/item/item";
                }
            });
        })

    </script>
</head>

<body>
<div class="container">
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
            <li><a href="/psvm/item/item" class="nav-link px-2 link-dark">상점</a></li>
        </ul>
        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
            <input type="search" class="form-control form-control-dark" placeholder="Search..."
                   aria-label="Search">
        </form>
        <div class="text-end">
            <button type="button" class="btn btn-warning me-2">Login</button>
        </div>
    </header>
    <div id="main_bar" style="justify-content: center;text-align: center;">
        <div class="dropdown" style="margin-left: -1rem;">
            <span class="item_menu" onclick="location.href='/psvm/item/item'" style="cursor:hand" onfocus="blur();">상점</span>
            <div class="dropdown-content">
                <div class="category">
                    <a href="/psvm/item/list/스킨" class="skin">스킨</a>
                </div>
                <div class="category">
                    <a href="/psvm/item/list/꾸미기" class="skin">꾸미기</a>
                </div>
            </div>
        </div>
        <span class="item_menu" onclick="location.href='/psvm/item/cart'" style="cursor:hand" onfocus="blur();">장바구니</span>
        <span class="item_menu">포인트사용내역</span>
        <span class="item_menu" onclick="location.href='/psvm/item/chargePoint'" style="cursor:hand" onfocus="blur();">충전샵</span>
        <span class="item_menu">마이페이지</span>
    </div>
    <div class="cartBar"><span style="font-size: 1.6rem; padding: 5rem; font-weight: 500;">장바구니</span><span style="float:right; padding: 0.6rem 10rem 0 0;">장바구니 > 주문완료</span></div>
</div>
<main style="display: flex;justify-content: center;">
    <div id="left_ad"></div>
    <div id="main_container">
        <div class="cartDetail">
            <div class="cart_item">

            </div>
            <div id="cart_detail_price">
            </div>
        </div>
    </div>
    <div id="right_ad"></div>
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
