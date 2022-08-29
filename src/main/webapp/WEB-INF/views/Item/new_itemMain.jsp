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
        $(document).ready(function() {
            var gift;
            var  present =[ 1,2,3 , 4,5,6 ]
            iniGame = function(num){
                gift = num;
                TweenLite.killTweensOf($(".board_on"));
                TweenLite.to($(".board_on"), 0, {css:{rotation:rotationPos[gift]}});
                TweenLite.from($(".board_on"),5, {css:{rotation:-3000}, onComplete:endGame, ease:Sine.easeOut});
                console.log("gift 숫자 : "+ (gift +1) +"rotationPos" + rotationPos );
            }
            var rotationPos = new Array(60,120,180,240,300,360);
            TweenLite.to($(".board_on"), 360, {css:{rotation:-4000}, ease: Linear.easeNone});
            function endGame(){
                var  copImg= "http://img.babathe.com/upload/specialDisplay/htmlImage/2019/test/coupon"+( gift +1) + ".png";
                console.log("이미지 : " + copImg );

                $("#popup_gift .lottery_present" ).text(function( ) {   return "축하드립니다."+present [gift ] + " 룰렛숫장"+ ( gift +1)   + " 당첨 되셨습니다.";    });
                $( '<img  src="' + copImg+ '" />' ).prependTo("#popup_gift .lottery_present");
                setTimeout(function() {openPopup("popup_gift");	}, 1000);
            }

            $(".popup .btn").on("click",function(){
                location.reload();
            });
            function openPopup(id) {
                closePopup();
                $('.popup').slideUp(0);
                var popupid = id
                $('body').append('<div id="fade"></div>');
                $('#fade').css({
                    'filter' : 'alpha(opacity=60)'
                }).fadeIn(300);
                var popuptopmargin = ($('#' + popupid).height()) / 2;
                var popupleftmargin = ($('#' + popupid).width()) / 2;
                $('#' + popupid).css({
                    'margin-left' : -popupleftmargin
                });
                $('#' + popupid).slideDown(500);
            }
            function closePopup() {
                $('#fade').fadeOut(300, function() {
                    // $(".player").html('');
                });
                $('.popup').slideUp(400);
                return false
            }
            $(".close").click(closePopup);

        });
        $(function() {
            var clicked  =0;
            for(i=1; i<7; i++){
                var  pictures = "http://img.babathe.com/upload/specialDisplay/htmlImage/2019/test/coupon"+ i  + ".png";
                $(".board_on").append('<img  src="' + pictures + '" />');
            }

            $(".join").on("mousedown",function(){
                if( clicked <= 0){    iniGame(Math.floor(Math.random() *6));    }
                else  if( clicked >=1 ){    event.preventDefault(); alert( "이벤트 참여 하셨씁니다."); }
                clicked ++
            });
        })

        let toHtml=function(items){
            let tmp="<div class='items'>";
            items.forEach(function(item){
                tmp+='<div class="item-container" item_id='+item.item_id+'>'
                tmp+='<div id="item-img" style="margin-bottom: -24.4px">'
                tmp+='<div class="image-wrap" item_id='+item.item_id+'>'
                tmp+='<img id="item-image" src='+item.item_img+'>'
                tmp+='<button class="add_cart_btn">담기</button>'
                tmp+='</div>'
                tmp+='</div>'
                tmp+=' <div>'
                tmp+='<span class="item_nm">'+item.item_nm+'</span>'
                tmp+='<span class="item_grd">'+item.grd_nm+'</span>'
                tmp+='</div>'
                tmp+='<div class="item_dsc">'+item.item_dsc+'</div>'
                tmp+='<span class="item_price">'+item.item_price+'<span class="point">P</span>'+'</span>'
                tmp+='</div>'
            })
            return tmp+"</div>"
        }
        $(document).ready(function(){
            $("#section").on("click",".add_cart_btn",function(){
                let item_id=$(this).parent().attr("item_id");
                console.log("item_id="+item_id);
                if(confirm("장바구니에 담으시겠습니까?")){
                    $.ajax({
                        type:'POST',
                        url:'/psvm/item/addCart/'+item_id,
                        success:function(result){
                            alert("장바구니에 담겼습니다.");
                            if(confirm("장바구니로 바로 가시겠습니까?")){
                                location.href="/psvm/item/cart";
                            }
                        },
                        error:function(result){
                            alert(result);
                        }
                    })
                }
            });
            $.ajax({
                type:'GET',
                url:'/psvm/item/main',
                success:function(result){
                    console.log(result);
                    //해당 태크가 지우고
                    $('#section').html(toHtml(result));
                },
                error:function(){
                    alert("잠시후 다시 시도해주세요.");
                }
            });
        })
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
<main style="display: flex;">
    <div id="left_ad"></div>
    <div id="main_container">
        <div id="main_bar">
            <div class="dropdown">
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
            <span class="item_menu">충전샵</span>
            <span class="item_menu">마이페이지</span>
        </div>
        <%--    <a href="/psvm/item/cart_main">장바구니</a>--%>
        <div class="banner">
            <div id="event"></div>
            <div id="wrap">
                <div id="gameContainer">
                    <div class="board_start join">시작</div>
                    <div class="board_on obj"></div>
                </div>
                <div id="popup_gift" class="popup">
                    <div class="lottery_present"></div>
                    <a href="javascript:;" class="close">닫기 </a>
                </div>
            </div>
        </div>
        <div id="section">

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
